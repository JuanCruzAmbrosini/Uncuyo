//Solicitar al usuario que digite un número y determine lo siguiente:
//		a. Si el número es capicúa (ej. 12321)
//		b. Si el número es primo o no. Un número es primo cuando es divisible sólo por 1 y por sí mismo,
//				por ejemplo: 2, 3, 5, 7, 11, 13, 17, etc.
//		c. Si el número tiene todos sus dígitos impares (ejemplo: 333, 55, etc.)
//	Todas las opciones deben ser presentadas al usuario a través de un menú de opciones.

/// Datos de entrada: Número ingresado por el usuario
/// Datos de salida: Un menu que le permita al usuario realizar las operaciones detalladas en la consigna (y el resultado de cada una de las operaciones.)

Algoritmo Ejercicio_2
	
	Definir numeroUsuario, numeroInvertido, seleccionUsuario Como Entero;
	Definir esCapicua, esPrimo Como Logico;
	
	numeroUsuario = 344;
	
	esCapicua = verificarCapicua (numeroUsuario); 
	
	Escribir esCapicua;
	
FinAlgoritmo

Funcion  seleccionUsuario = menu ()
	
	Definir seleccionUsuario Como Entero;
	
	Escribir "MENU";
	Escribir "1. Verificar si el número ingresado es capicúa.";
	Escribir "2. Verificar si el número es primo.";
	Escribir "3. Verificar si todas sus cifras son impares.";
	
	Leer seleccionUsuario;
	
FinFuncion

Funcion esCapicua = verificarCapicua (numeroUsuario)
	
	Definir  numeroInvertido Como Entero;
	
	esCapicua = Falso;
	
	numeroInvertido = invertirNumero (numeroUsuario);
	
	si numeroInvertido == numeroUsuario Entonces
		
		esCapicua = Verdadero
		
	FinSi
	
FinFuncion

Funcion numeroInvertido = invertirNumero (numeroUsuario)
	
	Definir numeroInvertido, contador, numeroAuxiliar, proximaCifra Como Entero;
	
	contador = 0;
	numeroAuxiliar = numeroUsuario;
	
	Hacer
		
		numeroAuxiliar = trunc(numeroAuxiliar/10);
		contador = contador + 1;
		
	Mientras Que numeroAuxiliar > 0 
	
	Hacer
		
		proximaCifra = numeroUsuario % 10;
		numeroUsuario = trunc(numeroUsuario/10)
		numeroInvertido = numeroInvertido + (proximaCifra * (10 ^ (contador - 1)));
		contador = contador - 1;
		
	Mientras Que contador > 0
	
FinFuncion

Funcion esPrimo = verificarPrimo (numeroUsuario)
	
	esPrimo = Verdadero
	
	Hacer