import threading
import socket
import os
import time

FILE_PORT = 60001


class Server:
    def __init__(self, host):
        self.host = host
        self.port = 60000
        self.server_socket = None
        self.clients = []
        self.users = []

    def start_chat(self):
        self.server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.server_socket.bind((self.host, self.port))
        self.server_socket.listen()

        print(f"Server listening on {self.host}:{self.port}")

        # 1. Iniciar el aceptador de conexiones en un hilo de fondo
        accept_thread = threading.Thread(target=self.accept_connection)
        accept_thread.daemon = True  # Morirá si el main thread (command_loop) termina
        accept_thread.start()

        # 2. Ejecutar el bucle de comandos del admin en el hilo principal
        print("--- Consola de Administrador del Servidor ---")
        print("Comando disponible: shutdown_client <user>")
        self.command_loop()

    def command_loop(self):
        """Bucle del hilo principal para que el admin del servidor escriba comandos."""
        while True:
            try:
                cmd = input("")

                if cmd.startswith("shutdown_client "):
                    user = cmd.split(" ", 1)[1]
                    if user in self.users:
                        print(f"Enviando orden de apagado a {user}...")
                        self.send_to_user(user, "CONTROL:SHUTDOWN")
                    else:
                        print(f"Error: Usuario '{user}' no encontrado.")
                elif cmd.strip() != "":
                    print(f"Comando no reconocido. Comando disponible: shutdown_client <user>")

            except KeyboardInterrupt:
                # Permite salir del servidor con Ctrl+C
                print("\nCerrando servidor...")
                self.server_socket.close()
                break

    def accept_connection(self):
        while True:
            try:
                client_socket, direction = self.server_socket.accept()
                print(f"Nueva conexión desde {str(direction)}")

                client_socket.send("NICK".encode('utf-8'))
                user = client_socket.recv(1024).decode('utf-8')

                self.clients.append(client_socket)
                self.users.append(user)

                print(f"El nickname del usuario es: {user}")
                self.broadcast(f"¡{user} se ha unido al chat!".encode('utf-8'))
                client_socket.send(f"¡Unido al servidor!".encode('utf-8'))

                thread = threading.Thread(target=self.manage_client, args=(client_socket, direction[0], user))
                thread.start()

            except Exception as e:

                break  # Salir del bucle de aceptación

    def broadcast(self, message, _origin_client=None):
        for client in self.clients:
            if client != _origin_client:
                try:
                    client.send(message)
                except:
                    self.delete_client(client)

    def send_to_user(self, user, message):
        try:
            index = self.users.index(user)
            client_socket = self.clients[index]
            client_socket.send(message.encode('utf-8'))
            return True
        except (ValueError, IndexError):
            print(f"Error al enviar a {user}: No encontrado.")
            return False
        except Exception as e:
            print(f"Error al enviar: {e}")
            self.delete_client(client_socket)
            return False

    def manage_client(self, client_socket, client_ip, sender_user):
        while True:
            try:
                message_bytes = client_socket.recv(1024)
                if message_bytes:
                    message = message_bytes.decode('utf-8')

                    if message.startswith("CONTROL:RELAY_REQUEST:"):
                        # Formato: CONTROL:RELAY_REQUEST:<target_user>:<filename>:<size>
                        parts = message.split(":", 4)
                        if len(parts) != 5:
                            print(f"Error: Comando RELAY malformado: {message}")
                            continue

                        target_user = parts[2]
                        filename = parts[3]
                        size = int(parts[4])

                        print(f"--- {sender_user} ({client_ip}) quiere enviar '{filename}' a {target_user} ---")

                        if target_user not in self.users:
                            print(f"Destinatario {target_user} no encontrado. Abortando.")
                            self.send_to_user(sender_user, f"Error: Usuario '{target_user}' no está conectado.")
                            continue

                        temp_filename = f"TEMP_{filename}"
                        if self.download_from_sender(client_ip, FILE_PORT, temp_filename, size):
                            print(
                                f"--- Archivo '{filename}' recibido de {sender_user}. Reenviando a {target_user}... ---")

                            self.relay_to_receiver(target_user, temp_filename, filename, size)

                            os.remove(temp_filename)
                            print(f"--- Relé de '{filename}' completado. Archivo temporal eliminado. ---")
                        else:
                            print(f"--- Falla al descargar '{filename}' de {sender_user}. ---")

                    else:
                        self.broadcast(message_bytes, client_socket)
                else:
                    self.delete_client(client_socket)
                    break
            except:
                self.delete_client(client_socket)
                break

    def download_from_sender(self, ip, port, temp_filename, size):
        file_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

        max_retries = 5
        retry_count = 0
        connected = False

        while not connected and retry_count < max_retries:
            try:
                time.sleep(1)
                file_socket.connect((ip, port))
                connected = True
                print(f"--- Conexión de archivo establecida con emisor (intento {retry_count + 1}) ---")

            except ConnectionRefusedError:
                retry_count += 1
                print(f"--- Intento {retry_count} fallido. Reintentando... ---")

        if not connected:
            print(f"Error al descargar archivo: No se pudo conectar a {ip}:{port} después de {max_retries} intentos.")
            file_socket.close()
            return False

        try:
            with open(temp_filename, 'wb') as f:
                bytes_received = 0
                while bytes_received < size:
                    chunk = file_socket.recv(4096)
                    if not chunk:
                        break
                    f.write(chunk)
                    bytes_received += len(chunk)

            file_socket.close()
            return True

        except Exception as e:
            print(f"Error al descargar archivo: {e}")
            file_socket.close()
            return False

    def relay_to_receiver(self, target_user, temp_filename, original_filename, size):
        try:
            upload_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            upload_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
            upload_socket.bind(('', FILE_PORT))
            upload_socket.listen(1)

            control_message = f"CONTROL:DOWNLOAD:{self.host}:{FILE_PORT}:{original_filename}:{size}"
            if not self.send_to_user(target_user, control_message):
                print(f"No se pudo notificar a {target_user}. Abortando relé.")
                upload_socket.close()
                return

            conn, addr = upload_socket.accept()
            print(f"--- {target_user} se ha conectado para la descarga. Enviando... ---")

            with open(temp_filename, 'rb') as f:
                conn.sendall(f.read())

            conn.close()
            upload_socket.close()
            print(f"--- Archivo enviado a {target_user} con éxito ---")

        except Exception as e:
            print(f"Error al subir archivo a {target_user}: {e}")
            if 'upload_socket' in locals():
                upload_socket.close()

    def delete_client(self, client_socket: socket.socket):
        if client_socket in self.clients:
            index = self.clients.index(client_socket)
            self.clients.remove(client_socket)
            client_socket.close()
            user = self.users[index]
            self.broadcast(f"¡{user} ha abandonado el servidor!".encode('utf-8'))
            self.users.pop(index)


if __name__ == "__main__":
    HOST = '192.168.100.68'  # --- IP DEL SERVIDOR ---
    server = Server(HOST)
    server.start_chat()