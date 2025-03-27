"""1. Elaborar un algoritmo que lea un vector, busque el mayor elemento en valor absoluto y
muestre el resultado."""

from algo1 import *
import random
import math

dimensionVector = 10
vector = Array(dimensionVector, 0)

for i in range (0, dimensionVector):
    vector[i] = random.randint(-100,100)
    
print(vector)

mayorValor = -1

for i in range (0, dimensionVector):
    if (mayorValor < abs(vector[i])):
        mayorValor = abs(vector[i])
    
print("El mayor valor es: ", mayorValor)