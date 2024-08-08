//Realice un programa que determine si un n�mero es primo o no. Recuerde que un n�mero primo es
//todo aquel n�mero natural mayor que 1 y que s�lo es divisible por 1 y por s� mismo. Ejemplo: el
//n�mero 5 es un n�mero primo.

/// Datos de entrada: N�mero que vamos a verificar si es primo o no.
/// Datos de salida: Mensaje que indica si el valor es primo o no.

Algoritmo Ejercicio3
	
	Definir num, i Como Entero;
	Definir esPrimo Como Logico;
	
	i = 2;
	
	esPrimo = Verdadero;
	
	Repetir
		
		Escribir "Ingrese el valor al cual se le evaluar� su condici�n de primo: (tiene que ser mayor que 1)"
		Leer num;
		
		si num <= 1 Entonces
			
			Escribir "Error: el valor ingresado es menor o igual a 1"
			
		FinSi
		
	Mientras Que num <= 1
	
	Mientras i < num y esPrimo == Verdadero
		
		si num % i == 0 Entonces
			
			esPrimo = Falso
			
		FinSi
		
		i = i + 1;
		
	FinMientras
	
	si esPrimo Entonces
		
		Escribir "El valor es primo.";
		
	SiNo
		
		Escribir "El valor no es primo.";
		
	FinSi
	
FinAlgoritmo
