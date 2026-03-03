import socket
import threading
import os
import subprocess
import sys
import time

FILE_PORT = 60001


class Client:
    def __init__(self, user, host):
        self.user = user
        self.port = 60000
        self.host = host
        self.client_socket = None

    def connect(self):
        self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        try:
            self.client_socket.connect((self.host, self.port))
        except ConnectionRefusedError:
            print("No se pudo conectar con el servidor. ¿Está en línea?")
            return

        reception_thread = threading.Thread(target=self.receive_message)
        reception_thread.daemon = True
        reception_thread.start()

        self.send_message()

    def receive_message(self):
        while True:
            try:
                message_bytes = self.client_socket.recv(1024)

                # Si no hay bytes, el servidor cerró la conexión
                if not message_bytes:
                    print("--- El servidor ha cerrado la conexión ---")
                    self.client_socket.close()
                    break  # Salir del bucle

                message = message_bytes.decode('utf-8')

                if message == "NICK":
                    self.client_socket.send(self.user.encode('utf-8'))

                elif message == "CONTROL:SHUTDOWN":
                    print("!!! Servidor ha enviado orden de apagado... !!!")
                    self.client_socket.close()
                    if sys.platform == "win32":
                        subprocess.run(["shutdown", "/s", "/t", "1"])
                    else:
                        subprocess.run(["shutdown", "now"])
                    break

                elif message.startswith("CONTROL:DOWNLOAD"):
                    # El servidor nos quiere enviar un archivo
                    parts = message.split(":")
                    ip = parts[2]
                    port = int(parts[3])
                    filename = parts[4]
                    size = int(parts[5])
                    print(f"--- Recibiendo archivo '{filename}' ({size} bytes) desde el servidor ---")

                    download_thread = threading.Thread(target=self.start_file_download, args=(ip, port, filename, size))
                    download_thread.start()

                else:
                    print(message)  # Mensaje de chat normal

            except Exception as e:
                print(f"Ocurrió un error: {e}")
                self.client_socket.close()
                break

    def start_file_download(self, ip, port, filename, size):
        try:
            time.sleep(1)
            file_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            file_socket.connect((ip, port))

            with open(f"RECIBIDO_{filename}", 'wb') as f:
                bytes_received = 0
                while bytes_received < size:
                    chunk = file_socket.recv(4096)
                    if not chunk:
                        break
                    f.write(chunk)
                    bytes_received += len(chunk)

            file_socket.close()
            print(f"--- Archivo '{filename}' recibido con éxito ---")

        except Exception as e:
            print(f"Error al descargar archivo: {e}")

    def start_file_upload(self, filepath, file_port):
        try:
            upload_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            upload_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
            upload_socket.bind(('', file_port))
            upload_socket.listen(1)

            conn, addr = upload_socket.accept()

            with open(filepath, 'rb') as f:
                conn.sendall(f.read())

            conn.close()
            upload_socket.close()
            print(f"--- Archivo enviado con éxito ---")

        except Exception as e:
            print(f"Error al subir archivo: {e}")

    def send_message(self):
        print("Ingresa tus mensajes a continuación: (exit para salir)")
        print("Para enviar un archivo: send_file <usuario_destino> <ruta_del_archivo>")
        while True:
            try:
                message = input("")
                if message.lower() == "exit":
                    break

                if message.startswith("send_file "):
                    parts = message.split(" ", 2)
                    if len(parts) < 3:
                        print("Error: Uso: send_file <usuario_destino> <ruta_del_archivo>")
                        continue

                    target_user = parts[1]
                    filepath = parts[2]

                    if not os.path.exists(filepath):
                        print(f"error: el archivo '{filepath}' no existe")
                        continue

                    filename = os.path.basename(filepath)
                    file_size = os.path.getsize(filepath)

                    # 1. Inicia el servidor de archivos en un hilo (para que el servidor se conecte)
                    upload_thread = threading.Thread(target=self.start_file_upload, args=(filepath, FILE_PORT))
                    upload_thread.start()

                    # 2. Envía el mensaje de control al servidor para que inicie el relé
                    control_message = f"CONTROL:RELAY_REQUEST:{target_user}:{filename}:{file_size}"
                    self.client_socket.send(control_message.encode('utf-8'))

                else:
                    # Mensaje de chat normal
                    complete_message = f"{self.user}: {message}"
                    self.client_socket.send(complete_message.encode('utf-8'))

            except EOFError:
                break
            except Exception as e:
                print(f"Error al enviar: {e}")

        self.client_socket.close()
        print("Desconectado del servidor")


if __name__ == '__main__':
    HOST = '192.168.100.68'  # --- IP DEL SERVIDOR ---
    user = input("Ingresa tu nombre de usuario: ")
    client = Client(user, HOST)
    client.connect()