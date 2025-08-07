//Dos números son amigos si cada uno de ellos es igual a la suma de los divisores del otro. Por ejemplo
//220 y 284 son amigos ya que:
//	Suma de divisores de 284= 1 + 2 + 4 + 71 + 142 = 220
//	Suma de divisores de 220 = 1 + 2 + 4 + 5 + 10 + 11 + 20 + 22 + 44 + 55 + 110 = 284
//Escriba un programa que a través del uso de una función determine si dos números ingresados por el
//usuario son amigos o no.

/// Datos de entrada: 2 números ingresados por el usuario.
/// Datos de salida: Un mensaje que muestra si los números "son amigos" o no (usando el criterio de la consigna).

Algoritmo Ejercicio_7
	
	Definir primerNumero, segundoNumero,sumaDivisoresPrimero, sumaDivisoresSegundo Como Entero
	
	primerNumero = ingresarNumeroMayorQueUno ("Por favor, ingrese el primer valor: ");
	segundoNumero = ingresarNumeroMayorQueUno ("Por favor, ingrese el segundo valor: ")
	
	sumaDivisoresPrimero = calcularSumaDivisores (primerNumero);
	sumaDivisoresSegundo = calcularSumaDivisores (segundoNumero);
	
	si primerNumero == sumaDivisoresSegundo y segundoNumero == sumaDivisoresPrimero Entonces
		
		Escribir "Los números seleccionados son amigos!!";
		
	SiNo
		
		Escribir "Los números seleccionados no son amigos :(";
		
	FinSi
	
FinAlgoritmo

Funcion sumaDivisores = calcularSumaDivisores (numeroUsuario)
	
	Definir sumaDivisores Como Entero;
	
	Para i = 1 Hasta numeroUsuario - 1 Hacer
		
		si numeroUsuario % i == 0 Entonces
			
			sumaDivisores = sumaDivisores + i;
			
		FinSi
		
	FinPara
	
FinFuncion
///------------------------------------------------------------------------------------------------------------------
Funcion numeroIngresado = ingresarNumeroMayorQueUno (mensaje)
	
	Definir numeroIngresado Como Entero;
	
	Repetir
		
		Escribir mensaje
		Leer numeroIngresado
		
		si numeroIngresado <= 1 Entonces
			
			Escribir "ERROR: Ingrese una expresión mayor a uno."
			
		FinSi
		
	Mientras Que numeroIngresado <= 1 
	
FinFuncion















