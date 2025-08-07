//Dada una matriz de orden n * m (donde n y m son valores ingresados por el usuario) realizar un
//programa que calcule y muestre la suma de los números pares y la suma de los números impares.
//Mostrar la matriz y los resultados por pantalla.

/// Datos de entrada: El orden de la matriz y los valores de la misma.
/// Datos de salida: La suma de los números pares e impares, además de la matriz.

Algoritmo Ejercicio_9
	
	Definir filas, columnas, matriz, sumaPar, sumaImpar Como Entero
	
	sumaPar = 0;
	sumaImpar = 0;
	
	filas = seleccionNumeroPositivo("Ingrese el número de filas: ");
	columnas = seleccionNumeroPositivo("Ingrese el número de columnas: ");
	
	Dimension matriz[filas, columnas];
	rellenarMatriz(matriz, filas, columnas);
	
	Escribir "-----------------------------------------------"
	
	mostrarMatriz(matriz, filas, columnas);
	
	sumatoriaParImpar(matriz, filas, columnas, sumaPar, sumaImpar);
	
	Escribir "-----------------------------------------------"
	
	Escribir "La suma de los números pares es de: " sumaPar;
	Escribir "La suma de los números impares es de: " sumaImpar;
	
FinAlgoritmo
///---------------------------------------------------------------------------------
Funcion eleccionUsuario = seleccionNumeroPositivo (mensaje)
	
	Definir eleccionUsuario Como Entero
	
	Repetir
		
		Escribir mensaje;
		Leer eleccionUsuario
		
		si eleccionUsuario <= 0 Entonces
			
			Escribir "ERROR: Ingrese un valor válido."
			
		FinSi
		
	Mientras Que eleccionUsuario <= 0 
	
FinFuncion
///---------------------------------------------------------------------------------
SubProceso mostrarMatriz(matriz, filas, columnas)
	
	Definir i, j Como Entero;
	
	Para i = 0 Hasta filas - 1 Con Paso 1 Hacer
		
		Para j = 0 Hasta columnas - 1 Con Paso 1 Hacer
			
			Escribir Sin Saltar "| " matriz[i,j] " |"
			
		FinPara
		
		Escribir "";
		
	FinPara
	
FinSubProceso
///---------------------------------------------------------------------------------
SubProceso rellenarMatriz (matriz, filas, columnas)
	
	Definir i, j Como Entero;
	
	Para i = 0 Hasta filas - 1 Hacer
		
		Para j = 0 Hasta columnas - 1 Hacer
			
			Escribir "Ingrese el valor [ " i " , " j " ] de la matriz: " 
			Leer matriz[i,j];
			
		FinPara
		
	FinPara
	
FinSubProceso
///---------------------------------------------------------------------------------
SubProceso sumatoriaParImpar(matriz, filas, columnas, sumaPar Por Referencia, sumaImpar Por Referencia)
	
	Definir i,j Como Entero;
	
	Para i = 0 Hasta filas - 1 Hacer
		
		Para j = 0 Hasta columnas - 1 Hacer
			
			Si matriz[i,j] % 2 == 0 Entonces
				
				sumaPar = sumaPar + matriz[i,j];
				
			SiNo
				
				sumaImpar = sumaImpar + matriz[i,j];
				
			FinSi
			
		FinPara
		
	FinPara
	
FinSubProceso
























