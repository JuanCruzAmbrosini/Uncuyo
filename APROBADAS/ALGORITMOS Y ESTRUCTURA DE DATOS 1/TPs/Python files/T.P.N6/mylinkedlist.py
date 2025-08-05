class LinkedList:
    head = None
    
class Node: 
    value = None
    nextNode = None
    
"""---------------------------------------------------------------------------------------------"""
    
#Orden de complejidad: O(1)
    
def add(lista, elemento):
    if lista.head == None:
        newHead = Node()
        newHead.value = elemento
        lista.head = newHead
    else:
        newHead = Node()
        newHead.value = elemento
        newHead.nextNode = lista.head
        lista.head = newHead
        
"""---------------------------------------------------------------------------------------------"""

#Orden de complejidad: O(n)
#Orden de complejidad arreglo: O(n)

def search(list, element) -> int:
    exist = False
    counter = 0
    current_node = list.head
    while current_node != None:
        if current_node.value == element:
            exist = True
            return counter
        counter = counter + 1
        current_node = current_node.nextNode
    if exist == False:
        return None
    
"""---------------------------------------------------------------------------------------------"""

def searchNode(list, node) -> int:
    exist = False
    counter = 0
    current_node = list.head
    while current_node != None:
        if current_node == node:
            exist = True
            return counter
        counter = counter + 1
        current_node = current_node.nextNode
    if exist == False:
        return None
    
"""---------------------------------------------------------------------------------------------"""

def searchNodeIndex(list, index) -> Node:
    counter = 0
    current_node = list.head
    while current_node is not None:
        if counter == index:
            return current_node
        counter += 1
        current_node = current_node.nextNode
    return None  # índice fuera de rango
    
"""---------------------------------------------------------------------------------------------"""

#Orden de complejidad: O(n)
#Orden de complejidad arreglo: O(n)

def insert(list, element, index):
    if lengthList(list) < index :
        return None
    else:
        current_node = list.head
        new_node = Node()
        new_node.value = element
        if index == 0:
            add(list, element)
            return index
        else: 
            for i in range (1,lengthList(list) + 1):
                    if i == index:
                        new_node.nextNode = current_node.nextNode
                        current_node.nextNode = new_node
                        break
                    current_node = current_node.nextNode
            return index
    
"""---------------------------------------------------------------------------------------------"""

#Orden de complejidad O(n)
#Orden de complejidad arreglo: O(n^2)

def delete(list, element):
    element_position = search(list, element)
    current_node = list.head
    if element_position == None:
        return None
    else:
        if (current_node.value == element):
            list.head = list.head.nextNode
        else:
            while (current_node.nextNode != None):
                if current_node.nextNode.value == element :
                    current_node.nextNode = current_node.nextNode.nextNode
                    break
                current_node = current_node.nextNode
        return element_position

"""---------------------------------------------------------------------------------------------"""

#Orden de complejidad: O(n)

def showList (lista):
    current_node = lista.head
    while current_node != None :
        print(current_node.value," ", end="")
        current_node = current_node.nextNode
    print("")
        
"""---------------------------------------------------------------------------------------------"""

#Orden de complejidad: O(n)

def update (list, element, index):
    current_node = list.head
    size = lengthList(list)
    
    if index > size or index < 0 :
        return None
    for i in range(0, size):
        if i == index:
            current_node.value = element
            return index
        current_node = current_node.nextNode

"""---------------------------------------------------------------------------------------------"""

#Orden de complejidad: O(n)

def access(list, index):
    current_node = list.head
    size = lengthList(list) - 1
    value = None
    
    if index > size or index < 0 :
        return None
    
    for i in range(0, size + 1):
        if i == index:
            value = current_node.value
            return value
        current_node = current_node.nextNode
    return value

"""---------------------------------------------------------------------------------------------"""

#Orden de complejidad: O(n)
#Orden de complejidad arreglo: O(n)

def lengthList(list):
    lenght = 0
    current_node = list.head
    while current_node != None: 
        current_node = current_node.nextNode
        lenght = lenght + 1
    return lenght

"""---------------------------------------------------------------------------------------------"""

def invertList(list):
    prev = None
    current = list.head
    while current != None:
        next_node = current.nextNode
        current.nextNode = prev
        prev = current
        current = next_node
    list.head = prev
    
"""---------------------------------------------------------------------------------------------"""

def isSorted(list : LinkedList):
    if list.head == None:
        return True
    current : Node = list.head
    while current.nextNode != None:
        if current.value > current.nextNode.value:
            return False
        current = current.nextNode
    return True
    
"""---------------------------------------------------------------------------------------------"""

def insertInOrder(list : LinkedList, element):
    size = lengthList(list)
    if list.head == None:
        add(list, element)
    elif list.head.nextNode == None:
        if(list.head.value > element):
            add(list, element)
        else:
            insert(list, element, 1)
    else:
        current : Node = list.head
        while current != None:
            if current.value > element:
                if current == list.head:
                    add(list, element)
                    break
                else:
                    insert(list, element, searchNode(list, current))
                    break
            if current.nextNode == None:
                insert(list, element, size)
                break
            current = current.nextNode

"""---------------------------------------------------------------------------------------------"""

def splitList(list : LinkedList) :
    current : Node = list.head
    counter = 0
    half1 = LinkedList()
    half2 = LinkedList()
    while(current != None):
        if (counter % 2 == 0):
            add(half1, current.value)
        else:
            add(half2, current.value)
        counter += 1
        current = current.nextNode
    return half1, half2

"""---------------------------------------------------------------------------------------------"""

def addLast(list, value):
    new_node = Node()
    new_node.value = value
    new_node.nextNode = None

    if list.head is None:
        list.head = new_node
    else:
        current = list.head
        while current.nextNode is not None:
            current = current.nextNode
        current.nextNode = new_node

"""---------------------------------------------------------------------------------------------"""

def swap (list : LinkedList, pos_from, pos_to):

    length = lengthList(list)
    if list.head == None: 
        return None
    elif (pos_from < 0 or pos_from > length - 1) or (pos_to < 0 or pos_to > length - 1):
        return None
    else:
        nodeA = searchNodeIndex(list, pos_from)
        nodeB = searchNodeIndex(list, pos_to)
        nodeA.value, nodeB.value = nodeB.value, nodeA.value