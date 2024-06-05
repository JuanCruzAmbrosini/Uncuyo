//	Construya un programa que lea 3 palabras de mínimo 3 caracteres y máximo 5 caracteres y, a
//	medida que el usuario las va ingresando, construya una "sopa de letras para niños" de tamaño de
//	20 x 20 caracteres. Para la ubicación de las palabras se debe tener en cuenta las siguientes
//	restricciones:
//		a. Las palabras se ubican al azar en la sopa de letra.
//		b. Cada una de las palabras debe quedar en una orientación distinta, es decir, una en
//			horizontal, una en vertical y otra en diagonal.
//		c. Se debe determinar en forma aleatoria el sentido (de izq a derecha o viceversa, de
//			arriba hacia abajo o viceversa) tomando en cuenta la orientación.
//		d. Las palabras no deben chocar entre sí.
//	Una vez concluída la ubicación de las palabras, rellene los espacios no utilizados con un número
//	aleatorio del 0 al 9. Finalmente imprima por pantalla la sopa de letras creada.

Algoritmo Ejercicio_14
	
	Definir matriz, palabra1, palabra2, palabra3, vectorPalabra1, vectorPalabra2, vectorPalabra3 Como Caracter
	
	Dimension matriz[20,20];
	
	rellenarMatrizVacia(matriz, 20, 20);
	
	Escribir "-------------------------------------------------- JUEGO SOPA DE LETRAS --------------------------------------------------";
	
	palabra1 = seleccionPalabra("Ingrese la primer palabra de la sopa de letras (de 3 a 5 caracteres): ");
	palabra2 = seleccionPalabra("Ingrese la segunda palabra de la sopa de letras (de 3 a 5 caracteres): ");
	palabra3 = seleccionPalabra("Ingrese la tercera palabra de la sopa de letras (de 3 a 5 caracteres): ");
	
	Escribir "----------------------------------------------------------------------------------------------------------";
	Escribir "----------------------------------------------------------------------------------------------------------";
	Escribir "----------------------------------------------------------------------------------------------------------";
	Escribir "";
	Escribir "";
	
	Dimension vectorPalabra1[Longitud(palabra1)];
	Dimension vectorPalabra2[Longitud(palabra2)];
	Dimension vectorPalabra3[Longitud(palabra3)];
	
	vectorizarCadena(palabra1, vectorPalabra1, Longitud(palabra1));
	vectorizarCadena(palabra2, vectorPalabra2, Longitud(palabra2));
	vectorizarCadena(palabra3, vectorPalabra3, Longitud(palabra3));
	
	sortearDarVuelta(vectorPalabra1, Longitud(palabra1));
	sortearDarVuelta(vectorPalabra2, Longitud(palabra2));
	sortearDarVuelta(vectorPalabra3, Longitud(palabra3));
	
	colocarPalabraHorizontal(matriz, 20, vectorPalabra1, Longitud(palabra1));
	colocarPalabraVertical(matriz, 20, vectorPalabra2, Longitud(palabra2));
	colocarPalabraDiagonal(matriz, 20, vectorPalabra3, Longitud(palabra3));
	
	completarMatriz(matriz, 20);
	
	mostrarMatriz(matriz, 20, 20);
	
FinAlgoritmo
///----------------------------------------------------------------------------------------------------------
SubProceso mostrarMatriz(matriz, fila, columna)
	
	Definir i, j Como Entero;
	
	Para i = 0 Hasta fila - 1 Con Paso 1 Hacer
		
		Para j = 0 Hasta columna - 1 Con Paso 1 Hacer
			
			Escribir Sin Saltar "| " matriz[i,j] " |"
			
		FinPara
		
		Escribir "";
		
	FinPara
	
FinSubProceso
///----------------------------------------------------------------------------------------------------------
SubProceso rellenarMatrizVacia (matriz, fila, columna)
	
	Definir i, j Como Entero;
	
	Para i = 0 Hasta fila - 1 Hacer
		
		Para j = 0 Hasta columna - 1 Hacer
			
			matriz[i,j] = " ";
			
		FinPara
		
	FinPara
FinSubProceso
///----------------------------------------------------------------------------------------------------------
Funcion eleccionUsuario = seleccionPalabra (mensaje)
	
	Definir eleccionUsuario Como Caracter;
	
	Repetir
		
		Escribir mensaje;
		Leer eleccionUsuario
		
		si  Longitud(eleccionUsuario) < 3 y Longitud(eleccionUsuario) < 5 Entonces
			
			Escribir "ERROR: Ingrese un valor válido."
			
		FinSi
		
	Mientras Que Longitud(eleccionUsuario) < 3 y Longitud(eleccionUsuario) < 5
	
FinFuncion
///----------------------------------------------------------------------------------------------------------
SubProceso  vectorizarCadena(frase, vector, dimensionVector) 
	
	Definir caracterActual Como Caracter;
	Definir i Como Entero;
	
	
	Para i = 0 Hasta Longitud(frase) - 1 Con Paso 1 Hacer
		
		caracterActual = Subcadena(frase, i, i)
		
		vector(i) = caracterActual;
		
	FinPara
	
FinSubProceso
///----------------------------------------------------------------------------------------------------------
SubProceso mostrarVector (vector, dimensionVector)
	
	Definir i Como Entero;
	
	Para i = 0 Hasta dimensionVector - 1 Hacer
		
		Escribir Sin Saltar vector(i) " | "
		
	FinPara
	
	Escribir "";
	
FinSubProceso
///----------------------------------------------------------------------------------------------------------
SubProceso darVueltaVector(vector, dimensionVector)
	
	Definir vectorAuxiliar Como Caracter;
	Definir contador, i Como Entero;
	
	Dimension vectorAuxiliar[dimensionVector];
	
	Para i = 0 Hasta dimensionVector - 1 Hacer
		
		vectorAuxiliar(i) = "";
		
	FinPara
	
	contador = 0;
	
	Para i = dimensionVector - 1 Hasta 0 Con Paso - 1 Hacer
		
		vectorAuxiliar(contador) = vector(i);
		contador = contador + 1;
		
	FinPara
	
	Para i = 0 Hasta dimensionVector - 1 Hacer
		
		vector(i) = vectorAuxiliar(i)
		
	FinPara
	
FinSubProceso
///----------------------------------------------------------------------------------------------------------
SubProceso sortearDarVuelta(vector, dimensionVector)
	
	Definir darVuelta, i Como Entero;
	
	darVuelta = Aleatorio(1,2)
	
	si darVuelta == 1 Entonces
		
		darVueltaVector(vector, dimensionVector)
		
	FinSi
	
FinSubProceso
///----------------------------------------------------------------------------------------------------------
SubProceso colocarPalabraHorizontal(matriz, dimensionMatriz, vector, dimensionVector)
	
	Definir j, fila, columna Como Entero;
	
	fila = Aleatorio(0,19)
	columna = Aleatorio(0,19 - (dimensionVector))
	
	
	Para j = 0 Hasta dimensionVector - 1 Hacer
		
		matriz[fila,columna + j] = vector(j); 
		
	FinPara
	
FinSubProceso
///----------------------------------------------------------------------------------------------------------
SubProceso colocarPalabraVertical(matriz, dimensionMatriz, vector, dimensionVector)
	
	Definir i, j, fila, columna Como Entero;
	Definir colision Como Logico;
	
	colision = Falso
	
	Repetir
		
		columna = Aleatorio(0,19)
		fila = Aleatorio(0,19 - (dimensionVector))
		
		colision = verificarColisionesVertical(matriz, dimensionMatriz, vector, dimensionVector, fila, columna)
		
		si no colision Entonces
			
			Para i = 0 Hasta dimensionVector - 1 Hacer
				
				matriz[fila + i,columna] = vector(i);
				
			FinPara
			
		FinSi
		
	Mientras Que colision 
	
FinSubProceso
///----------------------------------------------------------------------------------------------------------
SubProceso colocarPalabraDiagonal(matriz, dimensionMatriz, vector, dimensionVector)
	
	Definir i, j, fila, columna Como Entero;
	Definir colision Como Logico;
	
	colision = Falso
	
	Repetir
		
		columna = Aleatorio(0,19 - (dimensionVector));
		fila = Aleatorio(0,19 - (dimensionVector));
		
		colision = verificarColisionesDiagonal(matriz, dimensionMatriz, vector, dimensionVector, fila, columna);
		
		si no colision Entonces
			
			Para i = 0 Hasta dimensionVector - 1 Hacer
				
				Para j = 0 Hasta dimensionVector - 1 Hacer
					
					si i = j Entonces
						
						matriz[fila + i,columna + j] = vector(j);
						
					FinSi
					
				FinPara
				
			FinPara
			
		FinSi
		
	Mientras Que colision
	
FinSubProceso
///---------------------------------------------------------------------------------------------------------- 
Funcion colision = verificarColisionesVertical (matriz, dimensionMatriz, vector, dimensionVector, fila, columna)
	
	Definir colision Como Logico;
	Definir i, j Como Entero;
	
	colision = Falso;
	
	Para i = 0 Hasta dimensionVector - 1 Hacer
		
		si matriz[fila + i,columna] <> " " Entonces
			
			colision = Verdadero;
			
		FinSi
		
	FinPara
	
FinFuncion
///---------------------------------------------------------------------------------------------------------- 
Funcion colision = verificarColisionesDiagonal (matriz, dimensionMatriz, vector, dimensionVector, fila, columna)
	
	Definir colision Como Logico;
	Definir i, j Como Entero;
	
	colision = Falso;
	
	Para i = 0 Hasta dimensionVector - 1 Hacer
		
		Para j = 0 Hasta dimensionVector - 1 Hacer
			
			si matriz[fila + i,columna + j] <> " " Entonces
				
				colision = Verdadero;
				
			FinSi
			
		FinPara
		
	FinPara
	
FinFuncion
///---------------------------------------------------------------------------------------------------------- 
SubProceso completarMatriz(matriz, dimensionMatriz)
	
	Definir i, j Como Entero
	
	Para i = 0 Hasta dimensionMatriz - 1 Hacer
		
		Para j = 0 Hasta dimensionMatriz - 1 Hacer
			
			si matriz[i,j] = " " Entonces
				
				matriz[i,j] = ConvertirATexto(Aleatorio(0,9));
				
			FinSi
			
		FinPara
		
	FinPara
	
FinSubProceso





























































