// Escriba un programa que dado un conjunto de valores pedidos al usuario indique si el valor actual es
// menor, mayor o igual al valor anterior. El programa termina cuando el mismo número ingresado por el
// usuario se repite en forma consecutiva más de 2 veces.

/// Datos de entrada: Conjunto de números ingresados por el usuario.
/// Datos de salida: Mensaje que compara el número ingresado por el usuario con el número anterior.

Algoritmo Ejercicio5
	
	Definir valorAnterior, valorActual Como Real;
	Definir dobleIngreso Como Logico;
	
	dobleIngreso = Falso;
	
	Escribir "Ingrese el valor inicial para comparar: ";
	Leer valorAnterior;
	
	Mientras no dobleIngreso
		
		Escribir "Ingrese el valor con el que va a comparar: (Para salir, ingrese el mismo número 2 veces)";
		Leer valorActual;
		
		si valorActual > valorAnterior Entonces
			
			Escribir "El número ingresado es mayor que el anterior.";
			
		SiNo si valorAnterior > valorActual Entonces
				
				Escribir "El número ingresado es menor que el anterior.";
				
			SiNo
				
				dobleIngreso = Verdadero;
				
			FinSi
		FinSi
		
		valorAnterior = valorActual;
		
	FinMientras
	
FinAlgoritmo
