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

def search(list, element):
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
    value = None
    
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