//Elaborar un algoritmo en el cual se ingrese un número entre 1 y 10 y se muestre su equivalente
//en romano.

///Datos de entrada: Un número (preferiblemente entero) entre 1 y 10.
///Datos de salida: Una cadena que muestre el mísmo número pero en romano.

Algoritmo Ejercicio2
	
	Definir numeroATransformar Como Entero;
	Escribir "Ingrese un valor entre 1 y 10";
	Leer numeroATransformar;
	
	si numeroATransformar >= 1 y numeroATransformar <= 10 Entonces
		
		Segun numeroATransformar
			
			1:
				Escribir "I";
				
			2:
				Escribir "II";
				
			3: 
				Escribir "III";
				
			4:
				Escribir "IV";
				
			5:
				Escribir "V";
				
			6:
				Escribir "VI";
				
			7:
				Escribir "VII";
				
			8:
				Escribir "VIII";
				
			9:
				Escribir "IX";
				
			10:
				Escribir "X";
				
			De Otro Modo:
				
				Escribir "El valor indicado, no corresponde con una opción válida."
			
		FinSegun
		
	FinSi
	
FinAlgoritmo


















