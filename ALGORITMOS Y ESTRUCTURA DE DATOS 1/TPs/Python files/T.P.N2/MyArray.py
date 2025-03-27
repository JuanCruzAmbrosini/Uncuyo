from algo1 import *
import random

def search(array, element):
    for i in array:
        if element == array[i] :
            return True
        else:
            return False

#---------------------------------------------------------------------------------------------------------------------

def insert(array, element, position):
    if position >= 0 and position < len(array):
        for i in range (len(array) - 1, 0, -1):
            if i > position:
                array[i] = array[i-1]
            elif i == position:
             array[i] = element
            else:
                array[i] = array[i]
        return array
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
    if (search(array, element)):
        for i in range(0, array):
            if array[i] == element
            
    
            
        
        
arreglo = Array(10,0)
for i in range (0,10):
    arreglo[i] = random.randint(-20,20)
   
print(arreglo) 
print(insert(arreglo, 4,4))