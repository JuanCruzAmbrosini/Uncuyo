// Construir un programa que simule el funcionamiento de una calculadora que puede realizar las
// cuatro operaciones aritm�ticas b�sicas (suma, resta, producto y divisi�n) con valores num�ricos
// enteros. El usuario debe especificar la operaci�n con el primer car�cter del primer par�metro de
// la l�nea de comandos: S � s para la suma, R � r para la resta, P, p, M � m para el
// producto y D � d para la divisi�n. Los valores de los operandos se deben indicar en el segundo
// y tercer par�metros.

///Datos de entrada: Cadena que indica la operaci�n aritm�tica que se desea realizar y 2 n�meros enteros
///Datos de salida: Mensaje que muestra el resultado de la operaci�n.

Algoritmo Ejercicio8
	
	Definir operacionAritmetica Como Caracter;
	Definir operando1, operando2 Como Entero;
	Definir resultado Como Real;
	
	Escribir "Defina que operaci�n desea realizar: ";
	Escribir "Suma (s)";
	Escribir "Resta (r)"
	Escribir "Multiplicaci�n (m)";
	Escribir "Divisi�n (d)";
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
			
			Escribir "El resultado de la multiplicaci�n es: ",resultado;
			
		"d":
			
			Escribir "Ingrese el primer operando: ";
			Leer operando1;
			Escribir "Ingrese el segundo operando: ";
			Leer operando2;
			
			resultado = operando1 / operando2;
			
			Escribir "El resultado de la divisi�n es: ",resultado;
			
		De Otro Modo:
			
			Escribir "Int�ntelo nuevamente utilizando un valor v�lido."
		
	FinSegun
	
FinAlgoritmo
