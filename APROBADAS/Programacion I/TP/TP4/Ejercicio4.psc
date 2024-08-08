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
	
	Definir limiteInferior, limiteSuperior, num, sum, contadorNoIntervalo Como Real;
	Definir igualLimiteIntervalo Como Logico;
	
	igualLimiteIntervalo = Falso;
	num = 1;
	
	Repetir
		
		Escribir "Ingrese el límite inferior del intervalo.";
		Leer limiteInferior;
		
		Escribir "Ingrese el límite superior del intervalo.";
		Leer limiteSuperior;
		
		si limiteInferior > limiteSuperior
			
			Escribir "Error: el límite superior del intervalo es más pequeño que el límite inferior.";
			
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
	
	Escribir "La suma de los números dentro del el intervalo es de: " sum;
	Escribir "Los cantidad de números que están fuera del intervalo es: " contadorNoIntervalo;
	si igualLimiteIntervalo Entonces
		
		Escribir "Se ha ingresado uno o más valores iguales a los límites del intervalo.";
		
	SiNo
		
		Escribir "No se han ingresado números iguales a los extremos del intervalo.";
		
	FinSi
	
FinAlgoritmo
