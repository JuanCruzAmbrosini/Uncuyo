from algo1 import *
import mylinkedlist as List

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

def delete_r (tree : BinaryTree, current : BinaryTreeNode, element):
    if (current.value == element):
        key = current.key
        #CASO DE QUE NO HAYAN HIJOS
        if (current.rightnode == None and current.leftnode == None):
            if current.parent == None:
                tree.root = None
                return key
            else: 
                if current.parent.leftnode == current:
                    current.parent.leftnode = None
                    return key
                elif current.parent.rightnode == current:
                    current.parent.rightnode = None
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
            succesor : BinaryTreeNode = current.rightnode
            while(succesor.leftnode != None):
                succesor = succesor.leftnode
            #SE ELIMINA AL SUCESOR INORDEN
            if succesor.parent.leftnode == succesor:
                 succesor.parent.leftnode = None
            if succesor.parent.rightnode == succesor:
                succesor.parent.rightnode = succesor.rightnode
            #SE REEMPLAZA AL NODO ACTUAL POR EL SUCESOR INORDEN
            if current.parent == None:
                tree.root = succesor
                succesor.rightnode = current.rightnode
                succesor.leftnode = current.leftnode
                succesor.parent = None
                current = None
                return key
            else:
                if succesor == current.rightnode:
                    if current.parent.leftnode == current:
                        current.parent.leftnode = succesor
                    else: 
                        current.parent.leftnode = succesor
                    succesor.parent = current.parent
                    succesor.leftnode = current.leftnode
                    if succesor.leftnode != None:
                        succesor.leftnode.parent = succesor
                else:
                    succesor.rightnode = current.rightnode
                    succesor.leftnode = current.leftnode
                    succesor.parent = current.parent
                    if current.parent.leftnode == current:
                        current.parent.leftnode = succesor
                    if current.parent.rightnode == current:
                        succesor.parent.rightnode = succesor
                return key
            
    else:
        result = None
        if current.leftnode != None:
             result = delete_r(tree, current.leftnode, element) 
        if current.rightnode != None:
             result = delete_r(tree, current.rightnode, element)   
        return result
        
def delete(tree : BinaryTree, element):
    if tree.root == None :
        return None
    else :
        current = tree.root
        return delete_r(tree, current, element)

"""----------------------------------------------------------------------------------------------------------"""

def delete_key_r(tree : BinaryTree, key : int):
    #BUSCAMOS NODO A ELIMINAR
    d_node = search_key(tree, key)
    if d_node == None:
        return None
    else:
        ret_key = d_node.key
        #CASO DE QUE NO HAYAN HIJOS
        if d_node.leftnode == None and d_node.rightnode == None:
            if d_node.parent == None:
                tree.root = None
                return key
            if d_node.parent.leftnode == d_node:
                d_node.parent.leftnode = None
                return ret_key
            if d_node.parent.rightnode == d_node:
                d_node.parent.rightnode = None
                return ret_key
        #CASO DE QUE HAYA UN SOLO HIJO
        #LADO IZQUIERDO
        if d_node.rightnode == None:
            if d_node.parent == None:
                tree.root = d_node.leftnode
                return ret_key
            if d_node.parent.leftnode == d_node:
                d_node.parent.leftnode = d_node.leftnode
                d_node = None
                return ret_key
            if d_node.parent.rightnode == d_node:
                d_node.parent.rightnode = d_node.leftnode
                d_node = None
                return ret_key
        #LADO DERECHO
        if d_node.leftnode == None:
            if d_node.parent == None:
                tree.root = d_node.rightnode
                return ret_key
            if d_node.parent.leftnode == d_node:
                d_node.parent.leftnode = d_node.rightnode
                d_node = None
                return ret_key
            if d_node.parent.rightnode == d_node:
                d_node.parent.rightnode = d_node.rightnode
                d_node = None
                return ret_key
        #CASO DOS HIJOS
        else:
            #BUSCO EL SUCESOR INORDEN
            succesor : BinaryTreeNode = search_inorder_succesor(d_node)
            print(str(succesor.key) + " . " + str(succesor.value))
            #SE ELIMINA AL SUCESOR INORDEN
            if succesor.parent.leftnode == succesor:
                 succesor.parent.leftnode = None
            if succesor.parent.rightnode == succesor:
                succesor.parent.rightnode = succesor.rightnode
            #REEMPLAZO EL NODO A ELIMINAR POR EL SUCESOR INORDEN
            if d_node.parent == None:
                tree.root = succesor
                succesor.leftnode = d_node.leftnode
                succesor.rightnode = d_node.rightnode
                if succesor.leftnode != None:
                    succesor.leftnode.parent = succesor
                if succesor.rightnode != None:
                    succesor.rightnode.parent = succesor
                d_node = None
                return ret_key
            else:
                if succesor == d_node.rightnode:
                    if d_node.parent.leftnode == d_node:
                        d_node.parent.leftnode = succesor
                    else:
                        d_node.parent.rightnode = succesor
                    succesor.parent = d_node.parent
                    succesor.leftnode = d_node.leftnode
                    if succesor.leftnode != None:
                        succesor.leftnode.parent = succesor
                    d_node.leftnode = d_node.rightnode = d_node.parent = None
                else:
                    succesor.rightnode = d_node.rightnode
                    succesor.leftnode = d_node.leftnode
                    succesor.parent = d_node.parent
                    if d_node.parent.leftnode == d_node:
                        d_node.parent.leftnode = succesor
                    if d_node.parent.rightnode == d_node:
                        d_node.parent.rightnode = succesor
                    d_node = None
                return ret_key
                

def deleteKey(tree : BinaryTree, key : int):
    if tree.root == None :
        return None
    else : 
        return delete_key_r(tree, key)

"""----------------------------------------------------------------------------------------------------------"""

def access(tree : BinaryTree, key):
    if tree.root == None :
        return None
    else:
        result = search_key(tree, key)
    if result == None:
        return None
    else:
        return result.value

"""----------------------------------------------------------------------------------------------------------"""

def update(tree, element, key):
    u_node = search_key(tree, key)
    if u_node == None:
        return None
    else:
        u_node.value = element
        return u_node.key

"""----------------------------------------------------------------------------------------------------------"""

def traverseInOrder_r(current : BinaryTreeNode, list : List.LinkedList):
    succesor = search_inorder_succesor(current)
    if succesor == None:
        return list
    else:
        List.add(list, succesor.value)
        return traverseInOrder_r(succesor, list)
    

def traverseInOrder(tree : BinaryTree,):
    if (tree.root == None): 
        return None
    else:
        list = List.LinkedList()
        #BUSCAMOS EL NODO CON LA KEY MÁS CHICA
        start : BinaryTreeNode = tree.root
        while start.leftnode != None:
            start = start.leftnode
        List.add(list, start.value)
        result =  traverseInOrder_r(start, list)
        List.invertList(result)
        return result
            
"""----------------------------------------------------------------------------------------------------------"""

def traverseInPostOrder_r(node : BinaryTreeNode, list):
    if node != None:
        traverseInPostOrder_r(node.leftnode, list)
        traverseInPostOrder_r(node.rightnode, list)
        List.add(list, node.value)

def traverseInPostOrder(tree : BinaryTree):
    list : List.LinkedList = List.LinkedList
    if tree. root == None:
        return None
    else:
        traverseInPostOrder_r(tree.root, list)
        List.invertList(list)
        return list

"""----------------------------------------------------------------------------------------------------------"""

def search_key_r(current : BinaryTreeNode, key):
    if current == None:
        return None
    if current.key == key:
        result = current
    elif current.key > key:
        result = search_key_r(current.leftnode, key)
    else :
        result = search_key_r(current.rightnode, key)
    return result

def search_key (tree : BinaryTree, key : int):
    if tree.root == None:
        return None
    else:
        return search_key_r(tree.root, key)
    
"""----------------------------------------------------------------------------------------------------------"""
        
# Crear el arbol
tree = BinaryTree()

# Nivel 1 (raíz)
tree.root = BinaryTreeNode()
tree.root.key = 8
tree.root.value = "H"

# Nivel 2
tree.root.leftnode = BinaryTreeNode()
tree.root.leftnode.key = 3
tree.root.leftnode.value = "C"
tree.root.leftnode.parent = tree.root

tree.root.rightnode = BinaryTreeNode()
tree.root.rightnode.key = 10
tree.root.rightnode.value = "J"
tree.root.rightnode.parent = tree.root

# Nivel 3
tree.root.leftnode.leftnode = BinaryTreeNode()
tree.root.leftnode.leftnode.key = 1
tree.root.leftnode.leftnode.value = "A"
tree.root.leftnode.leftnode.parent = tree.root.leftnode

tree.root.leftnode.rightnode = BinaryTreeNode()
tree.root.leftnode.rightnode.key = 6
tree.root.leftnode.rightnode.value = "F"
tree.root.leftnode.rightnode.parent = tree.root.leftnode

tree.root.rightnode.rightnode = BinaryTreeNode()
tree.root.rightnode.rightnode.key = 14
tree.root.rightnode.rightnode.value = "N"
tree.root.rightnode.rightnode.parent = tree.root.rightnode

# Nivel 4
tree.root.leftnode.rightnode.leftnode = BinaryTreeNode()
tree.root.leftnode.rightnode.leftnode.key = 4
tree.root.leftnode.rightnode.leftnode.value = "D"
tree.root.leftnode.rightnode.leftnode.parent = tree.root.leftnode.rightnode

tree.root.leftnode.rightnode.rightnode = BinaryTreeNode()
tree.root.leftnode.rightnode.rightnode.key = 7
tree.root.leftnode.rightnode.rightnode.value = "G"
tree.root.leftnode.rightnode.rightnode.parent = tree.root.leftnode.rightnode

tree.root.rightnode.rightnode.leftnode = BinaryTreeNode()
tree.root.rightnode.rightnode.leftnode.key = 13
tree.root.rightnode.rightnode.leftnode.value = "M"
tree.root.rightnode.rightnode.leftnode.parent = tree.root.rightnode.rightnode

"""----------------------------------------------------------------------------------------------------------"""

def search_inorder_succesor(node : BinaryTreeNode):
    if node.rightnode != None:
        node = node.rightnode
        while node.leftnode != None:
            node = node.leftnode
        return node
    parent : BinaryTreeNode = node.parent
    while parent != None and parent.rightnode == node:
        node = parent
        parent = parent.parent
    return parent

"""----------------------------------------------------------------------------------------------------------"""

def print_tree(node : BinaryTreeNode, level = 0, prefix = ""):
    if node != None : 
        print_tree(node.rightnode, level + 1, prefix + "      ")
        print(prefix + "|--" + str(node.value) + "." + str(node.key))
        print_tree(node.leftnode, level + 1, prefix + "      ")

"""----------------------------------------------------------------------------------------------------------"""

print_tree(tree.root)
print("-------------------------------------------------------")
insert(tree, "Z", 26)
print_tree(tree.root)
print("-------------------------------------------------------")
insert(tree, "B", 2)
print_tree(tree.root)
print("-------------------------------------------------------")
insert(tree, "E", 5)
print_tree(tree.root)
print("-------------------------------------------------------")
insert(tree, "O", 15)
print_tree(tree.root)
print("-------------------------------------------------------")