""" 4. Elaborar un algoritmo que lea dos matrices, calcule la diferencia de las mismas y almacene el
resultado en una tercera matriz. """

from algo1 import *
import random

filas = 5
columnas = 5
        
def crear_matriz (filas, columnas):
    
    matriz = Array(filas, Array(columnas, 0))

    for i in range (0, filas):
        for j in range (0, columnas):
            matriz[i][j] = random.randint(-20,20)
    return matriz

def mostrar_matriz(matriz):
    
    for i in range (0, filas):
      print(matriz[i])
      
def sumar_matrices(matriz_a, matriz_b, filas, columnas):
    
    matriz_resultado = Array(filas, Array(columnas, 0))
    
    for i in range(0, filas):
        for j in range(0, columnas):
            matriz_resultado[i][j] = matriz_a[i][j] + matriz_b[i][j]
            
    return matriz_resultado

print("----------------------------------------------------------")
print("Matriz A")
print("----------------------------------------------------------")
matriz_a = crear_matriz(filas, columnas)
mostrar_matriz(matriz_a)
print("----------------------------------------------------------")
print("Matriz B")
print("----------------------------------------------------------")
matriz_b = crear_matriz(filas, columnas)
mostrar_matriz(matriz_b)
print("----------------------------------------------------------")
print("Matriz resultado")
print("----------------------------------------------------------")
matriz_resultado = sumar_matrices(matriz_a, matriz_b, filas, columnas)
mostrar_matriz(matriz_resultado)