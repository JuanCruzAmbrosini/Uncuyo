from algo1 import *

def mostrarNuemros (valor1, valor2):
    suma = valor1 + valor2
    if (suma > 50):
        for n in range(suma, 0, -5):
            print (n)
    else:
        for n in range (suma, 0, -2): 
            print(n)
            
valor1 = input_int("Ingrese el valor 1: ")
valor2 = input_int("Ingrese el valor 2: ")

mostrarNuemros(valor1, valor2)