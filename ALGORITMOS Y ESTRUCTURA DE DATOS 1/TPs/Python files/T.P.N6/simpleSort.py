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
    if not isSorted(list):
        size = lengthList(list)
        for i in range (0, size):
            current : Node = searchNodeIndex(list, i)
            minNode : Node = current
            for j in range (i, size):
                if minNode.value > current.value:
                    minNode = current
                current = current.nextNode
            minValueIndex = searchNode(list, minNode)
            swap(list, minValueIndex, i)
    else: 
        print("La lista ya está ordenada")

"""----------------------------------------------------------------------------------------------------------""" 

def insertSort(list : LinkedList):
    size = lengthList(list)
    for i in range(1, size):
        current_value = access(list, i)
        j = i - 1
        # Mover los elementos mayores a la derecha
        while j >= 0 and access(list, j) > current_value:
            update(list, access(list, j), j + 1)
            j -= 1
        update(list, current_value, j + 1)


list = LinkedList

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
print("Selection sort: ")
print("-------------------------------------------------------------------")
selectionSort(list)
showList(list)
