from algo1 import *
import random

def search(array, element):
    element_counter = 0
    aux_counter = 0
    for i in array:
        if element == i :
            element_counter += 1
    indexes = Array(element_counter, 0)
    for i in range(0, len(array)):
        if element == array[i] :
            indexes[aux_counter] = i
            aux_counter += 1
    if len(indexes) == 0:
        return None
    else:
        return indexes[0]
    
    #---------------------------------------------------------------------------------------------------------------------
    
def search_array(array, element):
    element_counter = 0
    aux_counter = 0
    for i in array:
        if element == i :
            element_counter += 1
    indexes = Array(element_counter, 0)
    for i in range(0, len(array)):
        if element == array[i] :
            indexes[aux_counter] = i
            aux_counter += 1
    if len(indexes) == 0:
        return None
    else:
        return indexes

#---------------------------------------------------------------------------------------------------------------------

def insert(array, element, position):
    if position >= 0 and position < len(array):
        for i in range (len(array) - 1, -1, -1):
            if i > position:
                array[i] = array[i-1]
            elif i == position:
             array[i] = element
            else:
                array[i] = array[i]
        return position
    else:
        return None
    
#---------------------------------------------------------------------------------------------------------------------

def delete(array, element):
    aux_array = Array(len(array), 0)
    aux_count = 0
    indexes = search_array(array, element)
    if (indexes != None):
        for i in range (0, len(indexes)):
            for j in range (0, len(array)):
                if j == indexes[i]:
                    array[j] = None
        for i in range(0, len(array)):
            if array[i] != None:
                aux_array[aux_count] = array[i]
                aux_count += 1
        for i in range (0, len(array)):
            array[i] = aux_array[i]
        return indexes
    else: 
        return None  
        
#---------------------------------------------------------------------------------------------------------------------

def length (array):
    active_elements = 0
    for i in range(0,len(array)):
        if array[i] != None:
            active_elements += 1
    return active_elements
            
#---------------------------------------------------------------------------------------------------------------------
        
arreglo = Array(20,0)
for i in range (0,20):
    arreglo[i] = random.randint(-20,20)
    
print("------------------------------------------------")
print("Arreglo aleatorio: ")
print(arreglo) 
print("------------------------------------------------")
print("Agregamos un 10 en la posición 1: ")
insert(arreglo,10,1)
print(arreglo)
print("------------------------------------------------")
print("Ahora, eliminamos ese 10 y todos los demás:")
print(delete(arreglo, 10))
print(arreglo)
print("------------------------------------------------")
print("Finalmente, veremos la cantidad de elementos no nulos en nuestro arreglo: ")
print(length(arreglo))
print("------------------------------------------------")