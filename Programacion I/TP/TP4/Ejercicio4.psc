//Escribe un programa que pida el limite inferior y superior de un intervalo. Si el l�mite inferior es mayor
//que el superior lo tiene que volver a pedir. A continuaci�n se van introduciendo n�meros hasta que
//introduzcamos el 0. Cuando termine el programa dar� las siguientes informaciones
//	? La suma de los n�meros que est�n dentro del intervalo (intervalo abierto).
//	? Cuantos n�meros est�n fuera del intervalo.
//	? Informa si hemos introducido alg�n n�mero igual a los l�mites del intervalo.

/// Datos de entrada: L�mites superior e inferior de un intervalo. Conjunto de n�meros
///Datos de salida: Mensajes de salida que informan: La suma de los n�meros que est�n dentro del intervalo, cuantos n�meros est�n fuera del intervalo e informa si
		/// hemos ingresado alg�n n�mero igual a los l�mites del intervalo

Algoritmo Ejercicio4
	
	Definir limiteInferior, limiteSuperior, num Como Real;
	
	Repetir
		
		Escribir "Ingrese el l�mite inferior del intervalo.";
		Leer limiteInferior;
		
		Escribir "Ingrese el l�mite superior del intervalo.";
		Leer limiteSuperior;
		
		si limiteInferior > limiteSuperior
			
			Escribir "Error: el l�mite superior del intervalo es m�s peque�o que el l�mite inferior."
			
		FinSi
		
	Mientras Que limiteInferior > limiteSuperior
	
FinAlgoritmo
