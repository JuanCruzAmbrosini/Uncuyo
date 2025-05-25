from algo1 import *
import mylinkedlist as List
from binarytree import *
import myqueue as Q

def levelCounter(current : BinaryTreeNode):
    if current == None:
        return 0
    left_level = levelCounter(current.leftnode)
    right_level = levelCounter(current.rightnode)
    if left_level >= right_level:
        return 1 + left_level
    else:
        return 1 + right_level

    
"""----------------------------------------------------------------------------------------------------------"""

def isBalanced (tree : BinaryTree) -> bool:
    leftTreeLevelCount = 0
    rightTreeLevelCount = 0
    if tree.root == None:
        return True
    if tree.root.rightnode == None:
        rightTreeLevelCount = 0
    else:
        rightTreeLevelCount = levelCounter(tree.root.rightnode) - 1
    if tree.root.leftnode == None:
        leftTreeLevelCount = 0
    else:
        leftTreeLevelCount = levelCounter(tree.root.leftnode) - 1
    return abs(leftTreeLevelCount - rightTreeLevelCount) <= 1

"""----------------------------------------------------------------------------------------------------------"""

def isSubTree(treeSon : BinaryTree, treeFather : BinaryTree):
    sizeTreeSon = treeSize(treeSon)
    sizeTreeFather = treeSize(treeFather)
    if sizeTreeFather < sizeTreeSon:
        return False
    else:
        if treeFather.root == treeSon.root :
            auxListFather : List.LinkedList = traverseInOrder(treeFather)
            auxListSon : List.LinkedList = traverseInOrder(treeSon)
            currentFather : List.Node = auxListFather.head
            currentSon : List.Node = auxListSon.head
            while(currentFather != None or currentSon != None):
                if currentFather.value != currentSon.value:
                    return False
                currentFather = currentFather.nextNode
                currentSon = currentSon.nextNode
            return True
        else:
            auxTreeRoot = customSearch(treeFather, treeSon.root.value)
            auxTree = BinaryTree
            auxTree.root = auxTreeRoot
            auxListFather : List.LinkedList = traverseInOrder(auxTree)
            auxListSon : List.LinkedList = traverseInOrder(treeSon)
            currentFather : List.Node = auxListFather.head
            currentSon : List.Node = auxListSon.head
            while(currentFather != None and currentSon != None):
                if currentFather.value != currentSon.value:
                    return False
                currentFather = currentFather.nextNode
                currentSon = currentSon.nextNode
            return True

"""----------------------------------------------------------------------------------------------------------"""

def customSearch_r(current : BinaryTreeNode, element):
    if current.value == element:
        return current
    else:
        if current.rightnode != None :
            result = customSearch_r(current.rightnode, element)
            if result != None:
                return result
        if current.leftnode != None :
            result = customSearch_r(current.leftnode, element)
            if result != None:
                return result
    return None

def customSearch (tree : BinaryTree, element : int):
    current = tree.root
    if tree.root == None:
        return None
    else:
        return customSearch_r(current, element)
    
"""----------------------------------------------------------------------------------------------------------"""

def isBST(tree : BinaryTree):
    if tree.root == None:
        return True
    else :
        aux_list : List.LinkedList = traverseInOrderKey(tree)
        current : List.Node = aux_list.head
        while(current.nextNode != None):
            if current.value >= current.nextNode.value : 
                return False
            current = current.nextNode
        return True

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

tree2 = BinaryTree()

tree2.root = BinaryTreeNode()
tree2.root.key = 8
tree2.root.value = "R"

tree2.root.leftnode = BinaryTreeNode()
tree2.root.leftnode.key = 4
tree2.root.leftnode.value = "S"
tree2.root.leftnode.parent = tree2.root

tree2.root.rightnode = BinaryTreeNode()
tree2.root.rightnode.key = 2  # ← violación: menor que 8 a la derecha
tree2.root.rightnode.value = "T"
tree2.root.rightnode.parent = tree2.root

tree2.root.leftnode.leftnode = BinaryTreeNode()
tree2.root.leftnode.leftnode.key = 9  # ← violación: mayor que 4 a la izquierda
tree2.root.leftnode.leftnode.value = "U"
tree2.root.leftnode.leftnode.parent = tree2.root.leftnode

tree2.root.leftnode.rightnode = BinaryTreeNode()
tree2.root.leftnode.rightnode.key = 1
tree2.root.leftnode.rightnode.value = "V"
tree2.root.leftnode.rightnode.parent = tree2.root.leftnode

tree2.root.rightnode.leftnode = BinaryTreeNode()
tree2.root.rightnode.leftnode.key = 3
tree2.root.rightnode.leftnode.value = "W"
tree2.root.rightnode.leftnode.parent = tree2.root.rightnode

tree2.root.rightnode.rightnode = BinaryTreeNode()
tree2.root.rightnode.rightnode.key = 10
tree2.root.rightnode.rightnode.value = "X"
tree2.root.rightnode.rightnode.parent = tree2.root.rightnode

"""----------------------------------------------------------------------------------------------------------"""

print_tree(tree2.root)
print("----------------------------------------------------------------------------------------")
print("Es BST: " + str(isBST(tree2)))