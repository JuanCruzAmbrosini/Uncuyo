//	Escribir un algoritmo que muestre el t�rmino N (siendo N un n�mero entero positivo) de la serie de
//	Fibonacci. La serie de Fibonacci sigue la siguiente serie: 1, 1, 2, 3, 5, 8, 13, 21? y as� sucesivamente.
//	Observe que, para obtener un n�mero, se suman los dos n�meros anteriores. Por ejemplo, si
//	introducimos el t�rmino 3, el algoritmo nos debe mostrar el n�mero 2 y si ingresamos el t�rmino 6 se
//	debe mostrar el n�mero 8.

/// Datos de entrada: N�mero que indica hasta que t�rmino se desea desarrollar la serie de fibonacci.
/// Datos de salida: La serie de fibonacci desarrollada hasta ese valor.

Algoritmo Ejercicio_5
	
	Definir NTermino, valorNTermino Como Entero
	
	NTermino = seleccionNumeroPositivo;
	valorNTermino = calcularFibonacciHastaTerminoN (NTermino);
	
	Escribir "El valor de la serie de fibonacci hasta el t�rmino " NTermino " es: " valorNTermino
	
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
			
			Escribir "ERROR: Ingrese un valor v�lido."
			
		FinSi
		
	Mientras Que eleccionUsuario <= 0 
	
FinFuncion
















