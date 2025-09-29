class TrieNode:
    def __init__(self, key=None, parent=None):
        self.parent = parent
        self.children = []
        self.key = key
        self.isEndOfWord = False

class Trie:
    def __init__(self):
        self.root = TrieNode()

"""------------------------------------------------------------------------------------------------"""

def insert(trie : Trie, word : str):
       
     current : TrieNode = trie.root
     flag = False
     counter = 0
     
     if current.children is None: 
          current.children = []

     for i in range (0, len(word)):

          flag = False

          for j in range(0, len(current.children)):
                    
               if word[i] == current.children[j].key:
                          
                    current = current.children[j]
                    flag = True
                    counter += 1
                    break

          if not flag:

               new_node = TrieNode(word[i], current)
               current.children.append(new_node)
               current = new_node

     if counter != len(word): 
         
          new_node.isEndOfWord = True
     
     else: 

          if current.isEndOfWord : 
               print("La palabra ya existe.")
          else : 
               current.isEndOfWord = True

"""------------------------------------------------------------------------------------------------"""

def search(trie : Trie ,word : str) : 

     current : TrieNode = trie.root
     flag = False
     counter = 0

     for i in range (0, len(word)):

          flag = False

          for j in range(0, len(current.children)):
                    
               if word[i] == current.children[j].key:
                          
                    current = current.children[j]
                    flag = True
                    counter += 1
                    break

          if not flag:
               return False


     if counter == len(word) and current.isEndOfWord: 
         
          return True
     
     else: 

          return False

"""------------------------------------------------------------------------------------------------"""

def delete(trie: Trie, word: str):
    current = trie.root

    # Buscar la palabra
    for char in word:
        found = False
        for child in current.children:
            if child.key == char:
                current = child
                found = True
                break
        if not found:
            # La palabra no existe
            return False

    # La palabra existe: marcar fin de palabra
    current.isEndOfWord = False

    # Eliminar nodos hacia arriba si son hojas y no fin de otra palabra
    while current.parent and not current.isEndOfWord and len(current.children) == 0:
        parent = current.parent
        parent.children.remove(current)
        current = parent

    return True

"""------------------------------------------------------------------------------------------------"""

# --- Armamos el Trie manualmente ---
trie = Trie()

def print_trie(node: TrieNode, prefix="", is_last=True):
    # Prefijo para las ramas
    connector = "└── " if is_last else "├── "

    # No mostramos la raíz vacía
    if node.key is not None:
        end_marker = " *" if node.isEndOfWord else ""
        print(prefix + connector + node.key + end_marker)

    # Prefijo para los hijos (mantiene el dibujo)
    new_prefix = prefix + ("    " if is_last else "│   ")

    # Recorremos los hijos
    for i, child in enumerate(node.children):
        is_child_last = (i == len(node.children) - 1)
        print_trie(child, new_prefix, is_child_last)

"""print_trie(trie.root)
insert(trie, "alas")
insert(trie, "amor")
insert(trie, "alto")
insert(trie, "arca")
insert(trie, "bebo")
insert(trie, "beso")
insert(trie, "bicicleta")
insert(trie, "bueno")
insert(trie, "buenisimo")
insert(trie, "casa")
insert(trie, "casamiento")
print("---------------------------------------------------------------------------")
print("=== Estado inicial ===")
print_trie(trie.root)

# --- Búsquedas ---
print("\n=== Búsquedas ===")
print("alas:", search(trie, "alas"))
print("bueno:", search(trie, "bueno"))
print("casamiento:", search(trie, "casamiento"))
print("alasa:", search(trie, "alasa"))
print("buenazo:", search(trie, "buenazo"))
print("cas:", search(trie, "cas"))

# --- Borrados ---
print("\n=== Borrado 'alas' (palabra hoja) ===")
delete(trie, "alas")
print_trie(trie.root)

print("\n=== Borrado 'casa' (prefijo de otra) ===")
delete(trie, "casa")
print_trie(trie.root)

print("\n=== Borrado 'casamiento' (última de la rama) ===")
delete(trie, "casamiento")
print_trie(trie.root)

print("\n=== Borrado 'bueno' (deja 'buenisimo') ===")
delete(trie, "bueno")
print_trie(trie.root)

print("\n=== Borrado 'perro' (no existe) ===")
delete(trie, "perro")
print_trie(trie.root)

print("\n=== Estado final ===")
print_trie(trie.root)"""