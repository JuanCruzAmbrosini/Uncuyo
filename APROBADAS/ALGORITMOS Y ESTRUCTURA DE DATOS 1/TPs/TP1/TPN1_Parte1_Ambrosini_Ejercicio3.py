""" Elaborar un algoritmo que lea una matriz y un vector, y que verifique si es posible la
multiplicación. En el caso de ser posible realice la operación correspondiente, caso contrario,
que muestre el mensaje “dimensiones incorrectas”. """

from algo1 import *
import random

#--------------------------------------------------------------------------------------------------------

dimension_vector = 4
filas = 4
columnas = 5

suma_parcial = 0

vector = Array(dimension_vector, 0)
matriz = Array(filas, Array(columnas, 0))
vector_resultado = Array(columnas, 0)

#--------------------------------------------------------------------------------------------------------

def mostrar_matriz(matriz, filas):
    
    for i in range (0, filas):
      print(matriz[i])
      
#--------------------------------------------------------------------------------------------------------   

for i in range (0, dimension_vector):
    vector[i] = random.randint(-20, 20)
print("----------------------------------------------------------")
print (vector)
print("----------------------------------------------------------")

for i in range (0, filas):
    for j in range (0, columnas):
        matriz[i][j] = random.randint(-20, 20)
print("----------------------------------------------------------")
mostrar_matriz(matriz, filas)
print("----------------------------------------------------------")

if (dimension_vector == filas):
    for i in range (0, columnas):
        suma_parcial = 0
        for j in range (0, dimension_vector):
            suma_parcial += matriz[j][i] * vector[j]
        vector_resultado[i] = suma_parcial
    print("----------------------------------------------------------")
    print(vector_resultado)
    print("----------------------------------------------------------")
else:
    print("----------------------------------------------------------")
    print("Dimensiones incorrectas")
    print("----------------------------------------------------------")
