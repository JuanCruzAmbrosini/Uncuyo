//Escribe un programa que pida el limite inferior y superior de un intervalo. Si el límite inferior es mayor
//que el superior lo tiene que volver a pedir. A continuación se van introduciendo números hasta que
//introduzcamos el 0. Cuando termine el programa dará las siguientes informaciones
//	? La suma de los números que están dentro del intervalo (intervalo abierto).
//	? Cuantos números están fuera del intervalo.
//	? Informa si hemos introducido algún número igual a los límites del intervalo.

/// Datos de entrada: Límites superior e inferior de un intervalo. Conjunto de números
///Datos de salida: Mensajes de salida que informan: La suma de los números que están dentro del intervalo, cuantos números están fuera del intervalo e informa si
		/// hemos ingresado algún número igual a los límites del intervalo

Algoritmo Ejercicio4
	
	Definir limiteInferior, limiteSuperior, num Como Real;
	
	Repetir
		
		Escribir "Ingrese el límite inferior del intervalo.";
		Leer limiteInferior;
		
		Escribir "Ingrese el límite superior del intervalo.";
		Leer limiteSuperior;
		
		si limiteInferior > limiteSuperior
			
			Escribir "Error: el límite superior del intervalo es más pequeño que el límite inferior."
			
		FinSi
		
	Mientras Que limiteInferior > limiteSuperior
	
FinAlgoritmo
