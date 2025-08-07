// 7. Realizar un algoritmo que calcule la suma de las siguientes series:

/// Datos de entrada: Cantidad de términos de la serie.
/// Datos de salida: Valor que enseña el valor de la serie hasta el término indicado.

Algoritmo ejercicio7A
	
	Definir n Como Entero;
	Definir valorSerie Como Real;
	
	valorSerie = 0;
	
	Repetir
		
		Escribir "Ingrese hasta que término desea calcular la serie: ";
		Leer n;
		
		si n < 0
			
			Escribir "Error: el valor ingresado debe ser mayor que 0"
			
		FinSi
		
	Mientras  Que n < 0
	
	Para i = 1 Hasta n Con Paso 1 Hacer
		
		valorSerie = valorSerie + i/2;
		
	FinPara
	
	Escribir "El valor de la serie, desarrollada hasta el término " n " es: " valorSerie;
	
FinAlgoritmo
