from algo1 import *
from mylinkedlist import *
from MyArray import length
    
"""----------------------------------------------------------------------------------"""

def push(list, element):
    add(list, element)

"""----------------------------------------------------------------------------------"""

def pop(list):
    if list.head == None :
        return None
    else:
        popedElement = list.head.value
        list.head = list.head.nextNode
        return popedElement

"""----------------------------------------------------------------------------------"""

"""def fillList(array):
    list = LinkedList()
    for i in range(0, length(array)):
        add(list, array[i])
    return list

array1 = [24, 45, 3, 67, 89, 345, 54, 22, 3, 678]
list = fillList(array1)

showList(list)
print("----------------------------------------------------------------------------")
push(list, 1000)
showList(list)
print("----------------------------------------------------------------------------")
popedElement = pop(list)
showList(list)
print(popedElement)
print("----------------------------------------------------------------------------")"""

