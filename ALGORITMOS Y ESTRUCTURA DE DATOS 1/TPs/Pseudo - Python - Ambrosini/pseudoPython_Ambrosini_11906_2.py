from algo1 import *

sumaImpares = 0

for n in range(1,100): 
    if (n%2 != 0):
        sumaImpares = sumaImpares + n

print("La suma de los números impares desde el uno al 100 es de: ", sumaImpares)        