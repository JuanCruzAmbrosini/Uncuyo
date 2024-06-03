//En un juego se lanza un dado 5 veces y se gana cuando la suma de puntos obtenidos en los dos
//primeros lanzamientos es igual a la obtenida en los restantes tres. Por ejemplo:
//		>>juego()
//		dado = [3, 2, 1, 3, 1]
//		sumas = [5, 5]
//		respuesta=1
//		>>juego()
//		dado = [2, 4, 5, 2, 1]
//		sumas = [6, 8]
//		respuesta=0
//	Escriba un programa que simule los cinco lanzamientos del dado y retorne dos posibles valores: 1,
//	si se trata de un jugada ganadora y 0 en caso contrario. Además, el programa debe permitir realizar
//	N jugadas diferentes y mostrar por pantalla cada una de las jugadas (valores obtenidos por los
//	dados, sumas y respuesta) y el porcentaje de jugadas ganadoras.

Algoritmo Ejercicio_3
	
	Definir continuar Como Logico;
	Definir tiradas, resultado Como Entero;
	
	Dimension tiradas[6];
	
	continuar = Verdadero;
	
	Repetir
		
		llenarVectorAleatorio(tiradas, 6);
		mostrarVector(tiradas, 6);
		resultado = condicionVictoria(tiradas);
		
		si resultado == 1 Entonces
			
			Escribir "Felicidades! Usted ha ganado el juego! :)";
			continuar = Falso;
			
		SiNo
			
			Escribir "Usted perdió! Intentelo nuevamente.";
			continuar = definidorVariableLogica("¿Desea continuar jugando?", "1 - Si","2 - No" )
			
		FinSi
		
	Mientras Que continuar 
	
	
FinAlgoritmo
///---------------------------------------------------------------------------------------------------------------------------
Funcion variableLogica = definidorVariableLogica (mensaje, opcionVerdadera, opcionFalsa)
	
	Definir variableLogica Como Logico;
	Definir selector Como Entero;
	
	variableLogica = Falso;
	
	Repetir
		
		Escribir mensaje;
		Escribir opcionVerdadera;
		Escribir opcionFalsa;
		
		Leer selector;
		
		si selector == 1 Entonces
			
			variableLogica = Verdadero;
			
		SiNo si selector <> 2 Entonces
				
				Escribir "ERROR: Ingrese una opción válida.";
				
			FinSi
		FinSi
		
	Mientras Que selector <> 1 y selector <> 2
	
FinFuncion
///---------------------------------------------------------------------------------------------------------------------------
SubProceso llenarVectorAleatorio(vector, dimensionVector)
	
	Para i = 0 Hasta dimensionVector - 1 Con Paso 1 Hacer
		
		vector(i) = Aleatorio(1,6);
		
	FinPara
	
FinSubProceso
///------------------------------------------------------------------------------------------------------------------
SubProceso mostrarVector (vector, dimensionVector)
	
	Para i = 0 Hasta dimensionVector - 1 Hacer
		
		Escribir Sin Saltar vector(i) " |"
		
	FinPara
	
	Escribir "";
	
FinSubProceso
///------------------------------------------------------------------------------------------------------------------
Funcion resultado = condicionVictoria (vector)
	
	Definir contador1, contador2 Como Entero;
	contador1 = 0;
	contador2 = 0;
	
	Para i = 0 Hasta 5 Con Paso 1 Hacer
		
		si i < 2 Entonces
			
			contador1 = contador1 + vector(i);
			
		SiNo
			
			contador2 = contador2 + vector(i);
			
		FinSi
		
	FinPara
	
	si contador1 == contador2 Entonces
		
		resultado = 1;
		
	SiNo
		
		resultado = 0;
		
	FinSi
	
	Escribir "Primera suma: " contador1;
	Escribir "Segunda suma: " contador2;
	
FinFuncion
	