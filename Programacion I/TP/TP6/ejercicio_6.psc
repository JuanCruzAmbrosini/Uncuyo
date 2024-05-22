// Escriba un programa que imprima 10 triángulos, alternando triángulos que tienen 6 renglones de
// asteriscos con otros que tienen 7 renglones de x. Ejemplo:
// *
// **
// ***
// ****
// *****
// ******
// x
// xx
// xxx
// xxxx
// xxxxx
// xxxxxx
// xxxxxxx

/// Datos de entrada: No presenta datos de entrada.
/// Datos de salida: 10 Triángulos hechos por asteriscos o x 

Algoritmo sin_titulo
	
	Para i = 1 Hasta 10 Con Paso 1 Hacer
		
		si i % 2 == 0 Entonces
			
			dibujarTriangulo(7, 'x');
			
		SiNo
			
			dibujarTriangulo(6, '*');
			
		FinSi
		
	FinPara
	
FinAlgoritmo

SubProceso dibujarTriangulo (cantidadRenglones, dibujo)
	
	Para i = 1 Hasta cantidadRenglones Hacer
		
		Escribir ""
		
		Para j = 1 Hasta i Hacer
			
			Escribir dibujo Sin Saltar;
			
		FinPara
		
	FinPara
	
FinSubProceso
