""" 2. Elaborar un algoritmo que lea dos vectores, verifique si tienen la misma dimensión y los sume
en un nuevo vector. Calcule la norma cuadrática de este último vector. Muestre el vector
resultado y su norma cuadrática. """

from algo1 import *
import random
import math

suma = 0

dimension_vector1 = 10
vector1 = Array(dimension_vector1, 0)

dimension_vector2 = 10
vector2 = Array(dimension_vector2, 0)

for i in range (0, dimension_vector1):
    vector1[i] = random.randint(0,50)
    
for i in range (0, dimension_vector2):
    vector2[i] = random.randint(0,50)

print("Vector 1")
print(vector1)
print("Vector 2")
print(vector2)

if (dimension_vector1 == dimension_vector2):
    vectorResultado = Array(dimension_vector1, 0)
    for i in range (0, dimension_vector1):
        vectorResultado[i] = vector1[i] + vector2[i]
    print("Vector resultado:")
    print(vectorResultado)
    
    for i in range (0, dimension_vector1):
        suma += vectorResultado[i]^2
    norma_cuadratica = math.sqrt(suma)
    print("Norma cuadrática: ")
    print(norma_cuadratica)
    
else:
    print("Los vectores no tienen el mismo tamaño y no pueden ser sumados.")

