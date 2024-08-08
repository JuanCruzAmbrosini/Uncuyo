//	Un cuadrado mágico 3 x 3 es una matriz 3 x 3 formada por números del 1 al 9 donde la suma de
//	sus filas, sus columnas y sus diagonales son idénticas. Crear un programa que permita introducir
//  un cuadrado por teclado y determine si este cuadrado es mágico o no. En caso de tratarse de un
//	cuadrado mágico se debe mostrar la suma, caso contrario se debe indicar un mensaje. El programa
//	deberá comprobar que los números introducidos son correctos, es decir, están entre el 1 y el 9.

/// Datos de entrada: Todos los números que formarán el potencial cuadrado mágico.
/// Datos de salida: El cuadrado en sí junto con las sumas.

Algoritmo Ejercicio_11
	
	Definir matriz, dim, vectorSuma, suma, i, j Como Entero;
	
	suma = 0;
	
	dim = 3
	
	Dimension vectorSuma((2*dim)+2);
	
	Dimension matriz(dim,dim);
	
	llenadoDeMatriz(matriz, dim);
	
	mostrarMatriz(matriz, dim);
	
	si verificacionMagica(matriz, dim, vectorSuma) = Verdadero Entonces
		
		Para i = 0 Hasta dim - 1 Con Paso 1 Hacer
			
			Para j = 0 Hasta dim -1 Con Paso 1 Hacer
				
				suma = suma + matriz[i,j];
				
			FinPara
			
		FinPara
		
		Escribir "La matriz ingresada es una matriz mágica!";
		Escribir "La suma de los valores de la matriz es de: ", suma;
		
	SiNo
		
		Escribir "La matriz ingresada no es una matriz mágica.";
		
	FinSi
	
FinAlgoritmo
///---------------------------------------------------------------------------------
SubProceso llenadoDeMatriz(matriz Por Referencia, dim)
	
	Definir i,j Como Entero;
	
	
	Para i = 0 Hasta dim - 1 Con Paso 1 Hacer
		
		Para j = 0 Hasta dim - 1 Con Paso 1 Hacer
			
			Hacer
				
				Escribir "Ingrese el valor de la posición ",i,", ",j," de la matriz.";
				Leer matriz[i,j];
				
				si matriz[i,j] > 9 o matriz[i,j] < 0 Entonces
					
					Escribir "Ingrese un valor válido."
					
				FinSi
				
			Mientras Que matriz[i,j] > 9 o matriz[i,j] < 0
			
		FinPara
		
	FinPara
	
FinSubProceso
///---------------------------------------------------------------------------------
SubAlgoritmo mostrarMatriz(matriz, dim)
	
	Definir i, j Como Entero;
	
	Para i = 0 Hasta dim - 1 Con Paso 1 Hacer
		
		Para j = 0 Hasta dim - 1 Con Paso 1 Hacer
			
			Si j < dim - 1 Entonces
				
				Escribir matriz[i,j], ", " Sin Saltar;
				
			SiNo
				
				Escribir matriz[i,j]
				
			FinSi
			
		FinPara
		
	FinPara
	
FinSubAlgoritmo
///---------------------------------------------------------------------------------
Funcion retorno = verificacionMagica(matriz, dim, vectorSuma Por Referencia)
	
	Definir i,j,k Como Entero;
	Definir retorno Como Logico;
	
	Para i = 0 Hasta (2*dim)+1 Hacer
		
		vectorSuma(i) = 0;
		
	FinPara
	
	retorno = Verdadero;
	
	Para i = 0 hasta dim - 1 Con Paso 1 Hacer
		
		Para j = 0 Hasta dim -1 Con Paso 1 Hacer
			
			vectorSuma[i] = vectorSuma[i] + matriz[j,i];
			
		FinPara
		
	FinPara
	
	k = 0;
	
	Para i = dim Hasta (2*dim)-1 Con Paso 1 Hacer
		
		Para j = 0 Hasta dim - 1 Con Paso 1 Hacer
			
			vectorSuma[i] = vectorSuma[i] + matriz[k,j];
			
		FinPara
		
		k = k + 1;
		
	FinPara
	
	Para i = 2*dim Hasta 2*dim Con Paso 1 Hacer
		
		vectorSuma[i] = 0
		
		Para j = 0 Hasta dim - 1 Con Paso 1 Hacer
			
			vectorSuma[i] = vectorSuma[i] + matriz[j,j];
			
		FinPara
		
	FinPara
	
	Para i = (2*dim)+1 Hasta (2*dim)+1 Con Paso 1 Hacer
		
		vectorSuma[i] = 0
		
		para k = 0 Hasta dim - 1 Con Paso 1 Hacer
			
			vectorSuma[i] = vectorSuma[i] + matriz[k, dim - 1 - k];
			
		FinPara
		
	FinPara
	
	Para i = (2*dim)+1 Hasta 1 Con Paso -1 Hacer
		
		si vectorSuma[i] <> vectorSuma[i - 1] Entonces
			
			retorno = falso;
			
		FinSi
		
	FinPara
	
	Escribir "El vector con la suma parcial es de: ";
	Para i = 0 Hasta (2*dim)+1 Con Paso 1 Hacer
		
		si i < (2*dim)+1 Entonces
			
			Escribir vectorSuma[i],", " Sin Saltar;
			
		SiNo
			
			Escribir vectorSuma[i];
			
		FinSi
		
	FinPara
	
FinFuncion