class AVL_node:
    def __init__(self, key, bf=0):
        self.value = None
        self.key = key
        self.bf = bf
        self.left_node = None
        self.right_node = None
        self.parent = None

class AVL_tree:
    def __init__(self):
        self.root = None
    
"""

Ejercicio 1:
rotateLeft(tree, avlNode)
return = newRoot

"""    

def rotate_left(tree : AVL_tree, node : AVL_node):
    
    if node.bf < -1 : 
        new_root : AVL_node = node.right_node
        parent : AVL_node = node.parent
        #Caso de que node no tenga padre
        if parent == None:
            tree.root = new_root
        else:
        #Caso de que node sea un hijo derecho
            if parent.right_node == node:
                #Cambio el vinculo entre el pardre de node y se lo doy a new_root
                parent.right_node = new_root
                new_root.parent = parent
            #Caso de que node sea un hijo izquierdo
            if parent.left_node == node:
                #Cambio el vinculo entre el pardre de node y se lo doy a new_root
                parent.left_node = new_root
                new_root.parent = parent
            
        #Caso de que el new_root tenga un sub-arbol izquierdo
        node.right_node = new_root.left_node
        if new_root.left_node != None:
            #Reasigno el arbol izquierdo de new_root y se lo coloco a node
            node.right_node.parent = node
            
        #Ahora hacemos la rotación
        new_root.left_node = node
        node.parent = new_root
        
        return new_root
    
    else:
         
        return None

"""--------------------------------------------------------------------------------------------------------------------------------------"""    

def rotate_right(tree : AVL_tree, node : AVL_node):
    
    if node.bf > 1 : 
        new_root : AVL_node = node.left_node
        parent : AVL_node = node.parent
        #Caso de que node no tenga padre
        if parent == None:
            tree.root = new_root
        else:
        #Caso de que node sea un hijo derecho
            if parent.right_node == node:
                #Cambio el vinculo entre el pardre de node y se lo doy a new_root
                parent.right_node = new_root
                new_root.parent = parent
            #Caso de que node sea un hijo izquierdo
            if parent.left_node == node:
                #Cambio el vinculo entre el pardre de node y se lo doy a new_root
                parent.left_node = new_root
                new_root.parent = parent
            
        #Caso de que el new_root tenga un sub-arbol derecho
        node.left_node = new_root.right_node
        if new_root.right_node != None:
            #Reasigno el arbol derecho de new_root y se lo coloco a node
            node.left_node.parent = node
            
        #Ahora hacemos la rotación
        new_root.right_node = node
        node.parent = new_root
        
        return new_root
    
    else:
         
        return None

"""--------------------------------------------------------------------------------------------------------------------------------------"""    

# ==== Función para imprimir el árbol (en orden) ====
def print_tree(node : AVL_node, level = 0, prefix = ""):
    if node != None : 
        print_tree(node.right_node, level + 1, prefix + "      ")
        print(prefix + "|--" + str(node.value) + "." + str(node.key))
        print_tree(node.left_node, level + 1, prefix + "      ")

# ==== Caso de prueba ====
tree = AVL_tree()

# Creamos el árbol:
#       30
#      /
#     20
#    /
#   10
#
# bf de 30 = +2 (necesita rotación derecha)

n30 = AVL_node(30, bf=2)
n20 = AVL_node(20, bf=1)
n10 = AVL_node(10, bf=0)

tree.root = n30
n30.left_node = n20
n20.parent = n30

n20.left_node = n10
n10.parent = n20

# Antes de la rotación
print("Árbol antes de la rotación:")
print_tree(tree.root)

# Rotación izquierda en el nodo 10
rotate_right(tree, n30)

# Después de la rotación
print("\nÁrbol después de la rotación:")
print_tree(tree.root)
    
