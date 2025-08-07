//Realizar un programa que lea un n�mero entero (tama�o del lado) y a partir de �l cree un
//cuadrado de asteriscos de ese tama�o. Los asteriscos s�lo se ver�n en el borde del cuadrado,
//no en el interior. Por ejemplo, si se ingresa el n�mero 4 se debe mostrar:
//		****
//		* *
//		* *
//		****

/// Datos de entrada: Tama�o del lado del cuadrqado que se quiere dibujar.
/// Datos de salida: Cuadrado de lado n dibujado con asteriscos.

Algoritmo Ejercicio8
	
	Definir ladoCuadrado Como Entero;
	
	Repetir
		
		Escribir "Ingrese la longitud del lado del cuadrado que desea dibujar: ";
		Leer ladoCuadrado;
		
		si ladoCuadrado < 0 Entonces
			
			Escribir "Error: el lado del cuadrado no puede tener longitudes menores o iguales a 0.";
			
		FinSi
		
	Mientras Que ladoCuadrado < 0 
	
	Para i = 1 Hasta ladoCuadrado Hacer
		
		Escribir "";
		
		Para j = 1 Hasta ladoCuadrado Hacer
			
			si i = 1 o i = ladoCuadrado o j = 1 o j = ladoCuadrado Entonces
				
				Escribir " * " Sin Saltar;
				
			SiNo
				
				Escribir "   " Sin Saltar;
				
			FinSi
			
		FinPara
		
	FinPara
	
FinAlgoritmo
