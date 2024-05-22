//Solicitar al usuario que digite un n�mero y determine lo siguiente:
//		a. Si el n�mero es capic�a (ej. 12321)
//		b. Si el n�mero es primo o no. Un n�mero es primo cuando es divisible s�lo por 1 y por s� mismo,
//				por ejemplo: 2, 3, 5, 7, 11, 13, 17, etc.
//		c. Si el n�mero tiene todos sus d�gitos impares (ejemplo: 333, 55, etc.)
//	Todas las opciones deben ser presentadas al usuario a trav�s de un men� de opciones.

/// Datos de entrada: N�mero ingresado por el usuario
/// Datos de salida: Un menu que le permita al usuario realizar las operaciones detalladas en la consigna (y el resultado de cada una de las operaciones.)

Algoritmo Ejercicio_2
	
	Definir numeroUsuario, numeroInvertido, seleccionUsuario Como Entero;
	Definir esCapicua, esPrimo, digitosImpares Como Logico;
	
	Escribir "Por favor, ingrese un n�mero a analizar: ";
	Leer numeroUsuario;
	
	seleccionUsuario = menu;
	
	Segun seleccionUsuario Hacer
		
		1:
			esCapicua = verificarCapicua(numeroUsuario);
			
			si esCapicua Entonces
				
				Escribir "�El n�mero ingresado es capic�a!";
				
			SiNo
				
				Escribir "El n�mero ingresado no es capic�a.";
				
			FinSi
			
		2:
			
			esPrimo = verificarPrimo(numeroUsuario);
			
			si esPrimo Entonces
				
				Escribir "�El n�mero ingresado es primo!";
				
			SiNo
				
				Escribir "El n�mero ingresado no es primo.";
				
			FinSi
			
		3:
			
			digitosImpares = verificarDigitos(numeroUsuario);
			
			si digitosImpares Entonces
				
				Escribir "�El n�mero ingresado tiene todos sus d�gitos impares!";
				
			SiNo
				
				Escribir "El n�mero ingresado no tiene todos sus d�gitos impares.";
				
			FinSi
		
	FinSegun
	
FinAlgoritmo

Funcion  seleccionUsuario = menu
	
	Definir seleccionUsuario Como Entero;
	
	Escribir "MENU";
	Escribir "1. Verificar si el n�mero ingresado es capic�a.";
	Escribir "2. Verificar si el n�mero es primo.";
	Escribir "3. Verificar si todas sus cifras son impares.";
	
	Repetir
		
		Leer seleccionUsuario;
		
		si seleccionUsuario <> 1 y seleccionUsuario <> 2 y seleccionUsuario <> 3 Entonces
			
			Escribir "Por favor, ingrese una opci�n v�lida."
			
		FinSi
		
	Mientras Que seleccionUsuario <> 1 y seleccionUsuario <> 2 y seleccionUsuario <> 3 
	

	
FinFuncion

Funcion esCapicua = verificarCapicua (numeroUsuario)
	
	Definir  numeroInvertido Como Entero;
	
	esCapicua = Falso;
	
	numeroInvertido = invertirNumero (numeroUsuario);
	
	si abs(numeroInvertido) == abs(numeroUsuario) Entonces
		
		esCapicua = Verdadero
		
	FinSi
	
FinFuncion

Funcion numeroInvertido = invertirNumero (numeroUsuario)
	
	Definir numeroInvertido, contador, numeroAuxiliar, proximaCifra Como Entero;
	
	contador = 0;
	numeroAuxiliar = numeroUsuario;
	
	Repetir
		
		numeroAuxiliar = trunc(numeroAuxiliar/10);
		contador = contador + 1;
		
	Mientras Que numeroAuxiliar > 0 
	
	Repetir
		
		proximaCifra = numeroUsuario % 10;
		numeroUsuario = trunc(numeroUsuario/10)
		numeroInvertido = numeroInvertido + (proximaCifra * (10 ^ (contador - 1)));
		contador = contador - 1;
		
	Mientras Que contador > 0
	
FinFuncion

Funcion esPrimo = verificarPrimo (numeroUsuario)
	
	Definir numeroAuxiliar Como Entero;
	
	numeroAuxiliar = numeroUsuario - 1;
	esPrimo = Verdadero;
	
	Repetir
		
		si abs(numeroUsuario) > 1 Entonces
			
			si numeroUsuario % numeroAuxiliar = 0 y numeroAuxiliar <> 1 o numeroUsuario = 0 Entonces
				
				esPrimo = Falso;
				
			FinSi
			
		SiNo
			
			esPrimo = Falso;
			
		FinSi
		
		numeroAuxiliar = numeroAuxiliar - 1;
		
	Mientras Que numeroAuxiliar > 1 y esPrimo 
	
FinFuncion

Funcion digitosImpares = verificarDigitos (numeroUsuario)
	
	Definir proximaCifra Como Entero
	digitosImpares = Verdadero
	
	Repetir
		
		proximaCifra = numeroUsuario % 10;
		numeroUsuario = trunc(numeroUsuario/10);
		
		si proximaCifra % 2 == 0 Entonces
			
			digitosImpares = Falso
			
		FinSi
		
	Mientras Que numeroUsuario > 0
	
FinFuncion

	
	

















