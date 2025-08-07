//Crear un array que contenga 100 notas con valores entre 0 y 20 generadas aleatoriamente
//mediante el uso de la función azar() o aleatorio() de PseInt. Luego, de acuerdo a las notas
//contenidas, el programa debe indicar cuántos estudiantes son:
//	? Deficientes 0-5
//	? Regulares 6-10
//	? Buenos 11-15
//	? Excelentes 16-20

/// Datos de entrada: No hay datos de entrada.
/// Datos de salida: La cantidad de estudiantes correspondientes a cada una de las notas.

Algoritmo Ejercicio_1
	
	Definir notas Como Real;
	Dimension notas[100];
	
	llenarVectorAleatorio(notas, 100);
	mostrarVector(notas, 100);
	contarAlumnos(notas, 100);
	
FinAlgoritmo
///------------------------------------------------------------------------------------------------------------------
SubProceso llenarVectorAleatorio(vector, dimensionVector)
	
	Para i = 0 Hasta dimensionVector - 1 Con Paso 1 Hacer
		
		vector(i) = Aleatorio(0,20);
		
	FinPara
	
FinSubProceso
///------------------------------------------------------------------------------------------------------------------
SubProceso contarAlumnos(vector, dimensionVector)
	
	Definir deficientes, regulares, buenos, excelentes Como Entero
	deficientes = 0;
	regulares = 0;
	buenos = 0;
	excelentes = 0;
	
	Para i = 0 Hasta dimensionVector - 1 Hacer
		
		si vector(i) <= 5 Entonces
			
			deficientes = deficientes + 1;
			
		SiNo
			
			si vector(i) <= 10 Entonces
				
				regulares = regulares + 1;
				
			SiNo
				
				si vector(i) <= 15 Entonces
					
					buenos = buenos + 1;
					
				SiNo
					
					excelentes = excelentes + 1;
					
				FinSi
				
			FinSi
			
		FinSi
		
	FinPara
	
	Escribir "La cantidad de alumnos deficientes es de: " deficientes;
	Escribir "La cantidad de alumnos regulares es de: " regulares;
	Escribir "La cantidad de alumnos buenos es de: " buenos;
	Escribir "La cantidad de alumnos excelentes es de: " excelentes;
	
FinSubProceso
///------------------------------------------------------------------------------------------------------------------
SubProceso mostrarVector (vector, dimensionVector)
	
	Para i = 0 Hasta dimensionVector - 1 Hacer
		
		Escribir Sin Saltar vector(i) " |"
		
	FinPara
	
	Escribir "";
	
FinSubProceso
	