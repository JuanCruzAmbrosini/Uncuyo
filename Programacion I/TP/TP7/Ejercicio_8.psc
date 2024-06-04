//Escribir un programa que dado un menú de opciones permita al usuario:
//	1. Crear una matriz de orden N, siendo N un número impar, con números aleatorios entre 1 y 9
//	2. Mostrar la matriz por pantalla
//	3. Mostrar el contenido de una ubicación (fila,columna) ingresada por el usuario
//	4. Mostrar los valores de la diagonal principal
//	5. Mostrar los valores de la diagonal secundaria
//	6. Mostrar el contorno de la matriz
//	7. Desea Continuar S/N?
//Por ejemplo, para la siguiente matriz de orden 5, se deben mostrar las siguientes salidas según la opción
//seleccionada por el usuario:

/// Datos de entrada: El orden de la matriz y la opción que desee el usuario para realizar alguna acción de las mostrada en el menú.
/// Datos de salida: Depende de la opción seleccionada en el menú (como mostrar la matriz, mostrar la diagonal secundaria, etc).

Algoritmo Ejercicio_8
	
	Definir salida, generoMatriz Como Logico;
	Definir opcionMenu, matriz, ordenMatriz Como Entero;
	
	salida = Falso;
	generoMatriz = Falso;
	
	Repetir
		
		opcionMenu = menu;
		
		si opcionMenu == 1 Entonces
			
			ordenMatriz = ingresarNumeroImparPositivo;
			Dimension matriz[ordenMatriz, ordenMatriz];
			
			rellenarMatrizAleatoria(matriz, ordenMatriz, ordenMatriz);
			
			generoMatriz = Verdadero;
			
		FinSi
		
		si generoMatriz Entonces
			
			Segun opcionMenu Hacer
				
				2:
					mostrarMatriz(matriz,ordenMatriz,ordenMatriz)
				3: 
					mostrarElementoMatriz(matriz,ordenMatriz,ordenMatriz)
				4: 
					mostrarDiagonalPrincipal(matriz,ordenMatriz,ordenMatriz)
				5: 
					mostrarDiagonalSecundaria(matriz,ordenMatriz)
				6: 
					mostrarContorno(matriz, ordenMatriz)
				7: 
					salida = elegirSalida
				
			FinSegun
			
		FinSi
		
	Mientras Que no salida  
	
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
Funcion numeroImpar = ingresarNumeroImparPositivo
	
	Definir numeroImpar Como Entero;
	
	Repetir
		
		Escribir "Ingrese un número impar, que va a determinar el orden de la matriz: "
		Leer numeroImpar
		
		si numeroImpar <= 1 y numeroImpar % 2 == 0 Entonces
			
			Escribir "ERROR: no se ha ingresado "
			
		FinSi
		
	Mientras Que numeroImpar <= 1 o numeroImpar % 2 == 0
	
FinFuncion
///----------------------------------------------------------------------------------------------------------
Funcion opcionMenu = menu
	
	Definir opcionMenu Como Entero;
	
	Repetir
		
		Escribir "Menú";
		Escribir "1_ Ingresar orden de la matriz.";
		Escribir "2_ Mostrar Matriz.";
		Escribir "3_ Mostrar elemento (fila, columna) de la matriz.";
		Escribir "4_ Mostrar diagonal principal.";
		Escribir "5_ Mostrar diagonal secundaria.";
		Escribir "6_ Mostrar contorno de la matriz.";
		Escribir "7_ Salir.";
		
		Leer opcionMenu
		
		si opcionMenu < 1 o opcionMenu > 7 Entonces
			
			Escribir "ERROR: por favor, ingrese un valor válido."
			
		FinSi
		
	Mientras Que opcionMenu < 1 o opcionMenu > 7
	
FinFuncion
///----------------------------------------------------------------------------------------------------------
SubProceso rellenarMatrizAleatoria (matriz, fila, columna)
	
	Definir i, j Como Entero;
	
	Para i = 0 Hasta fila - 1 Hacer
		
		Para j = 0 Hasta columna - 1 Hacer
			
			matriz[i,j] = Aleatorio(1,9);
			
		FinPara
		
	FinPara
	
FinSubProceso
///----------------------------------------------------------------------------------------------------------
SubProceso mostrarDiagonalPrincipal (matriz, fila, columna)
	
	Definir i, j Como Entero;
	
	Para i = 0 Hasta fila - 1 Con Paso 1 Hacer
		
		Para j = 0 Hasta columna - 1 Con Paso 1 Hacer
			
			si i = j Entonces
				
				Escribir Sin Saltar "| " matriz[i,j] " |"
				
			SiNo
				
				Escribir Sin Saltar "| 0 |"
				
			FinSi
			
		FinPara
		
		Escribir "";
		
	FinPara
	
FinSubProceso
///----------------------------------------------------------------------------------------------------------
SubProceso mostrarDiagonalSecundaria (matriz, orden)
	
	Definir i, j Como Entero;
	
	Para i = 0 Hasta orden - 1 Con Paso 1 Hacer
		
		Para j = 0 Hasta orden - 1 Con Paso 1 Hacer
			
			si i + j = orden - 1 Entonces
				
				Escribir Sin Saltar "| " matriz[i,j] " |"
				
			SiNo
				
				Escribir Sin Saltar "| 0 |"
				
			FinSi
			
		FinPara
		
		Escribir "";
		
	FinPara
	
FinSubProceso
///----------------------------------------------------------------------------------------------------------
SubAlgoritmo mostrarContorno(matriz, orden)
	
	Definir i, j Como Entero
	
	para i desde 0 hasta orden - 1 Hacer
		Escribir Sin Saltar "|"
		para j desde 0 Hasta orden - 1 Hacer
			
			si i = 0 o i = orden-1 Entonces
				Escribir Sin Saltar matriz(i, j) " "
			SiNo
				si j = orden-1 o j = 0 Entonces
					
					Escribir Sin Saltar matriz(i, j) " "
				SiNo
					
					Escribir Sin Saltar "- "
					
				FinSi
			FinSi
		FinPara
		Escribir "|"
		
	FinPara
	
FinSubAlgoritmo
///----------------------------------------------------------------------------------------------------------
Funcion salida = elegirSalida
	
	Definir seleccionSalida Como Caracter;
	Definir salida Como Logico;
	
	salida = Falso;
	
	Repetir
		
		Escribir "¿Desea salir del subrpgrama?"
		Leer seleccionSalida;
		
		seleccionSalida = Minusculas(seleccionSalida);
		
		si seleccionSalida = 'y' Entonces
			
			salida = Verdadero;
			
		SiNo
			
			si seleccionSalida <> 'n' Entonces
				
				Escribir "ERROR: ingrese una opción válida.";
				
			FinSi
			
		FinSi
		
	Mientras Que seleccionSalida <> 'y' y seleccionSalida <> 'n'
	
FinFuncion
///----------------------------------------------------------------------------------------------------------
SubProceso mostrarElementoMatriz (matriz, fila, columna)
	
	Definir filaUsuario, columnaUsuario Como Entero;
	Definir i, j Como Entero;
	
	Repetir
		
		Escribir "Ingrese el índice de la fila de la matriz que desea mostrar.";
		Leer filaUsuario
		filaUsuario = filaUsuario - 1;
		
		Escribir "Ingrese el índice de la columna de la matriz que desea mostrar;"
		Leer columnaUsuario;
		columnaUsuario = columnaUsuario - 1;
		
		si (filaUsuario < 0 o filaUsuario > fila) y (columnaUsuario < 0 o columnaUsuario > columna) Entonces
			
			Escribir "ERROR: ingrese un valor válido (valor fuera de los límites).";
			
		FinSi
		
	Mientras Que (filaUsuario < 0 o filaUsuario > fila) y (columnaUsuario < 0 o columnaUsuario > columna)
	
	Escribir matriz[filaUsuario,columnaUsuario];
	
FinSubProceso