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

def search_r(current : BinaryTreeNode, element):
    if current.value == element:
        return current.key
    else:
        if current.rightnode != None :
            result = search_r(current.rightnode, element)
            if result != None:
                return result
        if current.leftnode != None :
            result = search_r(current.leftnode, element)
            if result != None:
                return result
    return None

def search (tree : BinaryTree, element : int):
    current = tree.root
    if tree.root == None:
        return None
    else:
        return search_r(current, element)
        
"""----------------------------------------------------------------------------------------------------------"""

def insert_r(current : BinaryTreeNode, element, key):
    if key < current.key:
        if current.leftnode == None:
            new_node = BinaryTreeNode()
            new_node.key = key
            new_node.value = element
            new_node.parent = current
            current.leftnode = new_node
            return key
        else : 
            return insert_r(current.leftnode, element, key)
    elif key > current.key:
        if current.rightnode == None:
            new_node = BinaryTreeNode()
            new_node.key = key
            new_node.value = element
            new_node.parent = current
            current.rightnode = new_node
            return key
        else : 
            return insert_r(current.rightnode, element, key)
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
            return insert_r(current, element, key)

"""----------------------------------------------------------------------------------------------------------"""

"""delete(B,element)
Descripción: Elimina un elemento del TAD árbol binario.
Poscondición: Se debe desvincular el Node a eliminar.
Entrada: el árbol binario B sobre el cual se quiere realizar la
eliminación (BinaryTree) y el valor del elemento (element) a eliminar.
Salida: Devuelve clave (key) del elemento a eliminar. Devuelve None si
el elemento a eliminar no se encuentra."""

def delete_r (tree : BinaryTree, current : BinaryTreeNode, element):
    if (current.value == element):
        key = current.key
        #CASO DE QUE NO HAYAN HIJOS
        if (current.rightnode == None and current.leftnode == None):
            if current.parent == None:
                tree.root = None
                return key
            else: 
                if current.key > current.parent.key:
                    current.parent.rightnode = None
                    return key
                elif current.key < current.parent.key:
                    current.parent.leftnode = None
                    return key
                else : 
                    return None
        #CASO DE QUE HAYA UN SOLO HIJO
        #CASO HIJO IZQUIERDO
        elif current.rightnode == None :
            if current.parent == None:
                tree.root = current.leftnode
                return key
            else: 
                if current.key > current.parent.key:
                    current.parent.rightnode = current.leftnode
                    current.leftnode.parent = current.parent
                    return key
                elif current.key < current.parent.key:
                    current.parent.leftnode = current.leftnode
                    current.rightnode.parent = current.parent
                    return key
                else : 
                    return None
        #CASO HIJO DERECHO
        elif current.leftnode == None :
            if current.parent == None:
                tree.root = current.rightnode
                return key
            else: 
                if current.key > current.parent.key:
                    current.parent.rightnode = current.rightnode
                    return key
                elif current.key < current.parent.key:
                    current.parent.leftnode = current.rightnode
                    return key
                else : 
                    return None
        #CASO DE QUE HAYAN DOS HIJOS
        else : 
            #SE BUSCA AL SUCESOR INORDEN
            aux_node : BinaryTreeNode = current.rightnode
            while(aux_node.leftnode != None):
                aux_node = aux_node.leftnode 
            #SE ELIMINA AL SUCESOR INORDEN
            """if aux_node != current.rightnode:
                if aux_node.key > aux_node.parent.key:
                    aux_node.parent.rightnode = None    
                elif aux_node.key < aux_node.parent.key:
                    aux_node.parent.leftnode = None"""
            if aux_node != current.rightnode:
            # Si el sucesor no es el hijo derecho de current
            # Conectar el hijo derecho del sucesor al padre del sucesor
                if aux_node.rightnode != None:
                    aux_node.rightnode.parent = aux_node.parent
                if aux_node.parent.leftnode == aux_node:
                    aux_node.parent.leftnode = aux_node.rightnode
                else:
                    aux_node.parent.rightnode = aux_node.rightnode
            #SE REEMPLAZA AL NODO ACTUAL POR EL SUCESOR INORDEN
            """if current.parent == None:
                aux_node.rightnode = current.rightnode
                aux_node.leftnode = current.leftnode
                current.leftnode.parent = aux_node
                current.rightnode.parent = aux_node
                tree.root = aux_node
                current = None
                return key
            else: 
                if aux_node != current.rightnode:
                    aux_node.rightnode = current.rightnode
                else:
                 # No tocar el rightnode porque ya es él mismo
                    pass
                aux_node.leftnode = current.leftnode
                if current.leftnode != None:
                    current.leftnode.parent = aux_node
                if current.rightnode != None:
                    current.rightnode.parent = aux_node
                aux_node.parent = current.parent
                current = None
                return key"""
                
            if current.parent == None:
                # Si current es la raíz, el sucesor se convierte en la nueva raíz
                tree.root = aux_node
            else:
                # Si current no es la raíz, se ajusta el padre
                if current.parent.leftnode == current:
                    current.parent.leftnode = aux_node
                else:
                    current.parent.rightnode = aux_node

            # Ahora ajustamos los punteros del sucesor
            aux_node.leftnode = current.leftnode
            if current.leftnode != None:
                current.leftnode.parent = aux_node

            aux_node.rightnode = current.rightnode
            if current.rightnode != None:
                current.rightnode.parent = aux_node

            # Ajustamos el padre del sucesor
            aux_node.parent = current.parent

            # Finalmente, eliminamos el nodo original
            current = None

    #SE IMPLEMENTA LA RECURSIÓN EN EL CASO DE NO ENCONTRAR UN VALOR SIMILAR
    else:
        if element < current.value and current.leftnode:
            return delete_r(tree, current.leftnode, element)
        elif element > current.value and current.rightnode:
            return delete_r(tree, current.rightnode, element)   
        
def delete(tree : BinaryTree, element):
    if tree.root == None :
        return None
    else :
        current = tree.root
        return delete_r(tree, current, element)

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
print("-------------------------------------------------------")
delete(tree,"F")
delete(tree,"C")
delete(tree,"M")
delete(tree,"A")
delete(tree,"K")
delete(tree,"O")
print_tree(tree.root)

