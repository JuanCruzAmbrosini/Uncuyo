import socket
import threading

class client : 
    def __init__(self, user, host):
        self.user = user
        self.port = 60000
        self.host = host
        self.client_socket = None
        
    def connect (self) : 
        self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        try : 
            self.client_socket.connect((self.host, self.port))
        except ConnectionRefusedError : 
            print("No se pudo conectar con el servidor. ¿Está en línea?")
            return
        
        reception_thread = threading.Thread(target = self.recive_message)
        reception_thread.daemon = True
        reception_thread.start()
        
        self.send_message()
        
    def recive_message(self):
        while True:
            try : 
                message = self.client_socket.recv(1024).decode('utf-8')
                if message == "NICK" : 
                    self.client_socket.send(self.user.encode('utf-8'))
                else:
                    print(message)
            except Exception as e: 
                print(f"Ocurrió un error: {e}")
                self.client_socket.close()
                break
                
    def send_message(self) : 
        print("Ingresa tus mensajes a continuación: (exit para salir)")
        while True :
            try:  
                message = input("")
                if message.lower() == "exit" :
                    break
                
                complete_message = f"{self.user}: {message}"
                self.client_socket.send(complete_message.encode('utf-8'))
                
            except EOFError :
                break
            except Exception as e : 
                print(f"Error al enviar: {e}")
            
        self.client_socket.close()
        print("Desconectado del servidor")
        
if __name__ == '__main__' : 
    HOST = '192.168.100.68'
    user = input("Ingresa tu nombre de usuario: ")
    client = client(user, HOST)
    client.connect()    
    