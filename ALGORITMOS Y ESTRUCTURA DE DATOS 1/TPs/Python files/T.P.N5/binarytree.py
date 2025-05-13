from algo1 import *
from mylinkedlist import *

class BinaryTree:
    root=None
    
class BinaryTreeNode:
    key : int =None
    value = None
    leftnode = None
    rightnode = None
    parent = None
    
"""----------------------------------------------------------------------------------------------------------"""

def search_R(current : BinaryTreeNode, element):
    if current.value == element:
        return current.key
    else:
        if current.rightnode != None :
            result = search_R(current.rightnode, element)
            if result != None:
                return result
        if current.leftnode != None :
            result = search_R(current.leftnode, element)
            if result != None:
                return result
    return None

def search (tree : BinaryTree, element : int):
    current = tree.root
    if tree.root == None:
        return None
    else:
        return search_R(current, element)
        
"""----------------------------------------------------------------------------------------------------------"""

"""insert(B,element,key)
Descripción: Inserta un elemento con una clave determinada del TAD
árbol binario.
Entrada: el árbol B sobre el cual se quiere realizar la inserción
(BinaryTree), el valor del elemento (element) a insertar y la clave
(key) con la que se lo quiere insertar.
Salida: Si pudo insertar con éxito devuelve la key donde se inserta el
elemento. En caso contrario devuelve None."""

def insert_R(current : BinaryTreeNode, element, key):
    if key < current.key:
        if current.leftnode == None:
            new_node = BinaryTreeNode()
            new_node.key = key
            new_node.value = element
            new_node.parent = current
            current.leftnode = new_node
            return key
        else : 
            return insert_R(current.leftnode, element, key)
    elif key > current.key:
        if current.rightnode == None:
            new_node = BinaryTreeNode()
            new_node.key = key
            new_node.value = element
            new_node.parent = current
            current.rightnode = new_node
            return key
        else : 
            return insert_R(current.rightnode, element, key)
    else:
        return None

def insert (tree : BinaryTree, element, key : int):
        if tree.root == None:
            new_root = BinaryTreeNode()
            new_root.key = key
            new_root.value = element
            tree.root = new_root
            return key
        else:
            current = tree.root
            return insert_R(current, element, key)

"""----------------------------------------------------------------------------------------------------------"""
        
# Crear el árbol
tree = BinaryTree()

# Nivel 1
tree.root = BinaryTreeNode()
tree.root.key = 1
tree.root.value = "A"

# Nivel 2
tree.root.leftnode = BinaryTreeNode()
tree.root.leftnode.key = 2
tree.root.leftnode.value = "B"
tree.root.leftnode.parent = tree.root

tree.root.rightnode = BinaryTreeNode()
tree.root.rightnode.key = 3
tree.root.rightnode.value = "C"
tree.root.rightnode.parent = tree.root

# Nivel 3
tree.root.leftnode.leftnode = BinaryTreeNode()
tree.root.leftnode.leftnode.key = 4
tree.root.leftnode.leftnode.value = "D"
tree.root.leftnode.leftnode.parent = tree.root.leftnode

tree.root.leftnode.rightnode = BinaryTreeNode()
tree.root.leftnode.rightnode.key = 5
tree.root.leftnode.rightnode.value = "E"
tree.root.leftnode.rightnode.parent = tree.root.leftnode

tree.root.rightnode.leftnode = BinaryTreeNode()
tree.root.rightnode.leftnode.key = 6
tree.root.rightnode.leftnode.value = "F"
tree.root.rightnode.leftnode.parent = tree.root.rightnode

tree.root.rightnode.rightnode = BinaryTreeNode()
tree.root.rightnode.rightnode.key = 7
tree.root.rightnode.rightnode.value = "G"
tree.root.rightnode.rightnode.parent = tree.root.rightnode

# Nivel 4
tree.root.leftnode.leftnode.leftnode = BinaryTreeNode()
tree.root.leftnode.leftnode.leftnode.key = 8
tree.root.leftnode.leftnode.leftnode.value = "H"
tree.root.leftnode.leftnode.leftnode.parent = tree.root.leftnode.leftnode

tree.root.leftnode.leftnode.rightnode = BinaryTreeNode()
tree.root.leftnode.leftnode.rightnode.key = 9
tree.root.leftnode.leftnode.rightnode.value = "I"
tree.root.leftnode.leftnode.rightnode.parent = tree.root.leftnode.leftnode

tree.root.leftnode.rightnode.leftnode = BinaryTreeNode()
tree.root.leftnode.rightnode.leftnode.key = 10
tree.root.leftnode.rightnode.leftnode.value = "J"
tree.root.leftnode.rightnode.leftnode.parent = tree.root.leftnode.rightnode

tree.root.leftnode.rightnode.rightnode = BinaryTreeNode()
tree.root.leftnode.rightnode.rightnode.key = 11
tree.root.leftnode.rightnode.rightnode.value = "K"
tree.root.leftnode.rightnode.rightnode.parent = tree.root.leftnode.rightnode

tree.root.rightnode.leftnode.leftnode = BinaryTreeNode()
tree.root.rightnode.leftnode.leftnode.key = 12
tree.root.rightnode.leftnode.leftnode.value = "L"
tree.root.rightnode.leftnode.leftnode.parent = tree.root.rightnode.leftnode

tree.root.rightnode.leftnode.rightnode = BinaryTreeNode()
tree.root.rightnode.leftnode.rightnode.key = 13
tree.root.rightnode.leftnode.rightnode.value = "M"
tree.root.rightnode.leftnode.rightnode.parent = tree.root.rightnode.leftnode

tree.root.rightnode.rightnode.leftnode = BinaryTreeNode()
tree.root.rightnode.rightnode.leftnode.key = 14
tree.root.rightnode.rightnode.leftnode.value = "N"
tree.root.rightnode.rightnode.leftnode.parent = tree.root.rightnode.rightnode

tree.root.rightnode.rightnode.rightnode = BinaryTreeNode()
tree.root.rightnode.rightnode.rightnode.key = 15
tree.root.rightnode.rightnode.rightnode.value = "O"
tree.root.rightnode.rightnode.rightnode.parent = tree.root.rightnode.rightnode
"""----------------------------------------------------------------------------------------------------------"""

def print_tree(node : BinaryTreeNode, level = 0, prefix = ""):
    if node != None : 
        print_tree(node.rightnode, level + 1, prefix + "      ")
        print(prefix + "|--" + str(node.value))
        print_tree(node.leftnode, level + 1, prefix + "      ")

"""----------------------------------------------------------------------------------------------------------"""

print_tree(tree.root)
key = search(tree, "D")
print(key)
key2 = insert(tree, "Z", 1.5)
print_tree(tree.root)
print(key2)
