from mylinkedlist import *
import random

def quickSortR(list : LinkedList, resultList : LinkedList = LinkedList()):

    size = lengthList(list)

    if size > 1 :

        pivotIndex = random.randint( 0 , size - 1)
        current : Node = list.head
        pivot = searchNodeIndex(list, pivotIndex)
        pivotValue = pivot.value
        low = LinkedList()
        high = LinkedList()

        while(current != None):

            if (current.value < pivotValue) :
                add(low, current.value)
            elif current.value == pivotValue and current != pivot :
                add(low, current.value)
            else:
                add(high, current.value)
            
            current = current.nextNode

        quickSortR(low, resultList)
        quickSortR(high, resultList)

    else:
        
        if list.head != None: 

            add(resultList, list.head.value)


    return resultList

def quickSort(list : LinkedList) -> LinkedList : 
    
    result = quickSortR(list)
    invertList(result)

    return result

"""---------------------------------------------------------------------------------------------"""

def mergeSort(list : LinkedList) :

    if list.head.nextNode == None or list.head == None:
        
        return list
    
    else:

        l1, l2 = splitList(list)
        mergedList1 = mergeSort(l1)
        mergedList2 = mergeSort(l2)

        return merge(mergedList1, mergedList2)

"""----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----"""

def merge(list1 : LinkedList, list2 : LinkedList) :

    mergedList = LinkedList()
    currentL1 : Node = list1.head
    currentL2 : Node = list2.head

    while(currentL1 != None and currentL2 != None):
        if (currentL1.value <= currentL2.value):
            add(mergedList, currentL1.value)
            currentL1 = currentL1.nextNode
        else:
            add(mergedList, currentL2.value)
            currentL2 = currentL2.nextNode

    while currentL1 != None :
        add(mergedList, currentL1.value)
        currentL1 = currentL1.nextNode

    while currentL2 != None :
        add(mergedList, currentL2.value)
        currentL2 = currentL2.nextNode

    invertList(mergedList)

    return mergedList 

"""---------------------------------------------------------------------------------------------"""

# Hardcoding an unordered linked list with 10 elements without using 'add'
list = LinkedList()

# Create the nodes
node1 = Node()
node1.value = 7

node2 = Node()
node2.value = 3

node3 = Node()
node3.value = 9

node4 = Node()
node4.value = 1

node5 = Node()
node5.value = 5

node6 = Node()
node6.value = 10

node7 = Node()
node7.value = 3

node8 = Node()
node8.value = 8

node9 = Node()
node9.value = 4

node10 = Node()
node10.value = 6

list.head = node5  # Let's start with 5 as the head
node5.nextNode = node2       # 5 -> 3
node2.nextNode = node8       # 3 -> 8
node8.nextNode = node1       # 8 -> 7
node1.nextNode = node10      # 7 -> 6
node10.nextNode = node3      # 6 -> 9
node3.nextNode = node7       # 9 -> 2
node7.nextNode = node4       # 2 -> 1
node4.nextNode = node9       # 1 -> 4
node9.nextNode = node6       # 4 -> 10

showList(list)
showList(mergeSort(list))