import json
import threading
import logging
from websocket_server import WebsocketServer

# --- Configuración ---
HOST = '0.0.0.0'  # Escucha en todas las interfaces
PORT = 9001       # Puerto para el Websocket
VOTOS_FILE = 'votos.json' # Archivo de persistencia (mismo que usa PHP)

# Variable global para guardar los votos en memoria
votes = {}
# Un candado (Lock) para evitar que dos hilos escriban el archivo al mismo tiempo
file_lock = threading.Lock()

# --- Funciones de Ayuda (para leer/escribir el JSON) ---

def load_votes():
    """Carga los votos desde votos.json al iniciar el servidor."""
    global votes
    with file_lock:
        try:
            with open(VOTOS_FILE, 'r') as f:
                votes = json.load(f)
                print(f"Votos cargados desde {VOTOS_FILE}: {votes}")
        except FileNotFoundError:
            print(f"Advertencia: {VOTOS_FILE} no encontrado. Creando uno nuevo.")
            votes = {
                "boca": 0, "river": 0, "independiente": 0,
                "racing": 0, "sanlorenzo": 0, "otro": 0
            }
            save_votes() # Llama a save_votes para crear el archivo
        except json.JSONDecodeError:
            print(f"Error: {VOTOS_FILE} está corrupto. Reiniciando votos.")
            votes = {
                "boca": 0, "river": 0, "independiente": 0,
                "racing": 0, "sanlorenzo": 0, "otro": 0
            }
            save_votes()

def save_votes():
    """Guarda el estado actual de 'votes' en el archivo JSON."""
    # Esta función asume que file_lock YA ha sido adquirido
    try:
        with open(VOTOS_FILE, 'w') as f:
            json.dump(votes, f, indent=4)
    except Exception as e:
        print(f"Error al guardar votos: {e}")

# --- Funciones de Callback del Websocket ---

# Se llama cuando un nuevo cliente (navegador) se conecta
def new_client(client, server):
    print(f"Nuevo cliente conectado: {client['id']}")
    # --- CORRECCIÓN (Anti-Deadlock) ---
    # Los votos ya están en la variable global 'votes'.
    # ¡NO llames a load_votes() aquí!
    # Solo envía el estado actual de los votos al nuevo cliente.
    server.send_message(client, json.dumps(votes))

# Se llama cuando un cliente se desconecta
def client_left(client, server):
    # --- CORRECCIÓN (Anti-Crash) ---
    # Si la conexión falla antes del handshake, 'client' puede ser None.
    # Añadimos una comprobación para evitar el TypeError.
    if client:
        print(f"Cliente desconectado: {client['id']}")
    else:
        print("Un cliente (conexión fallida) se ha desconectado.")

# Se llama cuando un cliente envía un mensaje (¡un voto!)
def message_received(client, server, message):
    print(f"Voto recibido de {client['id']}: {message}")
    
    # Usamos el candado para asegurar que solo un hilo modifique el archivo a la vez
    with file_lock:
        # 'message' es la opción votada (ej. "boca")
        if message in votes:
            # 1. Contabiliza el voto en la memoria
            votes[message] += 1
            # 2. Guarda el nuevo total en el archivo
            save_votes()
            
            # 3. Prepara el mensaje de broadcast
            broadcast_data = json.dumps(votes)
        else:
            # El cliente envió algo inválido, no hacemos nada
            print(f"Voto inválido: {message}")
            return
            
    # 4. Envía los nuevos resultados a TODOS los clientes conectados
    server.send_message_to_all(broadcast_data)

# --- Bloque Principal ---
if __name__ == "__main__":
    # 1. Carga los votos del archivo UNA SOLA VEZ al arrancar
    load_votes()

    # 2. Configura e inicia el servidor de Websocket
    server = WebsocketServer(host=HOST, port=PORT, loglevel=logging.INFO)
    server.set_fn_new_client(new_client)
    server.set_fn_client_left(client_left)
    server.set_fn_message_received(message_received)
    
    print(f"Servidor Websocket iniciado en ws://{HOST}:{PORT}")
    server.run_forever()
