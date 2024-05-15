//Escriba un programa que solicite al usuario una fecha y muestre la fecha anterior. Realice pruebas de
//escritorio para los valores d=5, m=10, a=2012 y para d=1, m=3, a=2004.

/// Datos de entrada: Una fecha ingresada por el usuario.
/// Datos de salida: Muestra la fecha anterior.

Algoritmo Ejercicio_4
	
	Definir dia, mes, anio Como Entero
	
	anio = ingresoAnio;
	mes = ingresoMes;
	dia = ingresoDia (mes, anio);
	
	Escribir "Fecha ingresada: " dia " / " mes " / " anio
	
	calcularFechaAnterior(dia, mes, anio);
	
	Escribir "Fecha anterior: " dia " / " mes " / " anio
	
FinAlgoritmo

Funcion dia = ingresoDia(mes, anio)
	
	Definir diaValido Como Logico;
	Definir dia Como Entero;
	
	Repetir
		
		diaValido = Verdadero;
		Escribir "Por favor, ingrese un día: ";
		Leer dia;
		
		Segun mes Hacer
			
			1, 3, 5, 7, 8, 10, 12:
				
				si dia > 31 Entonces
					
					diaValido = Falso;
					
				FinSi
				
			4, 6, 9, 11: 
				
				si dia > 30 Entonces
					
					diaValido = Falso
					
				FinSi
				
			2:
				
				si anio % 4 = 0 Entonces
					
					si dia > 29 Entonces
						
						diaValido = Falso
						
					FinSi
					
				SiNo
					
					si dia > 28 Entonces
						
						diaValido = Falso
						
					FinSi
					
				FinSi
				
		FinSegun
		
		si diaValido = Falso
			
			Escribir "ERROR: Por favor, ingrese una fecha válida."
			
		FinSi
		
	Mientras Que diaValido = Falso
	
FinFuncion

Funcion mes = ingresoMes
	
	Definir mes Como Entero
	
	Repetir
		
		Escribir "Por favor, ingrese un mes: ";
		Leer mes
		
		si mes < 1 y mes > 12  Entonces
			
			Escribir "ERROR: Por favor, ingrese una fecha válida."
			
		FinSi
		
	Mientras Que mes < 1 y mes > 12 
	
FinFuncion

Funcion anio = ingresoAnio
	
	Definir anio Como Entero
	
	Repetir
		
		Escribir "Por favor, ingrese un año: ";
		Leer anio
		
		si anio < 1 Entonces
			
			Escribir "ERROR: Por favor, ingrese una fecha válida."
			
		FinSi
		
	Mientras Que anio < 1 
	
FinFuncion

SubProceso calcularFechaAnterior (dia Por Referencia, mes Por Referencia, anio Por Referencia)
	
	si dia == 1 Entonces
		
		si mes > 1 Entonces
			
			mes = mes - 1
			
		SiNo
			
			anio = anio - 1
			mes = 12
			
		FinSi
		
		Segun mes Hacer
			
			1, 3, 5, 7, 8, 10, 12:
				
				dia = 31
				
			4, 6, 9, 11: 
				
				dia = 30
				
			2:
				
				si anio % 4 = 0 Entonces
					
					dia = 29
					
				SiNo
					
					dia = 28
					
				FinSi
				
		FinSegun
		
	SiNo
		
		dia = dia - 1
		
	FinSi
	
FinSubProceso
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	