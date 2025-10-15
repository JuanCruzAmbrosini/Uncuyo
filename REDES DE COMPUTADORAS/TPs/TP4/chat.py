import socket
import threading

class UDPChat:
    def __init__(self):
        self.port = 60000
        self.user = input("Ingresa tu usuario: ")
        self.broadcast = "255.255.255.255"
        self.socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.socket.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
        self.socket.bind(("10.65.1.232", self.port))
        self.active = True
    
def recive_message(chat : UDPChat):
    while chat.active:
        buffer = chat.socket.recvfrom(1500)
        data = buffer[0].decode() 
        address = buffer[1][0]
        
        if ":" in data:
            remote_user, message = data.split(":", 1)
                     
            if message == "nuevo":
                print(remote_user, "", address, " se ha unido al chat")
            elif message == "exit":
                print(remote_user, "", address, " ha abandonado el chat")
            else : 
                print(remote_user, "", address, ": ", message)
                
                
def send_message(chat: UDPChat):
    chat.socket.sendto((chat.user + ":nuevo").encode(), (chat.broadcast, chat.port))
    while chat.active:
        message_0 = input("> ")
        message = chat.user + ":" + message_0
        chat.socket.sendto(message.encode(), (chat.broadcast, chat.port))
        if message_0 == "exit":
            chat.active = False
            chat.socket.close()
            print("Chat finalizado")

chat = UDPChat()
thread_send = threading.Thread(target = send_message, args = (chat,)) 
thread_recive = threading.Thread(target = recive_message, args = (chat,))
thread_recive.daemon = True

thread_recive.start()
thread_send.start()



