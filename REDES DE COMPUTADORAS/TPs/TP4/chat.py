import socket
import threading

class UPDChat:
    def __init__(self):
        self.user = input("Ingrese su nombre de usuario: ")
        self.port = 60000
        self.broadcast_ip = "255.255.255.255"
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.sock.bind(("", self.port))
        self.running = True

    def receive_messages(self):
        while self.running:
            try:
                

