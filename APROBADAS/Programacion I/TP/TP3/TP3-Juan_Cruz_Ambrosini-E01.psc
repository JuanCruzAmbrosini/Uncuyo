//Dados 3 n�meros enteros, deducir cu�l es el valor central.

//Datos de entrada: 3 n�meros enteros.
//Dato de salida: Mensaje indicando cu�l es el n�mero con el valor central.

Algoritmo Ejercicio1
	
	Definir primerNum, segundoNum, tercerNum Como Entero;
	Escribir "Ingrese 3 n�meros enteros.";
	Leer primerNum, segundoNum, tercerNum;
	
	si primerNum == segundoNum y primerNum == tercerNum Entonces
		
		Escribir "Los tres n�meros tienen el mismo valor";
		
	SiNo
		
		si (primerNum > tercerNum y primerNum < segundoNum) o (primerNum > segundoNum y primerNum < tercerNum)
			
			Escribir "El n�mero con el valor central es el primero.";
			
		SiNo
			
			si (segundoNum > primerNum y segundoNum < tercerNum) o (segundoNum < primerNum y segundoNum > tercerNum)
				
				Escribir "El n�mero con el valor central es el segundo.";
				
			SiNo
				
				Escribir "El n�mero con el valor central es el tercero.";
				
			FinSi
			
		FinSi
		
	FinSi

	
FinAlgoritmo
