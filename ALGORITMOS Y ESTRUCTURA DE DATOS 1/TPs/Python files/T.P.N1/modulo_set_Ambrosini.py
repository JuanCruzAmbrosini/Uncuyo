from algo1 import Array
import random

#------------------------------------------------------------------------------------------------------------------


def Create_Set(arreglo):
    
    tamano_max = len(arreglo)
    conjunto = Array(tamano_max, 0)
    tamano_conjunto = 0
    
    if len(arreglo) == 0:
        return Array(0)

    for i in range (0, tamano_max):
        
        es_repetido = False
        
        for j in range (0,tamano_conjunto):
            if arreglo[i] == conjunto[j]:
                es_repetido = True
                break
            
        if not es_repetido:
            conjunto[tamano_conjunto] = arreglo[i]
            tamano_conjunto += 1
            
    resultado = Array(tamano_conjunto, 0)
    
    for i in range(0, tamano_conjunto):
        resultado[i] = conjunto[i]
        
    return resultado

#------------------------------------------------------------------------------------------------------------------

arreglo = Array(10, 0)
for i in range(0, 10):
    arreglo[i] = random.randint(0, 10)

print("Arreglo original:", arreglo)
conjunto_resultante = Create_Set(arreglo)
print("Conjunto resultante:", conjunto_resultante)