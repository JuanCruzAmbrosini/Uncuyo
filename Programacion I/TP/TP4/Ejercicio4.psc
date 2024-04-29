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
	
	Definir limiteInferior, limiteSuperior, num, sum, contadorNoIntervalo Como Real;
	Definir igualLimiteIntervalo Como Logico;
	
	igualLimiteIntervalo = Falso;
	num = 1;
	
	Repetir
		
		Escribir "Ingrese el l�mite inferior del intervalo.";
		Leer limiteInferior;
		
		Escribir "Ingrese el l�mite superior del intervalo.";
		Leer limiteSuperior;
		
		si limiteInferior > limiteSuperior
			
			Escribir "Error: el l�mite superior del intervalo es m�s peque�o que el l�mite inferior.";
			
		FinSi
		
	Mientras Que limiteInferior > limiteSuperior
	Escribir "----------------------------------------------------------------------"
	Escribir "Ingrese un valor: (Para terminar, ingrese 0)";
	
	Mientras num <> 0 Hacer
		
		Leer num;
		
		si num < limiteSuperior y num > limiteInferior
			
			sum = sum + num;
			
		SiNo si num <> 0
				
				contadorNoIntervalo = contadorNoIntervalo + 1;
				
			FinSi
		FinSi
		
		si num == limiteInferior o num == limiteSuperior
			
			igualLimiteIntervalo = Verdadero;
			
		FinSi
		
	FinMientras
	
	Escribir "La suma de los n�meros dentro del el intervalo es de: " sum;
	Escribir "Los cantidad de n�meros que est�n fuera del intervalo es: " contadorNoIntervalo;
	si igualLimiteIntervalo Entonces
		
		Escribir "Se ha ingresado uno o m�s valores iguales a los l�mites del intervalo.";
		
	SiNo
		
		Escribir "No se han ingresado n�meros iguales a los extremos del intervalo.";
		
	FinSi
	
FinAlgoritmo
