// Escribir un programa que pregunte al usuario una cantidad a invertir, el inter�s anual y el n�mero de
// a�os, y muestre por pantalla el capital obtenido en la inversi�n cada a�o que dura la inversi�n.

/// Datos de entrada: Cantidad de dinero a invertir, el inter�s anual que se ofrece y la cantidad de a�os que dura
/// Datos de salida: Capital obtenido cada a�o de duraci�n de la inversi�n.

Algoritmo Ejercicio2
	
	Definir cantidadDineroInvertir, interesAnual, cantidadTotal, dineroGenerado Como Real
	Definir numeroAnios Como Entero
	
	cantidadTotal = cantidadDineroInvertir;
	
	Repetir
		
		Escribir "Ingrese la cantidad de dinero a invertir, el inter�s anual y la cantidad de a�os: (No puede ser un n�mero menor o igual a 0)";
		Leer cantidadDineroInvertir, interesAnual, numeroAnios;
		
		si cantidadDineroInvertir <= 0 Entonces
			
			Escribir "La cantidad de dinero a invertir es menor o igual a 0";
			
		FinSi
		si interesAnual <= 0 Entonces
			
			Escribir "El inter�s anual es menor o igual a 0";
			
		FinSi
		si numeroAnios <= 0 Entonces
			
			Escribir "El n�mero de a�os es menor o igual a 0";
			
		FinSi
		
	Mientras Que  0 >= cantidadDineroInvertir o 0 >= interesAnual o 0 >= numeroAnios
	
	cantidadTotal = cantidadDineroInvertir;
	
	Para i = 1 Hasta numeroAnios Con Paso 1 Hacer
		
		dineroGenerado = cantidadTotal * (interesAnual/100);
		Escribir "En el a�o N�" i " se generaron $" dineroGenerado;
		cantidadTotal = cantidadTotal + dineroGenerado;
		
	FinPara
	
FinAlgoritmo
