// Escriba un programa que lea por teclado un n�mero natural N y determine si la suma de los d�gitos de
// N en posiciones impares es igual a la suma de los d�gitos de N en posiciones pares. Asuma que si N
// consiste de un solo d�gito la suma de los d�gitos de posiciones impares es cero. Defina casos de prueba.

/// Datos de entrada: Un n�mero de n cifras, ingresado por el usuario.
/// Datos de salida: Un mensaje indicando si la suma de las cifras del n�mero en las posiciones impares es igual a la suma de las cifras en las posiciones impares.

Algoritmo Ejercicio8
	
	Definir num Como Entero;
	
	Repetir
		
		Escribir "Ingrese un n�mero natural (es decir: positivo, entero y mayor que 0)";
		Leer num;
		
		si num <= 0 Entonces
			
			Escribir "El n�mero ingresado es menor o igual a 0, int�ntelo nuevamente.";
			
		FinSi
		
	Mientras  Que num < 0
	
	
	
FinAlgoritmo
