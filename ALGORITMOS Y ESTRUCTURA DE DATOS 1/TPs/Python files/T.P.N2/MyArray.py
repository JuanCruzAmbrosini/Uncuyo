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

"""delete(Array,element)
Descripción: Elimina un elemento del arreglo que representa el TAD secuencia.
Poscondición: Se desplazan los elementos restantes y se rellena con None
hacia el final.
Entrada: el arreglo sobre el cual se quiere realizar la eliminación
(Array) y el elemento (element) a eliminar.
Salida: Devuelve la posición donde se encuentra el elemento a eliminar.
Devuelve None si el elemento a eliminar no se encuentra."""

def delete(array, element):
    aux_count = 0
    none_count = 0
    indexes = search(array, element)
    if (indexes != None):
        for i in range (0, len(indexes)):
            for j in range (0, len(array)):
                if j == indexes[i]:
                    array[j] = None
        for i in range (0, len(array) - len(indexes)):
            if array[i] == None:
                none_count += 1
                if array[i + 1] == None:
                    none_count += 1
                array[i] = array[i + none_count]
            else:
                array[i] = array[i + none_count]
        return indexes
    else: 
        return None  
        
            
        
        
arreglo = Array(20,0)
for i in range (0,20):
    arreglo[i] = random.randint(-20,20)
   
print(arreglo) 
insert(arreglo,10,0)
insert(arreglo,10,1)
print(arreglo)
print(delete(arreglo, 10))
print(arreglo)