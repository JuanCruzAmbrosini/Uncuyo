from algo1 import Array
import random

#------------------------------------------------------------------------------------------------------------------
def check_duplicates (arreglo):
    for i in range (0, len(arreglo)):
        for j in range (i + 1, len(arreglo)):
            if arreglo[i] == arreglo [j]:
                return True
    return False

def create_Set(arreglo):
    
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


def union(arreglo_1, arreglo_2):
    
    elementos_repetidos_1 = check_duplicates(arreglo_1)
    elementos_repetidos_2 = check_duplicates(arreglo_2)
    
    arreglo_union = Array(len(arreglo_1) + len(arreglo_2), 0)
    
    if not elementos_repetidos_1 and not elementos_repetidos_2: 
        for i in range (0, len(arreglo_1)):
            arreglo_union[i] = arreglo_1[i]
        for i in range (len(arreglo_1), len(arreglo_1) + len (arreglo_2)):
            arreglo_union[i] = arreglo_2[i - len(arreglo_1)]
        resultado = create_Set(arreglo_union)
        return resultado
    else:
        print("Hay elementos repetidos en los conjuntos, no es posible operar.")
        return None
    

def intersection (s, t):
    
    elementos_repetidos_1 = check_duplicates(s)
    elementos_repetidos_2 = check_duplicates(t)
    
    conjunto_interseccion = Array (max(len(s), len(t)), 0)
    
    tamano_interseccion = 0
    
    if not elementos_repetidos_1 and not elementos_repetidos_2: 
        for i in range (0, len(s)):
            for j in range(0, len(t)):
                if s[i] == t[j]:
                    conjunto_interseccion[tamano_interseccion] = s[i]
                    tamano_interseccion += 1
                    
        resultado = Array(tamano_interseccion,0)
        
        for i in range (0, tamano_interseccion):
            for j in range (i, len(conjunto_interseccion)):
                if conjunto_interseccion[j] != None:
                    resultado [i] = conjunto_interseccion[j]
                    break
        if len(resultado) == 0:
            print("Hay elementos repetidos en los conjuntos, no es posible operar.")
            return None
        return resultado
    else:
        print("Hay elementos repetidos en los conjuntos, no es posible operar.")
        return None
    

def difference(s, t):
    
    elementos_repetidos_1 = check_duplicates(s)
    elementos_repetidos_2 = check_duplicates(t)
    
    diferencial_dimension = 0
    contador_aux = 0
    
    conjunto_diferencia = Array(len(s), 0)
    conjunto_interseccion = intersection(s, t)
    
    if not elementos_repetidos_1 and not elementos_repetidos_2: 
        
        if (conjunto_interseccion == None or len(conjunto_interseccion) == 0) :
            
            return s
                        
        else:
            for i in range (0, len(s)):
                for j in range (0, len(conjunto_interseccion)):
                    if conjunto_interseccion[j] == s[i]:
                        conjunto_diferencia[i] = None
                        break
                    else: 
                        conjunto_diferencia[i] = s[i]

        for i in range (0, len(conjunto_diferencia)):
            if conjunto_diferencia[i] == None:
                diferencial_dimension += 1
                
        resultado = Array(len(conjunto_diferencia) - diferencial_dimension, 0)
        
        for i in range (0, len(conjunto_diferencia)):
            if conjunto_diferencia[i] != None:
                resultado[contador_aux] = conjunto_diferencia[i]
                contador_aux += 1
        
        return resultado
    
    else:

        return None
        
#------------------------------------------------------------------------------------------------------------------

arreglo_1 = Array(10,0)
arreglo_2 = Array(10,0)

for i in range (0, 10):
    arreglo_1[i] = random.randint(0,20)
    arreglo_2[i] = random.randint(0,20)

print("-----------------------------------------------------------------------------")
print("Arreglo Aleatorio Numero 1: ")
print("P = ", arreglo_1)
print("-----------------------------------------------------------------------------")
print("Arreglo Aleatorio Numero 2: ")
print("Q = ", arreglo_2)
print("--------------------------------------- Ahora los convertiremos en conjuntos ---------------------------------------")
print("Conjunto Numero 1: ")
conjunto1 = create_Set(arreglo_1)
print("A = ", conjunto1)
print("-----------------------------------------------------------------------------")
print("Conjunto Numero 2: ")
conjunto2 = create_Set(arreglo_2)
print("B = ", conjunto2)
print("--------------------------------------- Ahora uniremos estos conjuntos ---------------------------------------")
print("A U B = ", union(conjunto1, conjunto2))
print("Prueba con los arreglos crudos: ")
print(union(arreglo_1, arreglo_2))
print("--------------------------------------- Veamos la interseccion de ambos ---------------------------------------")
print("Veamos la interseccion de ambos: ")
print("A ∩ B = ", intersection(conjunto1, conjunto2))
print("Prueba con los arreglos crudos: ")
print(intersection(arreglo_1, arreglo_2))
print("--------------------------------------- Finalmente, le restaremos el segundo conjunto al primero ---------------------------------------")
print("A - B = ", difference(conjunto1, conjunto2))
print("Prueba con los arreglos crudos: ")
print(difference(arreglo_1, arreglo_2))



