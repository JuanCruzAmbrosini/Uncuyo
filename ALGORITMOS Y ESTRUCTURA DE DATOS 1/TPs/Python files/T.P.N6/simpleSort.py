from mylinkedlist import *

def bubbleSort(list : LinkedList):
    if not isSorted(list):
        counter = 0
        first : Node = list.head
        second : Node = first.nextNode
        for i in range(0, lengthList(list)):
            first = list.head
            second = first.nextNode
            for i in range(0, lengthList(list) - 1 - counter):
                if first.value > second.value:
                    aux_value = first.value
                    first.value = second.value
                    second.value = aux_value
                first = first.nextNode
                second = second.nextNode
            counter += 1
    else : 
        print("La lista ya está ordenada.")

"""----------------------------------------------------------------------------------------------------------"""   

def selectionSort(list : LinkedList):
    minValue = None
    if not isSorted(list):
        for i in range(0, lengthList(list)):
            index = 0
            current = searchNodeIndex(list, i)
            print(current.value)
            minValue = current.value
            while current != None :
                value = current.value
                if minValue > value:
                    minValue = current.value
                    minpos = index
                index += 1
                current = current.nextNode
            delete_ñpoairtion(list, minpos)
            insert(list, minValue, i)
            showList(list)
"""----------------------------------------------------------------------------------------------------------""" 

#delete position
def delete_ñpoairtion(L,position):
    current = L.head
    for i in range(position-1):
        current = current.nextNode
        
    current.nextNode = current.nextNode.nextNode
# Crear la lista enlazada
list = LinkedList()

# Agregar elementos desordenados (hardcodeado)
add(list, 14)
add(list, 60)
add(list, 5)
add(list, 76)
add(list, 5)
add(list, 23)
add(list, 99)
add(list, 8)
add(list, 17)
add(list, 42)

showList(list)
selectionSort(list)
showList(list)
bubbleSort(list)
