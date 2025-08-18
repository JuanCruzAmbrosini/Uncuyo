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

     if counter == len(word): 
         
          return True
     
     else: 

          return False

"""------------------------------------------------------------------------------------------------"""



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

print_trie(trie.root)
insert(trie, "alas")
insert(trie, "amor")
insert(trie, "alto")
insert(trie, "arca")
insert(trie, "bebe")
insert(trie, "beso")
insert(trie, "bicicleta")
insert(trie, "bueno")
insert(trie, "buenisimo")
insert(trie, "casa")
insert(trie, "diablo")
insert(trie, "eco")
print("---------------------------------------------------------------------------")
insert(trie, "flash")
print_trie(trie.root)
print("---------------------------------------------------------------------------")
print(search(trie, "alas"))
print(search(trie, "esteban"))
print(search(trie, "eco"))
print(search(trie, "casino"))
print(search(trie, "casamiento"))