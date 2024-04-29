//Se dispone de un conjunto de N familias, cada una de las cuales tiene un número M diferente de hijos.
//Escriba un algoritmo para averiguar:
//			a) el promedio de edad de los hijos de cada familia.
//			b) el promedio de edad de los hijos de todas las familias.

/// Datos de entrada: Cantidad de hijos y cantidad de familias y edad de cada hijo.
/// Datos de salida: 

Algoritmo Ejercicio1
	
	Definir cantidadFamilias, cantidadDeHijos, edadHijo Como Entero;
	Definir promHijosFlia, promHijosTotal Como Real;
	
	Repetir
		
		Escribir "Ingrese la cantidad de familias que desea analizar: ";
		Leer cantidadFamilias
		
		si cantidadFamilias < 0 Entonces
			
			Escribir "Error: Ingrese una cantidad mayor que 0.";
			
		FinSi
		
	Mientras Que cantidadFamilias < 0 
	
	Para i = 1 Hasta cantidadFamilias Hacer
		
		promHijosFlia = 0;
		
		Repetir
			
			Escribir "Ingrese la cantidad de hijos que posee la familia " i ": ";
			Leer cantidadDeHijos;
			
			si cantidadDeHijos < -1 Entonces
				
				Escribir "Error: Ingrese una cantidad positiva o 0.";
				
			FinSi
			
		Mientras Que cantidadDeHijos < -1 
		
		si cantidadDeHijos == 0 Entonces
			
			Escribir "La familia no tiene hijos.";
			cantidadFamilias = cantidadFamilias - 1;
			
		SiNo
			
			Para j = 1 Hasta cantidadDeHijos Hacer
				
				Repetir
					
					Escribir "Ingrese la edad de su hijo número " j ":";
					Leer edadHijo
					
					si edadHijo < -1 Entonces
						
						Escribir "Error: Ingrese una cantidad positiva o 0.";
						
					FinSi
				
				Mientras Que edadHijo < 0 
				
				promHijosFlia = edadHijo + promHijosFlia;
				
			FinPara
			
			promHijosFlia = promHijosFlia/cantidadDeHijos
			
			Escribir "El promedio de la edad de los hijos de la familia " i " es: " promHijosFlia;
			
		FinSi
		
		promHijosTotal = promHijosTotal + promHijosFlia;
		
	FinPara
	
	Escribir "El promedio de la edad de todos los hijos es: " promHijosTotal/cantidadFamilias;
	
FinAlgoritmo
