// 7. Realizar un algoritmo que calcule la suma de las siguientes series:

/// Datos de entrada: Cantidad de t�rminos de la serie.
/// Datos de salida: Valor que ense�a el valor de la serie hasta el t�rmino indicado.

Algoritmo ejercicio7B
	
	Definir n Como Entero;
	Definir valorSerie Como Real;
	
	valorSerie = 0;
	
	Repetir
		
		Escribir "Ingrese hasta que t�rmino desea calcular la serie: ";
		Leer n;
		
		si n < 0
			
			Escribir "Error: el valor ingresado debe ser mayor que 0"
			
		FinSi
		
		Mientras  Que n < 0
			
			Para i = 1 Hasta n Con Paso 1 Hacer
				
				valorSerie = valorSerie + 2^i/i;
				
			FinPara
			
			Escribir "El valor de la serie, desarrollada hasta el t�rmino " n " es: " valorSerie;
			
FinAlgoritmo
