//Se desea calcular la cantidad de latas de pintura necesarias del mismo color para pintar las paredes de
//todas las habitaciones de una casa. Se conoce la siguiente información: Las puertas son de 0.75 x 2.00
//mts (ancho x alto) y las ventanas son de 1.20 x 1.50 mts. La pintura tiene las siguientes características:
//La información variable consiste de:
//	? El ancho, largo y alto de cada habitación.
//	? Cantidad de cada tipo de aberturas en cada habitación.
//	? Cantidad de manos a pintar (una "mano" representa cubrir la superficie completa con pintura).
//Realice un algoritmo para determinar la cantidad de latas de pintura a utilizar de manera tal que se
//minimice el costo total. El costo de cada lata es el siguiente: la lata de 1 litro cuesta $50, la de 4 cuesta
//$170, la de 10 cuesta $400 y la de 20 litros cuesta $700. Observe que, cuantas menos latas se compren
//menos se paga, ya que por ejemplo, una lata de 4 lts cuesta menos que 4 latas de 1 lts.

/// Datos de entrada: La cantidad de habiatciones, las dimensiones de cada habitación, la cantidad de 
///                   aberturas en cada habitación, la cantidad de manos de pintura.
/// Datos de salida: La cantidad de latas de pintura que minimizarán el costo de pintar toda la casa.

Algoritmo Ejercicio_9
	
	Definir areaTotal Como Real;
	Definir cantidadDeManos, cantidadDeLitros, cantidadLatas20, cantidadLatas10, cantidadLatas4, cantidadLatas1 Como Entero
	
	areaTotal = calcularAreaTotal;
	cantidadDeManos = ingresarNumeroPositivo("Ingrese la cantidad de manos que desea dar: ", "ERROR: La cantidad de manos debe ser un número positivo!");
	
	cantidadDeLitros = techo((areaTotal/14) * cantidadDeManos)
	
	calcularCantidadDeCadaLata(cantidadDeLitros, cantidadLatas20, cantidadLatas10, cantidadLatas4, cantidadLatas1);
	
	Escribir "---------------------------------------------------------------------------------------------------------|"
	Escribir "Se deberán pintar " cantidadDeLitros " L: " 
	Escribir "---------------------------------------------------------------------------------------------------------|"	
	
	Escribir "Se necesitarán: " 
	Escribir cantidadLatas20 " latas de 20 litros. ($" cantidadLatas20 * 700 ")";
	Escribir cantidadLatas10 " latas de 10 litros. ($" cantidadLatas10 * 400 ")";
	Escribir cantidadLatas4 " latas de 4 litros. ($" cantidadLatas4 * 170 ")";
	Escribir cantidadLatas1 " latas de 1 litros. ($" cantidadLatas1 * 50 ")"
	
	Escribir "El costo total de todas las latas es de: $" (cantidadLatas20 * 700) + (cantidadLatas10 * 400) + (antidadLatas4 * 170 ) + (cantidadLatas1 * 50)
	
	
FinAlgoritmo
///---------------------------------------------------------------------------------------------------------
Funcion areaTotal = calcularAreaTotal
	
	Definir areaTotal, areaHabitacion Como Real;
	Definir cantidadDeHabitaciones Como Entero;
	
	areaTotal = 0;
	
	cantidadDeHabitaciones = ingresarNumeroPositivo("Ingrese la cantidad de habitaciones que desea pintar: ", "ERROR: La cantidad de habitaciones no puede ser negativa o cero, inténtelo nuevamente")
	
	Para i = 1 Hasta cantidadDeHabitaciones Hacer
		
		Escribir "---------------------------------------------------------------------------------------------------------|"
		Escribir "Datos de la " i "° habitación: "
		Escribir "---------------------------------------------------------------------------------------------------------|"	
		
		areaHabitacion = calcularAreaHabitacion;
		areaTotal = areaTotal + areaHabitacion;
		
	FinPara
	
FinFuncion
///---------------------------------------------------------------------------------------------------------
Funcion areaHabitacion = calcularAreaHabitacion 
	
	Definir ancho, largo, alto, areaVentana, areaPuerta Como Real;
	Definir cantidadVentanas, cantidadPuertas Como Entero;
	
	Repetir
		
		ingresoDatosHabiatacion(ancho, largo, alto, cantidadVentanas, cantidadPuertas)
		
		areaVentana = 1.20 * 1.50;
		areaPuerta = 0.75 * 2.00;
		
		areaTodasVentanas = areaVentana * cantidadVentanas;
		areaTodasPuertas = areaPuerta * cantidadPuertas;
		
		areaHabitacion = (2 * (largo * alto) + 2 * (ancho * alto)) - (areaTodasPuertas + areaTodasVentanas)
		
		si areaHabitacion < 0 Entonces
			
			Escribir "ERROR: Ha habido un error en el ingreso de datos, se le solicitiarán nuevamente, disculpe las molestias."
			
		FinSi
		
	Mientras Que areaHabitacion < 0
	
FinFuncion
///---------------------------------------------------------------------------------------------------------
SubProceso ingresoDatosHabiatacion(ancho Por Referencia, largo Por Referencia, alto Por Referencia, cantidadVentanas Por Referencia, cantidadPuertas Por Referencia)
	
	Repetir
		
		Escribir "Ingrese el ancho de la habitación: ";
		Leer ancho;
		
		Escribir "Ingrese el largo de la habitación: ";
		Leer largo;
		
		Escribir "Ingrese el alto de la habitación: ";
		Leer alto;
		
		si ancho <= 0 y largo <= 0 y alto <= 0  Entonces
			
			Escribir "ERROR: Las dimensiones no de la habitación no pueden ser nulas o negativas.";
			
		FinSi
		
	Mientras Que ancho <= 0 y largo <= 0 y alto <= 0 
	
	Repetir
		
		Escribir "Ingrese la cantidad de ventanas que posee la habitación: ";
		Leer cantidadVentanas;
		
		Escribir "Ingrese la cantidad de puertas que posee la habitación: ";
		Leer cantidadPuertas;
		
		si cantidadPuertas <= 0 y cantidadVentanas < 0
			
			Escribir "ERROR: Hay un problema con la cantidad de aberturas, por favor, intente nuevamente.";
			
		FinSi
		
	Mientras Que cantidadPuertas <= 0 y cantidadVentanas < 0
	
FinSubProceso
///---------------------------------------------------------------------------------------------------------
SubProceso calcularCantidadDeCadaLata (cantidadDeLitros, contador20 Por Referencia, contador10 Por Referencia, contador4 Por Referencia, litrosRestantes Por Referencia)
	
	contador20 = 0;
	contador10 = 0;
	contador4 = 0;
	
	Repetir
		
		si cantidadDeLitros % 20 <> cantidadDeLitros Entonces
			
			contador20 = contador20 + 1;
			cantidadDeLitros = cantidadDeLitros - 20;
			
		SiNo
			
			si cantidadDeLitros % 10 <> cantidadDeLitros Entonces
				
				contador10 = contador10 + 1;
				cantidadDeLitros = cantidadDeLitros - 10;
				
			SiNo
				
				si cantidadDeLitros % 4 <> cantidadDeLitros Entonces
					
					contador4 = contador4 + 1;
					cantidadDeLitros = cantidadDeLitros - 4;
					
				FinSi
				
			FinSi
			
		FinSi
		
		litrosRestantes = cantidadDeLitros;
		
	Mientras Que litrosRestantes % 4 <> cantidadDeLitros
	
FinSubProceso
///---------------------------------------------------------------------------------------------------------
Funcion numeroPositivo = ingresarNumeroPositivo (mensaje, mensajeError)
	
	Definir numeroPositivo Como Entero
	
	Repetir
		
		Escribir mensaje
		Leer numeroPositivo;
		
		si numeroPositivo <= 0 Entonces
			
			Escribir mensajeError
			
		FinSi
		
	Mientras Que numeroPositivo <= 0 
	
FinFuncion
///---------------------------------------------------------------------------------------------------------
Funcion numeroTruncado = techo (numeroATruncar)
	
	Definir parteEntera Como Entero
	
	parteEntera = trunc(numeroATruncar);
	
	si numeroATruncar == parteEntera Entonces
		
		numeroTruncado = parteEntera;
		
	SiNo
		
		numeroTruncado = parteEntera + 1;
		
	FinSi
	
FinFuncion

















