// Dados dos n�meros enteros mayores que uno, realizar un algoritmo que implemente el m�todo de
// restas sucesivas para calcular el cociente y el resto de una divisi�n.

/// Datos de entrada: Dos n�meros ingresados por el usuario que van a ser divididos.
/// Datos de salida: El cociente y el resto de la divisi�n

Algoritmo Ejercicio6
	
	Definir dividendo, divisor, cociente Como Entero
	
	cociente = 0;
	
	Repetir
		
		Escribir "Ingrese el dividendo de la divisi�n: ";
		Leer dividendo;
		
		Escribir "Ingrese el divisor de la divisi�n: ";
		Leer divisor;
		
		si dividendo > 1 y divisor > 1
			
			si divisor > dividendo
				
				Escribir "Error: El dividendo debe ser mayor que el divisor.";
				
			FinSi
			
		SiNo
			
			Escribir "Error: El divisor y el dividendo deben ser mayores a 0.";
			
		FinSi
		
	Mientras Que dividendo < divisor y (dividendo > 1 y divisor > 1) 
	
	Mientras dividendo >= divisor
		
		dividendo = dividendo - divisor;
		cociente = cociente + 1;
		
	FinMientras
	
	Escribir "El cociente de la divisi�n es: " cociente;
	Escribir "El resto de la divisi�n es: " dividendo;
	
FinAlgoritmo
