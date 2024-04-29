//Escriba un algoritmo en el cual se solicite un listado de 10 n�meros enteros positivos al usuario. Una
//vez ingresados los valores se deben realizar las siguientes estad�sticas:
//	a) Cantidad de n�meros que son impares o avisar al usuario que no se ingres� ninguno.
//	b) Suma de los m�ltiplos de 7 (si los hay) o avisar al usuario que no se ingres� ninguno.
//	c) El Promedio de los n�meros m�ltiplo de 3 que fueron ingresados.
//		Notas:
//			- Se debe llamar la atenci�n al usuario cuando ingrese un valor que no es positivo.
//			- No se debe mostrar las estad�sticas hasta haber recibido del usuario un listado completamente
//			"v�lido" de n�meros solicitados (es decir, que los 10 n�meros recibidos sean positivos).
//		- Ayuda: Investigar la opci�n de PseInt de "predefenir entrada" para simplificar la prueba del
//               algoritmo.

/// Datos de entrada: 10 n�meros ingresados por el usuario.
/// Datos de salida: Mensajes que indiquen: Cantidad de n�meros impares (avisar si no se ingres� ninguno), suma de los m�ltiplos de 7 (avisar si no se ingres� 
/// ninguno), promedio de los m�ltiplos de 3

Algoritmo Ejercicio2
	
	Definir num, contadorImpares, sumaMultiplosSiete, contadorMultiplosTres, sumaMultiplosTres Como Entero;
	Definir promedioMultiplosTres Como Real;
	
	contadorImpares = 0;
	sumaMultiplosSiete = 0;
	
	Para i = 1 Hasta 10 Con Paso 1 Hacer
		
		Repetir
			
			Escribir "Ingrese un entero positivo: ";
			Leer num
			
			si num < 1 Entonces
				
				Escribir "Error: No ingres� un entero positivo.";
				
			FinSi
			
		Mientras Que num < 1
		
		si num % 2 <> 0 Entonces
			
			contadorImpares = contadorImpares + 1
			
		FinSi
		
		si num % 7 == 0 Entonces
			
			sumaMultiplosSiete = sumaMultiplosSiete + num;
			
		FinSi
		
		si num % 3 == 0 Entonces
			
			sumaMultiplosTres = sumaMultiplosTres + num;
			contadorMultiplosTres = contadorMultiplosTres + 1;
			
		FinSi
		
	FinPara
	
	si contadorImpares == 0 Entonces
		
		Escribir "No se ha ingresado ning�n valor impar.";
		
	SiNo
		
		Escribir "Se han ingresado " contadorImpares " n�meros impares.";
		
	FinSi
	
	si sumaMultiplosSiete == 0 Entonces
		
		Escribir "No se ha ingresado ning�n m�ltiplo de 7.";
		
	SiNo
		
		Escribir "La suma de los m�ltiplos de 7 es de: " sumaMultiplosSiete;
		
	FinSi
	
	promedioMultiplosTres = sumaMultiplosTres/contadorMultiplosTres;
	Escribir "El promedio de los m�ltiplos de 3 es: " promedioMultiplosTres;
	
FinAlgoritmo
