import threading
import socket

class server:
    def __init__(self, host):
        self.host = host
        self.port = 60000
        self.server_socket = None
        self.clients = []
        self.users = []
        
    def start_chat(self):
        self.server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)  # Setea el socket para que siga el protocolo TCP
        
        self.server_socket.bind((self.host, self.port))  # Bindea el socket al puerto y al IP solicitado
        self.server_socket.listen()  # Espera conexiones 
        
        print(f"Server listening on {self.host}:{self.port}")
        self.accept_connection ()
        
    def accept_connection (self) : 
        while True :
            
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
                
                thread = threading.Thread(target = self.manage_client, args = (client_socket, ))
                thread.start()
            
            except Exception as e:
                print(f"Conexión fallida: {e}")
                break
    
    def broadcast(self, message, _origin_client = None):
        for client in self.clients : 
            if client != _origin_client:
                try:
                    client.send(message)
                except:
                    self.delete_client(client)
                    
    def manage_client(self, client_socket):
        while True:
            try :
                message = client_socket.recv(1024)
                if message : 
                    self.broadcast(message, client_socket)
                else:
                    self.delete_client(client_socket)
                    break
            except : 
                self.delete_client(client_socket)
                break
            
    def delete_client(self, client_socket : socket.socket): 
        if client_socket in self.clients : 
            index = self.clients.index(client_socket)
            self.clients.remove(client_socket)
            client_socket.close()
            user = self.users[index]
            self.broadcast(f"¡{user} ha abandonado el servidor!".encode('utf-8'))
            self.users.pop(index)
            
if __name__ == "__main__":
    HOST = '192.168.100.68'
    server = server(HOST)
    server.start_chat()