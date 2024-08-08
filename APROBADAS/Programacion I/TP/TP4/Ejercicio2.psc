// Escribir un programa que pregunte al usuario una cantidad a invertir, el interés anual y el número de
// años, y muestre por pantalla el capital obtenido en la inversión cada año que dura la inversión.

/// Datos de entrada: Cantidad de dinero a invertir, el interés anual que se ofrece y la cantidad de años que dura
/// Datos de salida: Capital obtenido cada año de duración de la inversión.

Algoritmo Ejercicio2
	
	Definir cantidadDineroInvertir, interesAnual, cantidadTotal, dineroGenerado Como Real
	Definir numeroAnios Como Entero
	
	cantidadTotal = cantidadDineroInvertir;
	
	Repetir
		
		Escribir "Ingrese la cantidad de dinero a invertir, el interés anual y la cantidad de años: (No puede ser un número menor o igual a 0)";
		Leer cantidadDineroInvertir, interesAnual, numeroAnios;
		
		si cantidadDineroInvertir <= 0 Entonces
			
			Escribir "La cantidad de dinero a invertir es menor o igual a 0";
			
		FinSi
		si interesAnual <= 0 Entonces
			
			Escribir "El interés anual es menor o igual a 0";
			
		FinSi
		si numeroAnios <= 0 Entonces
			
			Escribir "El número de años es menor o igual a 0";
			
		FinSi
		
	Mientras Que  0 >= cantidadDineroInvertir o 0 >= interesAnual o 0 >= numeroAnios
	
	cantidadTotal = cantidadDineroInvertir;
	
	Para i = 1 Hasta numeroAnios Con Paso 1 Hacer
		
		dineroGenerado = cantidadTotal * (interesAnual/100);
		Escribir "En el año N°" i " se generaron $" dineroGenerado;
		cantidadTotal = cantidadTotal + dineroGenerado;
		
	FinPara
	
FinAlgoritmo
