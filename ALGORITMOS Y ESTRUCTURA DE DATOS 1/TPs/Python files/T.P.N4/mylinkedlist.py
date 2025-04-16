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

"""insert(L,element,position)
Descripción: Inserta un elemento en una posición determinada de la
lista que representa el TAD secuencia.
Entrada: la lista sobre el cual se quiere realizar la inserción
(Linkedlist) y el valor del elemento (element) a insertar y la
posición (position) donde se quiere insertar.
Salida: Si pudo insertar con éxito devuelve la posición donde se
inserta el elemento. En caso contrario devuelve None. Devuelve None si
la posición a insertar es mayor que el número de elementos en la
lista."""

def insert(list, element, index):
    if length(list) < index :
        return None
    else:
        current_node = list.head
        new_node = Node()
        new_node.value = element
        for i in range (0,index + 1):
            if index == 0:
                add(list, element)
                return index
            else:
                if (i - 1) == index:
                    new_node.nextNode = current_node.nextNode
                    current_node.nextNode = new_node
            current_node = current_node.nextNode
        return index
    
"""---------------------------------------------------------------------------------------------"""

def mostrarLista (lista):
    current_node = lista.head
    while current_node != None :
        print(current_node.value)
        current_node = current_node.nextNode
        
"""---------------------------------------------------------------------------------------------"""

def length(list):
    lenght = 0
    current_node = list.head
    while current_node != None: 
        lenght = lenght + 1
        current_node = current_node.nextNode
    return lenght

"""---------------------------------------------------------------------------------------------"""

lista = LinkedList()
add(lista, 4)
add(lista, 6)
insert(lista, 8, 1)
print(insert(lista, 8, 1))
print(search(lista, 6))
mostrarLista(lista)

