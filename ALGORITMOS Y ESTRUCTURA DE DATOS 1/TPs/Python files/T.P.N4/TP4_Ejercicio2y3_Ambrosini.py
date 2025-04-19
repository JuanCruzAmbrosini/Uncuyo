from algo1 import *
from mylinkedlist import*

class LinkedList:
    head = None
    
class Node: 
    value = None
    nextNode = None
    
class Employee :
    def __init__(self, name, age, id):
        self.name = name
        self.age = age
        self.id = id

employee_list = LinkedList()
add(employee_list, Employee("Luis Esteban", 32, 7))
add(employee_list, Employee("Eduardo Ángel", 34, 2))
add(employee_list, Employee("Pedro César", 45, 8))
add(employee_list, Employee("Luis Esteban", 32, 7))
add(employee_list, Employee("Pedro Agusto", 40, 9))
add(employee_list, Employee("Juan Carlos", 23, 5))
add(employee_list, Employee("Luis Esteban", 32, 7))
add(employee_list, Employee("Juan Carlos", 23, 5))
add(employee_list, Employee("Eduardo Ángel", 34, 2))

#---------------------------------------------------------------

def showCustomList (lista):
    current_node = lista.head
    while current_node != None :
        print("---------------------------------")
        print("Nombre: ", current_node.value.name)
        print("Edad: ", current_node.value.age)
        print("Legajo: ", current_node.value.id)
        current_node = current_node.nextNode

#---------------------------------------------------------------

def noRepeatsId(listA):
    current_comparator = listA.head
    current = current_comparator.nextNode
    counter = 0
    while current_comparator.nextNode != None:
        while current != None:
            if current.value.id == current_comparator.value.id:
                counter += 1
                for i in range(0, counter):
                    delete(listA, current.value)
            current = current.nextNode
        counter = 0
        current_comparator = current_comparator.nextNode
        current = current_comparator.nextNode
        
#---------------------------------------------------------------

def insertById(list, employee, before):
    current = list.head
    counter = 1
    while current != None:
        if current.nextNode.value.id == before:
            insert(list, employee, counter)
            break
        counter += 1
        current = current.nextNode
        
#---------------------------------------------------------------

def moveEmployee(list, id_employee, before):
    current = list.head
    aux_employee = None
    while current != None:
        if id_employee == current.value.id:
            aux_employee = current.value
            delete(list, current.value)
            insertById(list, aux_employee, before)
            break
        current = current.nextNode

#---------------------------------------------------------------
print("///////////////////////////////// LISTA DE EMPLEADOS /////////////////////////////////")
showCustomList(employee_list)
noRepeatsId(employee_list)
print("///////////////////////////////// LISTA DE EMPLEADOS SIN REPETIR /////////////////////////////////")
showCustomList(employee_list)
ernesto_andres = Employee("Ernesto Andrés", 55, 6)
insertById(employee_list, ernesto_andres,7)
print("///////////////////////////////// LISTA DE EMPLEADOS ACTUALIZADA (Hernesto Andrés) /////////////////////////////////")
showCustomList(employee_list)
moveEmployee(employee_list, 8, 9)
print("///////////////////////////////// LISTA DE EMPLEADOS ACTUALIZADA (Se cambió de lugar al legajo 8) /////////////////////////////////")
showCustomList(employee_list)


