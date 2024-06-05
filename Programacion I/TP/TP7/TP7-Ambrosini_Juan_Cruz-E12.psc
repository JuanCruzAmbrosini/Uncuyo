//	Se dice que una matriz tiene un punto de silla si alguna posición de la matriz es el menor valor de
//	su fila, y a la vez el mayor de su columna. Escribir un programa que tenga como entrada una matriz
//	de números reales, y calcular la posición de un punto de silla (si es que existe).

/// Datos de entrada: La cantidad de filas y columnas de una matriz, los datos presentes en la matriz y un dato indexado de la matriz.
/// Datos de salida: Un mensaje que muestre si el valor elegido es un punto silla o no.

Algoritmo Ejercicio_12
	
	Definir filas, columnas, matriz, valorFilaUsuario, valorColumnaUsuario Como Entero
	Definir esPuntoSilla como Logico;
	
	filas = seleccionNumeroPositivo("Ingrese el número de filas: ");
	columnas = seleccionNumeroPositivo("Ingrese el número de columnas: ");
	
	Dimension matriz[filas, columnas];
	rellenarMatriz(matriz, filas, columnas);
	
	mostrarMatriz(matriz, filas, columnas)
	
	seleccionFilaYColumna(valorFilaUsuario, valorColumnaUsuario, filas, columnas);
	esPuntoSilla = verificarPuntoSilla(matriz, filas, columnas, valorFilaUsuario, valorColumnaUsuario);
	
	si esPuntoSilla Entonces
		
		Escribir "El punto elegido es un punto silla de la matriz!";
		
	SiNo
		
		Escribir "El punto elegido no es un punto silla de la matriz."
		
	FinSi
	
FinAlgoritmo
///---------------------------------------------------------------------------------
Funcion eleccionUsuario = seleccionNumeroPositivo (mensaje)
	
	Definir eleccionUsuario Como Entero
	
	Repetir
		
		Escribir mensaje;
		Leer eleccionUsuario
		
		si eleccionUsuario <= 0 Entonces
			
			Escribir "ERROR: Ingrese un valor válido."
			
		FinSi
		
	Mientras Que eleccionUsuario <= 0 
	
FinFuncion
///---------------------------------------------------------------------------------
SubProceso seleccionFilaYColumna (valorFilaUsuario Por Referencia, valorColumnaUsuario Por Referencia, filas, columnas)
	
	Repetir
		
		Escribir "Ingrese el valor de la fila que quiere analizar.";
		Leer valorFilaUsuario
		
		si valorFilaUsuario < 0 o valorFilaUsuario >= filas Entonces
			
			Escribir "ERROR: Ingrese un valor válido."
			
		FinSi
		
	Mientras Que valorFilaUsuario < 0 o valorFilaUsuario >= filas
	
	Repetir
		
		Escribir "Ingrese el valor de la columna que quiere analizar.";
		Leer valorColumnaUsuario
		
		si valorColumnaUsuario < 0 o valorColumnaUsuario >= columnas Entonces
			
			Escribir "ERROR: Ingrese un valor válido."
			
		FinSi
		
	Mientras Que valorColumnaUsuario < 0 o valorColumnaUsuario >= columnas
	
FinSubProceso
///---------------------------------------------------------------------------------
SubProceso rellenarMatriz (matriz, filas, columnas)
	
	Definir i, j Como Entero;
	
	Para i = 0 Hasta filas - 1 Hacer
		
		Para j = 0 Hasta columnas - 1 Hacer
			
			Escribir "Ingrese el valor [ " i " , " j " ] de la matriz: " 
			Leer matriz(i,j);
			
		FinPara
		
	FinPara
	
FinSubProceso
///---------------------------------------------------------------------------------
Funcion esPuntoSilla = verificarPuntoSilla(matriz, filas, columnas, valorFilaUsuario, valorColumnaUsuario)
	
	Definir esPuntoSilla Como Logico;
	Definir valorElejido, i, j Como Entero;
	
	valorElejido = matriz[valorFilaUsuario, valorColumnaUsuario];
	esPuntoSilla = Verdadero
	
	Para i = 0 Hasta columnas - 1 Hacer

		si valorElejido >= matriz[valorFilaUsuario,i] y valorColumnaUsuario <> i Entonces
			
			esPuntoSilla = Falso
			
		FinSi
		
	FinPara
	
	Para j = 0 Hasta filas - 1 Hacer 
		
		
		si valorElejido <= matriz[j,valorColumnaUsuario] y valorFilaUsuario <> j Entonces
			
			esPuntoSilla = Falso
			
		FinSi
		
	FinPara
	
FinFuncion
///----------------------------------------------------------------------------------------------------------
SubProceso mostrarMatriz(matriz, filas,columnas)
	
	Definir i, j Como Entero;
	
	Para i = 0 Hasta filas - 1 Con Paso 1 Hacer
		
		Para j = 0 Hasta columnas - 1 Con Paso 1 Hacer
			
			Escribir Sin Saltar "| " matriz[i,j] " |"
			
		FinPara
		
		Escribir "";
		
	FinPara
	
FinSubProceso







