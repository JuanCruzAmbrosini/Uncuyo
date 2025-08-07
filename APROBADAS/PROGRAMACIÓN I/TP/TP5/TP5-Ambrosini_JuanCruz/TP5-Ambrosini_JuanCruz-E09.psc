//	Escriba un programa que dibuje un gráfico de barras o histograma. Para ello se deben leer 4
//	números (comprendidos entre 1 y 20) e imprimir el número ingresado con tantos asteriscos
//	como indique su valor. El gráfico se debe imprimir como en el siguiente ejemplo:

/// Datos de entrada: 4 Datos numéricos ingresados por el usuario.
/// Datos de salida: Grafico de barras indicando reflejando las cantidades ingresadas por el usuario.

Algoritmo Ejercicio9
	
	Definir dato1, dato2, dato3, dato4 Como Entero
	
	Hacer
		
		Escribir "Por favor, ingrese el primer dato:  (1-20)";
		Leer dato1;
		Escribir "Por favor, ingrese el segundo dato:  (1-20)";
		Leer dato2;
		Escribir "Por favor, ingrese el tercer dato:  (1-20)";
		Leer dato3;
		Escribir "Por favor, ingrese el cuarto dato:  (1-20)";
		Leer dato4;
		
		si dato1 <= 0 o dato1 > 20 Entonces
			
			Escribir "Error: dato 1 fuera de los límites.";
			
		FinSi
		si dato2 <= 0 o dato2 > 20 Entonces
			
			Escribir "Error: dato 2 fuera de los límites.";
			
		FinSi
		si dato3 <= 0 o dato3 > 20 Entonces
			
			Escribir "Error: dato 3 fuera de los límites.";
			
		FinSi
		si dato4 <= 0 o dato4 > 20 Entonces
			
			Escribir "Error: dato 4 fuera de los límites.";
			
		FinSi
		
	Mientras Que dato1 <= 0 o dato1 > 20 y dato2 <= 0 o dato2 > 20 y dato3 <= 0 o dato3 > 20 y dato4 <= 0 o dato4 > 20
	
	Para i = 1 Hasta 5 Con Paso 1 Hacer
		
		Segun i Hacer
			
			1:
				Escribir dato1 ".| " Sin Saltar;
				Para j = 1 Hasta dato1 Hacer
					
					Escribir "*" Sin Saltar;
					
				FinPara
				Escribir "";
				Escribir "  |";
				
			2:
				
				Escribir dato2 ".| " Sin Saltar;
				Para j = 1 Hasta dato2 Hacer
					
					Escribir "*" Sin Saltar;
					
				FinPara
				Escribir "";
				Escribir "  |";
				
			3: 
				Escribir dato3 ".| " Sin Saltar;
				Para j = 1 Hasta dato3 Hacer
					
					Escribir "*" Sin Saltar;
					
				FinPara
				Escribir "";
				Escribir "  |";
				
			4:
				
				Escribir dato4 ".| " Sin Saltar;
				Para j = 1 Hasta dato4 Hacer
					
					Escribir "*" Sin Saltar;
					
				FinPara
				Escribir "";
				
			De Otro Modo:
				
				Escribir "  |_____________________________________________";
			
		FinSegun
		
	FinPara
	
FinAlgoritmo
