// Escriba un programa que lea por teclado un número natural N y determine si la suma de los dígitos de
// N en posiciones impares es igual a la suma de los dígitos de N en posiciones pares. Asuma que si N
// consiste de un solo dígito la suma de los dígitos de posiciones impares es cero. Defina casos de prueba.

/// Datos de entrada: Un número de n cifras, ingresado por el usuario.
/// Datos de salida: Un mensaje indicando si la suma de las cifras del número en las posiciones impares es igual a la suma de las cifras en las posiciones impares.

Algoritmo Ejercicio8
	
	Definir num Como Entero;
	
	Repetir
		
		Escribir "Ingrese un número natural (es decir: positivo, entero y mayor que 0)";
		Leer num;
		
		si num <= 0 Entonces
			
			Escribir "El número ingresado es menor o igual a 0, inténtelo nuevamente.";
			
		FinSi
		
	Mientras  Que num < 0
	
	
	
FinAlgoritmo
