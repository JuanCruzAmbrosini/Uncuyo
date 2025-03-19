from algo1 import *

def ordenarValoresYMostrarPromedio (valor1, valor2, valor3):
    
    vectorValores = Array(3,0)
    
    if (valor1 > valor2 and valor1 > valor3):
        vectorValores[0] = valor1
        if (valor2 > valor3):
            vectorValores[1] = valor2
            vectorValores[2] = valor3
        else: 
            vectorValores[1] = valor3
            vectorValores[2] = valor2
    elif (valor2 > valor1 and valor2 > valor3):
        vectorValores[0] = valor2
        if (valor1 > valor3):
            vectorValores[1] = valor1
            vectorValores[2] = valor3
        else: 
            vectorValores[1] = valor3
            vectorValores[2] = valor1
    else:
        vectorValores[0] = valor3
        if(valor1 > valor2):
            vectorValores[1] = valor1
            vectorValores[2] = valor2
        else:
            vectorValores[1] = valor2
            vectorValores[2] = valor1
            
    print("El valor más grande es: ", vectorValores[0])
    print("El valor intermedio es: ", vectorValores[1])
    print("El valor mas pequeño es: ", vectorValores[2])
    
    promedioValoresExtremos = (vectorValores[0] + vectorValores[2]) / 2
    
    print("El promedio entre los valores extremos elegidos es de: ", promedioValoresExtremos)
    
valor1 = input_int("Ingrese el primer valor: ")
valor2 = input_int("Ingrese el segundo valor: ")
valor3 = input_int("Ingrese el tercer valor: ")

ordenarValoresYMostrarPromedio(valor1, valor2, valor3)