//	Crear un algoritmo que dibuje una escalera de n�meros, donde cada l�nea de n�meros comience en
//	uno y termine en el n�mero de la l�nea. Solicitar la altura de la escalera al usuario al comenzar el
//	programa. Ejemplo: Si se ingresa que la altura de la escalera es igual a 3, se debe mostrar por pantalla:
//			1
//			12
//			123

/// Datos de entrada: El usuario ingresa la cantidad de escalones que quiere que tenga la escalera.
/// Datos de salida: La escalera con la cantidad de escalones que desea el usuario.

Algoritmo Ejercicio5
	
	Definir cantidadEscalones Como Entero;
	
	Repetir
		
		Escribir "Ingrese la cantidad de escalones: ";
		Leer cantidadEscalones;
		
		si cantidadEscalones <= 0 Entonces
			
			Escribir "Error: La cantidad de escalones tiene que ser mayor a 0.";
			
		FinSi
		
	Mientras Que cantidadEscalones <= 0
	
	Para i = 1 Hasta cantidadEscalones Hacer
		
		Para j = 1 Hasta i Hacer
			
			Escribir j " " Sin Saltar 
			
		FinPara
		
		Escribir "";		
		
	FinPara
	
FinAlgoritmo
