from mylinkedlist import *
from algo1 import *
from MyArray import length

"""----------------------------------------------------------------------------------"""

def enqueue (list, element):
    add(list, element)
    
"""----------------------------------------------------------------------------------"""

def dequeue(list):
    current_node = list.head
    if list.head == None: 
        return None
    elif( list.head.nextNode == None ): 
        dequeued_element = list.head.value
        list.head = None
        return dequeued_element
    else:    
        while(current_node.nextNode.nextNode != None):
            current_node = current_node.nextNode
        dequeued_element = current_node.nextNode.value
        current_node.nextNode = None
        return dequeued_element

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
enqueue(list, 1000)
showList(list)
print("----------------------------------------------------------------------------")
dequeued_element = dequeue(list)
showList(list)
print(dequeued_element)"""