from mylinkedlist import *
from algo1 import *
from MyArray import length
from random import randint

"""---------------------------------------------------------------------------------------------"""

class PriorityQueue:
    head=None
    
class PriorityNode:
    value=None
    nextNode=None
    priority=None
    
"""---------------------------------------------------------------------------------------------"""

def enqueue_priority(list, element, priority):
    
    new_priority_node = PriorityNode()
    new_priority_node.value = element
    new_priority_node.priority = priority
    
    if list.head == None :
        list.head = new_priority_node
        return 0
    else:
        new_priority_node.nextNode = list.head
        list.head = new_priority_node
        return 0
    
"""---------------------------------------------------------------------------------------------"""   

def dequeue_priority(list):
    current = list.head
    rep_counter = 0
    counter = 0
    dequeue_value = 0
    prev_node = None
    if list.head == None:
        return None
    elif list.head.nextNode == None :
        dequeue_value = list.head.value
        list.head = None
        return dequeue_value
    else:
        max_priority = list.head.priority
        while current != None:
            if max_priority < current.priority :
                max_priority = current.priority
            current = current.nextNode
        current = list.head
        while current != None:
            if current.priority == max_priority:
                rep_counter = rep_counter + 1
            current = current.nextNode
        current = list.head
        while current != None:
            if current.priority == max_priority:
                counter = counter + 1
            if counter == rep_counter:
                dequeue_value = current.value
                if prev_node == None:
                    list.head = current.nextNode
                    break
                else: 
                    prev_node.nextNode = current.nextNode
                    break
            prev_node = current
            current = current.nextNode
        return dequeue_value
            
"""---------------------------------------------------------------------------------------------"""  

"""# Crear una cola vacía
cola = PriorityQueue()

# Insertar 10 elementos aleatorios con prioridades aleatorias
for i in range(10):
    valor = chr(65 + i)  # A, B, C, ...
    prioridad = randint(1, 5)  # Prioridades entre 1 y 5
    enqueue_priority(cola, valor, prioridad)

def printPriorityQueue(list):
    current = list.head
    while current != None:
        print("Node value: ", current.value)
        print("Node priority: ", current.priority)
        print("--------------------------------------------------------------")
        current = current.nextNode

printPriorityQueue(cola)
max_priority_element = dequeue_priority(cola)
print(max_priority_element)
printPriorityQueue(cola)"""