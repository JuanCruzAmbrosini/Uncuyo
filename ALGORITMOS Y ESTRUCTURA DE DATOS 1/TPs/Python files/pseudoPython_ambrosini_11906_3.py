from algo1 import *

def calcularPromedio (desde, hasta):
    
    suma = 0
    cantidadDeElementos = 0
    
    for n in range(desde, hasta + 1): 
        suma += n
        cantidadDeElementos += 1
    
    promedio = suma / cantidadDeElementos
    return promedio
    
desde = input_int("Ingrese el valor entero desde: ")
hasta = input_int("Ingrese el valor entero hasta: ")
promedio = calcularPromedio(desde, hasta) 
print("El promedio de los valores entre ", desde, " hasta ", hasta, " es de: ", promedio)   