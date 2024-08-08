//Dados 3 números enteros, deducir cuál es el valor central.

//Datos de entrada: 3 números enteros.
//Dato de salida: Mensaje indicando cuál es el número con el valor central.

Algoritmo Ejercicio1
	
	Definir primerNum, segundoNum, tercerNum Como Entero;
	Escribir "Ingrese 3 números enteros.";
	Leer primerNum, segundoNum, tercerNum;
	
	si primerNum == segundoNum y primerNum == tercerNum Entonces
		
		Escribir "Los tres números tienen el mismo valor";
		
	SiNo
		
		si (primerNum > tercerNum y primerNum < segundoNum) o (primerNum > segundoNum y primerNum < tercerNum)
			
			Escribir "El número con el valor central es el primero.";
			
		SiNo
			
			si (segundoNum > primerNum y segundoNum < tercerNum) o (segundoNum < primerNum y segundoNum > tercerNum)
				
				Escribir "El número con el valor central es el segundo.";
				
			SiNo
				
				Escribir "El número con el valor central es el tercero.";
				
			FinSi
			
		FinSi
		
	FinSi

	
FinAlgoritmo
