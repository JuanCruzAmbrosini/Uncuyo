//Realizar un programa que permita realizar la división entre dos números y obtenga el cociente y el resto
//utilizando el método de restas sucesivas.

/// Datos de entrada: Dividendo y divisor para aplicar el método de división de restas sucesivas
/// Datos de salida: Cociente y resto de la división

Algoritmo Ejercicio_3
	
	Definir dividendo, divisor, cociente, resto Como Entero
	
	cociente = 0;
	resto = 0;
	
	Repetir
		
		dividendo = ingresarDividendo;
		divisor = ingresarDivisor;
		
		si dividendo < divisor Entonces
			
			Escribir "El divisor no puede ser más grande que el dividendo."
			
		FinSi
		
	Mientras Que dividendo < divisor 
	
	restasSucesivas(dividendo,divisor,cociente,resto)
	
	Escribir "El resultado de la división es: " cociente;
	Escribir "El resto de la división es: " resto;
	
FinAlgoritmo

Funcion dividendo = ingresarDividendo
	
	Definir dividendo Como Entero;
	
	Repetir
		
		Escribir "Ingrese el valor del dividendo: ";
		Leer dividendo;
		
		si dividendo < 0
			
			Escribir "Error: El dividendo no puede ser negativo."
			
		FinSi
		
	Mientras Que dividendo < 0
	
FinFuncion

Funcion divisor = ingresarDivisor
	
	Definir divisor Como Entero;
	
	Repetir
		
		Escribir "Ingrese el valor del divisor: ";
		Leer divisor;
		
		si divisor == 0 Entonces
			
			Escribir "No está definida la división por cero, ingrese otro valor!";
			
		FinSi
		
		si divisor < 0 Entonces
			
			Escribir "El divisor no puede ser negativo.";
			
		FinSi
		
	Mientras Que divisor <= 0
	
FinFuncion

SubProceso restasSucesivas (dividendo, divisor, cociente Por Referencia, resto Por Referencia)
	
	Definir contador Como Entero
	
	contador = 0;
	
	Mientras dividendo >= divisor Hacer
		
		contador = contador + 1
		dividendo = dividendo - divisor
		
	FinMientras
	
	cociente = contador;
	resto = dividendo;
	
FinSubProceso



















	