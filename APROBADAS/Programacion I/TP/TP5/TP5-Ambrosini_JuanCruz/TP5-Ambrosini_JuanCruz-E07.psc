//	Realizar un programa que dibuje un tri�ngulo invertido de asteriscos por pantalla. Por ejemplo,
//	si se ingresa el n�mero 6 se debe imprimir:
//		******
//		*****
//		****
//		***
//		**
//		*
//	Nota: para escribir la salida se debe utilizar la instrucci�n "escribir sin saltar" que evita el salto de l�nea.

/// Datos de entrada: Se le pide al usuario un n�mero para que ser� el alto del tri�ngulo invertido.
/// Datos de salida: Se muestra en pantalla el tri�ngulo invertido del alto especificado por el usuario.

Algoritmo Ejercicio7
	
	Definir cantidadDePisos Como Entero
	
	Repetir
		
		Escribir "Ingrese la cantidad de pisos del tri�ngulo: ";
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
