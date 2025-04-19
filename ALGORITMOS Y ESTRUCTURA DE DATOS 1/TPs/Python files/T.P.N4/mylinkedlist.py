class LinkedList:
    head = None
    
class Node: 
    value = None
    nextNode = None
    
"""---------------------------------------------------------------------------------------------"""
    
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

def insert(list, element, index):
    if length(list) < index :
        return None
    else:
        current_node = list.head
        new_node = Node()
        new_node.value = element
        if index == 0:
            add(list, element)
            return index
        else: 
            for i in range (1,length(list) + 1):
                    if i == index:
                        new_node.nextNode = current_node.nextNode
                        current_node.nextNode = new_node
                        break
                    current_node = current_node.nextNode
            return index
    
"""---------------------------------------------------------------------------------------------"""

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

def mostrarLista (lista):
    current_node = lista.head
    while current_node != None :
        print(current_node.value)
        current_node = current_node.nextNode
        
"""---------------------------------------------------------------------------------------------"""

def update (list, element, index):
    current_node = list.head
    size = length(list) - 1
    value = None
    
    if index > size or index < 0 :
        return None
    for i in range(0, size + 1):
        if i == index:
            current_node.value = element
            return index
        current_node = current_node.nextNode

"""---------------------------------------------------------------------------------------------"""

def access(list, index):
    current_node = list.head
    size = length(list) - 1
    value = None
    
    if index > size or index < 0 :
        return None
    
    for i in range(0, size + 1):
        if i == index:
            value = current_node.value
            return value
        current_node = current_node.nextNode

"""---------------------------------------------------------------------------------------------"""

def length(list):
    lenght = 0
    current_node = list.head
    while current_node != None: 
        current_node = current_node.nextNode
        lenght = lenght + 1
    return lenght

"""---------------------------------------------------------------------------------------------"""

lista = LinkedList()
add(lista, 1)
add(lista, 2)
add(lista, 3)
add(lista, 4)
insert(lista, 0, 3)
delete(lista,1)
print("-------------------------------------------------")
print(access(lista, 4))
print("-------------------------------------------------")
print(search(lista, 6))
print("-------------------------------------------------")
mostrarLista(lista)
print("-------------------------------------------------")
update(lista, 20, 3)
mostrarLista(lista)

