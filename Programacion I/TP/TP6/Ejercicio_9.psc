//Queremos crear un programa que trabaje con fracciones a/b. Para representar una fracci�n vamos a
//utilizar dos enteros: numerador y denominador. El programa debe permitir:
//	a) Mostrar la fracci�n: En este caso cuando el denominador es 1, se muestra s�lo el numerador.
//	b) Calcular el m�ximo com�n divisor (MCD ) entre dos n�meros.
//	c) Simplificar la fracci�n: consiste en dividir numerador y denominador por el MCD del numerador y
//			del denominador.
//	d) Sumar fracciones: La suma de dos fracciones es otra fracci�n cuyo numerador=n1*d2+d1*n2 y
//			denominador=d1*d2. Se debe simplificar la fracci�n resultado.
//	e) Restar fracciones: numerador=n1*d2-d1*n2 y denominador=d1*d2. Se debe simplificar la fracci�n
//			resultado.
//	f) Multiplicar fracciones: para ello el numerador=n1*n2 y denominador=d1*d2. Se debe simplificar la
//			fracci�n resultado.
//	g) Dividir fracciones: numerador=n1*d2 y denominador=d1*n2. Se debe simplificar la fracci�n
//			resultado.

/// Datos de entrada: 2 n�meros enteros que representan tanto el numerador como el denomindor de la funci�n.
/// Datos de salida: La fracci�n en s� y todas las operaciones que se solicitan en la consigna.

Algoritmo Ejercicio_9
	
	Definir numerador1, denominador1, numerador2, denominador2, resultadoNumerador, resultadoDenominador Como Entero;
	
	Escribir "-----------------------------------------------------------------------------------------------------";
	Escribir "                                        PRIMERA FRACCI�N"
	definirFraccion(numerador1, denominador1);
	simplificarFraccion(numerador1, denominador1);
	Escribir "FRACCI�N SIMPLIFICADA: " 
	mostrarFraccion(numerador1, denominador1)
	Escribir "-----------------------------------------------------------------------------------------------------";
	Escribir "                                        SEGUNDA FRACCI�N"
	definirFraccion(numerador2, denominador2);
	simplificarFraccion(numerador2, denominador2);
	Escribir "FRACCI�N SIMPLIFICADA: " 
	mostrarFraccion(numerador2, denominador2)
	Escribir "-----------------------------------------------------------------------------------------------------";
	Escribir "SUMA DE AMBAS FRACCIONES: "
	sumaFracciones(numerador1, denominador1, numerador2, denominador2, resultadoNumerador, resultadoDenominador);
	mostrarFraccion(resultadoNumerador, resultadoDenominador);
	Escribir "-----------------------------------------------------------------------------------------------------";
	Escribir "RESTA DE AMBAS FRACCIONES: "
	restaFracciones(numerador1, denominador1, numerador2, denominador2, resultadoNumerador, resultadoDenominador);
	mostrarFraccion(resultadoNumerador, resultadoDenominador);
	Escribir "-----------------------------------------------------------------------------------------------------";
	Escribir "MULTIPLICACI�N DE AMBAS FRACCIONES: "
	multiplicarFracciones(numerador1, denominador1, numerador2, denominador2, resultadoNumerador, resultadoDenominador);
	mostrarFraccion(resultadoNumerador, resultadoDenominador);
	Escribir "-----------------------------------------------------------------------------------------------------";
	Escribir "DIVISI�N DE AMBAS FRACCIONES: "
	dividirFracciones(numerador1, denominador1, numerador2, denominador2, resultadoNumerador, resultadoDenominador);
	mostrarFraccion(resultadoNumerador, resultadoDenominador);
	Escribir "-----------------------------------------------------------------------------------------------------";
	Escribir "-----------------------------------------------------------------------------------------------------";
	
FinAlgoritmo
///-----------------------------------------------------------------------------------------------------------------------------------------
SubProceso definirFraccion (numerador Por Referencia, denominador Por Referencia)
	
	Escribir "Ingrese el numerador de la fracci�n: ";
	Leer numerador;
	
	Repetir
		
		Escribir "Ingrese el denominador de la fracci�n: ";
		Leer denominador
		
		si denominador = 0 Entonces
			
			Escribir "ERROR: La divisi�n por cero no est� definida.";
			
		FinSi
		
	Mientras Que denominador = 0 
	
FinSubProceso
///-----------------------------------------------------------------------------------------------------------------------------------------
SubProceso mostrarFraccion (numerador, denominador)
	
	si denominador == 1 Entonces
		
		Escribir numerador;
		
	SiNo si numerador == 0 Entonces
			
			Escribir numerador;
			
		SiNo si (numerador > 0 y denominador > 0) o (numerador < 0 y denominador < 0) Entonces
			 	
				Escribir abs(numerador) "/" abs(denominador);
				
			SiNo
				
				Escribir "-(" abs(numerador) "/" abs(denominador) ")"
				
			FinSi
		FinSi
	FinSi
	
FinSubProceso
///-----------------------------------------------------------------------------------------------------------------------------------------
/// Algoritmo de Euclides
Funcion maximoComunDivisor = calcularMcd (numeroA, numeroB)
	
	Definir numeroAuxiliar Como Real;
	
	numeroA = abs(numeroA);
	numeroB = abs(numeroB);
	
	Mientras numeroB <> 0 Hacer
		
		numeroAuxiliar = numeroB;
		numeroB = numeroA % numeroB;
		numeroA = numeroAuxiliar;
		
	FinMientras
	
	maximoComunDivisor = numeroA;
	
FinFuncion
///-----------------------------------------------------------------------------------------------------------------------------------------
Funcion minimoComunMultiplo = calcularMcm (numeroA, numeroB)
	
	Definir multiploNumeroA, multiploNumeroB, contador1, contador2 Como Entero;
	
	numeroA = abs(numeroA);
	numeroB = abs(numeroB);
	
	contador1 = 1;
	contador2 = 1;
	
	multiploNumeroA = numeroA;
	multiploNumeroB = numeroB;
	
	Repetir
		
		si multiploNumeroA > multiploNumeroB Entonces
			
			Repetir
				
				multiploNumeroB = numeroB * contador1;
				contador1 = contador1 + 1
				
			Mientras Que multiploNumeroA > multiploNumeroB 
			
		SiNo
			
			Repetir
				
				multiploNumeroA = numeroA * contador2;
				contador2 = contador2 + 1;
				
			Mientras Que multiploNumeroA < multiploNumeroB 
			
		FinSi
		
	Mientras Que multiploNumeroA <> multiploNumeroB
	
	minimoComunMultiplo = multiploNumeroB;
	
FinFuncion
///-----------------------------------------------------------------------------------------------------------------------------------------
SubAlgoritmo simplificarFraccion(numerador Por Referencia, denominador Por Referencia)
	
	Definir maximoComunDivisor Como Entero
	
	maximoComunDivisor = calcularMcd(numerador, denominador);
	numerador = numerador/maximoComunDivisor
	denominador = denominador/maximoComunDivisor;
	
FinSubAlgoritmo
///-----------------------------------------------------------------------------------------------------------------------------------------
SubAlgoritmo sumaFracciones(numerador1, denominador1, numerador2, denominador2, resultadoNumerador Por Referencia, resultadoDenominador Por Referencia)
	
	Definir minimoComunMultiplo Como Entero;
	
	minimoComunMultiplo = calcularMcm(denominador1, denominador2);
	resultadoDenominador = minimoComunMultiplo;
	resultadoNumerador =  ((minimoComunMultiplo / denominador1) * numerador1) + ((minimoComunMultiplo / denominador2) * numerador2)
	
FinSubAlgoritmo
///-----------------------------------------------------------------------------------------------------------------------------------------
SubAlgoritmo restaFracciones(numerador1, denominador1, numerador2, denominador2, resultadoNumerador Por Referencia, resultadoDenominador Por Referencia)
	
	Definir minimoComunMultiplo Como Entero;
	
	minimoComunMultiplo = calcularMcm(denominador1, denominador2);
	resultadoDenominador = minimoComunMultiplo;
	resultadoNumerador =  ((minimoComunMultiplo / denominador1) * numerador1) - ((minimoComunMultiplo / denominador2) * numerador2)
	
FinSubAlgoritmo
///-----------------------------------------------------------------------------------------------------------------------------------------
SubAlgoritmo multiplicarFracciones(numerador1, denominador1, numerador2, denominador2, resultadoNumerador Por Referencia, resultadoDenominador Por Referencia)
	
	resultadoNumerador = numerador1 * numerador2;
	resultadoDenominador = denominador1 * denominador2;
	
	simplificarFraccion(resultadoNumerador, resultadoDenominador);
	
FinSubAlgoritmo
///-----------------------------------------------------------------------------------------------------------------------------------------
SubAlgoritmo dividirFracciones(numerador1, denominador1, numerador2, denominador2, resultadoNumerador Por Referencia, resultadoDenominador Por Referencia)
	
	resultadoNumerador = numerador1 * denominador2;
	resultadoDenominador = numerador2 * denominador1;

	simplificarFraccion(resultadoNumerador, resultadoDenominador);
	
FinSubAlgoritmo









