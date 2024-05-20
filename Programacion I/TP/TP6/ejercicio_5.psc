//	Escribir un algoritmo que muestre el término N (siendo N un número entero positivo) de la serie de
//	Fibonacci. La serie de Fibonacci sigue la siguiente serie: 1, 1, 2, 3, 5, 8, 13, 21? y así sucesivamente.
//	Observe que, para obtener un número, se suman los dos números anteriores. Por ejemplo, si
//	introducimos el término 3, el algoritmo nos debe mostrar el número 2 y si ingresamos el término 6 se
//	debe mostrar el número 8.

/// Datos de entrada: Número que indica hasta que término se desea desarrollar la serie de fibonacci.
/// Datos de salida: La serie de fibonacci desarrollada hasta ese valor.

Algoritmo Ejercicio_5
	
	Definir NTermino, valorNTermino Como Entero
	
	NTermino = seleccionNumeroPositivo;
	valorNTermino = calcularFibonacciHastaTerminoN (NTermino);
	
	Escribir "El valor de la serie de fibonacci hasta el término " NTermino " es: " valorNTermino
	
FinAlgoritmo

Funcion valorNTermino = calcularFibonacciHastaTerminoN (NTermino)
	
	Definir valorAuxiliar1, valorAuxiliar2, valorNTermino Como Entero;
	
	Segun NTermino Hacer
		
		1: valorNTermino = 1;
		2: valorNTermino = 1;
		De Otro Modo:
			
			valorAuxiliar1 = 1;
			valorAuxiliar2 = 1;
			
			Para i = 3 Hasta NTermino Hacer
				
				valorNTermino = valorAuxiliar1 + valorAuxiliar2;
				valorAuxiliar1 = valorAuxiliar2;
				valorAuxiliar2 = valorNTermino;
				
			FinPara
			
		
	FinSegun
	
FinFuncion

Funcion eleccionUsuario = seleccionNumeroPositivo 
	
	Definir eleccionUsuario Como Entero
	
	Repetir
		
		Escribir "Ingrese un valor mayor que 0."
		Leer eleccionUsuario
		
		si eleccionUsuario <= 0 Entonces
			
			Escribir "ERROR: Ingrese un valor válido."
			
		FinSi
		
	Mientras Que eleccionUsuario <= 0 
	
FinFuncion
















