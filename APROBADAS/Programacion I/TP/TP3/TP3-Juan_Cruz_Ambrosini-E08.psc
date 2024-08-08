// Construir un programa que simule el funcionamiento de una calculadora que puede realizar las
// cuatro operaciones aritméticas básicas (suma, resta, producto y división) con valores numéricos
// enteros. El usuario debe especificar la operación con el primer carácter del primer parámetro de
// la línea de comandos: S ó s para la suma, R ó r para la resta, P, p, M ó m para el
// producto y D ó d para la división. Los valores de los operandos se deben indicar en el segundo
// y tercer parámetros.

///Datos de entrada: Cadena que indica la operación aritmética que se desea realizar y 2 números enteros
///Datos de salida: Mensaje que muestra el resultado de la operación.

Algoritmo Ejercicio8
	
	Definir operacionAritmetica Como Caracter;
	Definir operando1, operando2 Como Entero;
	Definir resultado Como Real;
	
	Escribir "Defina que operación desea realizar: ";
	Escribir "Suma (s)";
	Escribir "Resta (r)"
	Escribir "Multiplicación (m)";
	Escribir "División (d)";
	Leer operacionAritmetica;
	operacionAritmetica = Minusculas(operacionAritmetica);
	
	Segun operacionAritmetica Hacer
		
		"s":
			
			Escribir "Ingrese el primer operando: ";
			Leer operando1;
			Escribir "Ingrese el segundo operando: ";
			Leer operando2;
			
			resultado = operando1 + operando2;
			
			Escribir "El resultado de la suma es: ",resultado;
			
		"r":
			
			Escribir "Ingrese el primer operando: ";
			Leer operando1;
			Escribir "Ingrese el segundo operando: ";
			Leer operando2;
			
			resultado = operando1 - operando2;
			
			Escribir "El resultado de la resta es: ",resultado;
			
		"m":
			
			Escribir "Ingrese el primer operando: ";
			Leer operando1;
			Escribir "Ingrese el segundo operando: ";
			Leer operando2;
			
			resultado = operando1 * operando2;
			
			Escribir "El resultado de la multiplicación es: ",resultado;
			
		"d":
			
			Escribir "Ingrese el primer operando: ";
			Leer operando1;
			Escribir "Ingrese el segundo operando: ";
			Leer operando2;
			
			resultado = operando1 / operando2;
			
			Escribir "El resultado de la división es: ",resultado;
			
		De Otro Modo:
			
			Escribir "Inténtelo nuevamente utilizando un valor válido."
		
	FinSegun
	
FinAlgoritmo
