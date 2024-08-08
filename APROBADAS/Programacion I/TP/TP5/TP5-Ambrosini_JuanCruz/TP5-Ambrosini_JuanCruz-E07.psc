//	Realizar un programa que dibuje un triángulo invertido de asteriscos por pantalla. Por ejemplo,
//	si se ingresa el número 6 se debe imprimir:
//		******
//		*****
//		****
//		***
//		**
//		*
//	Nota: para escribir la salida se debe utilizar la instrucción "escribir sin saltar" que evita el salto de línea.

/// Datos de entrada: Se le pide al usuario un número para que será el alto del triángulo invertido.
/// Datos de salida: Se muestra en pantalla el triángulo invertido del alto especificado por el usuario.

Algoritmo Ejercicio7
	
	Definir cantidadDePisos Como Entero
	
	Repetir
		
		Escribir "Ingrese la cantidad de pisos del triángulo: ";
		Leer cantidadDePisos;
		
		si cantidadDePisos < 0 Entonces
			
			Escribir "Error: la cantidad de pisos tiene que ser mayor a 0.";
			
		FinSi
		
	Mientras Que cantidadDePisos < 0 
	
	Para i = 1 Hasta cantidadDePisos Hacer
		
		Escribir "";
		
		para j = cantidadDePisos Hasta i Con Paso  -1 Hacer
			
			Escribir "*" Sin Saltar;
			
		FinPara
		
	FinPara
	
FinAlgoritmo
