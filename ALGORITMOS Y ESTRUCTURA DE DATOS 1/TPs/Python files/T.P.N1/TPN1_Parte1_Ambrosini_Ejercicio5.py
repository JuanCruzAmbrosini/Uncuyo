""" 5. Elaborar un algoritmo que lea una matriz y determine si es triangular superior. En caso
afirmativo el algoritmo debe calcular el determinante de dicha matriz."""

from algo1 import *
import random

dimension = 3
matriz = Array(dimension, Array(dimension, 0))
determinante = 1
matriz_no_triang_sup = Array(dimension, Array(dimension, 0))

#--------------------------------------------------------------------------------------------------------

def crear_matriz (filas, columnas):
    
    matriz = Array(filas, Array(columnas, 0))

    for i in range (0, filas):
        for j in range (0, columnas):
            matriz[i][j] = random.randint(-20,20)
    return matriz

def validar_si_es_triang_sup (matriz, dimension):
    es_triang_sup = True
    for i in range (0, dimension):
        for j in range(0, dimension):
            if (j > i and matriz[j][i] != 0):
                es_triang_sup = False
    return es_triang_sup

def mostrar_matriz(matriz):
    
    for i in range (0, dimension):
      print(matriz[i])

#--------------------------------------------------------------------------------------------------------

for i in range(0, dimension):
    for j in range(0, dimension):
        if (j > i):
            matriz[j][i] = 0
        else:
            matriz[j][i] = random.randint(-20,20)
            
# matriz = crear_matriz(dimension, dimension)          #Esta línea esta a modo de verificicación con el fin de evaluar como se comportaría el algoritmo con una matriz no ts  
                
mostrar_matriz(matriz)
es_triang_sup = validar_si_es_triang_sup(matriz, dimension)

if(es_triang_sup):
    print("La matriz si es triangular superior.")
    for i in range(0, dimension):
        for j in range (0, dimension):
            if i == j:
                determinante = determinante * matriz[i][j]
    print("Su detereminante es igual a: ", determinante)
else:
    print("La matriz no es triangular superior y su determinante no será calculado.")
