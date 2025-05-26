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
        current : Node = list.head
        for i in range(0, lengthList(list)):
            minValue = access(list, i)
            current = search
            while current != None:
                if minValue > current.value:
                    minValue = current.value
                current = current.nextNode
            delete(list, minValue)
            insert(list, minValue, i)

"""----------------------------------------------------------------------------------------------------------""" 

# Crear la lista enlazada
list = LinkedList()

# Agregar elementos desordenados (hardcodeado)
add(list, 14)
add(list, 60)
add(list, 31)
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
