//	Un oficial de correos decide optimizar el trabajo de su oficina cortando todas las palabras de más
//	de cinco letras a sólo cinco letras (e indicando que una palabra fue cortada con el agregado de una
//	arroba). El oficial también elimina todos los espacios en blanco de más. Por ejemplo, el siguiente
//	texto:
//		Llego mañana  alrededor del mediodía
//	se transcribe como:
//		Llego mañan@ alred@ del medio@
//	Además, los puntos se reemplazan por la palabra especial STOP, y el punto final (que puede faltar
//	en el texto original) se indica como STOPSTOP.
//	Por ejemplo, el siguiente texto:
//		Llego mañana alrededor del mediodía. Voy a almorzar
//	Se lo transcribe como:
//		Llego mañan@ alred@ del medio@ STOP Voy a almor@ STOPSTOP
//	Para enviar un telegrama se debe abonar un valor por las palabras cortas y otro valor por las
//	palabras largas (las que deben ser cortadas).
//	Escriba un programa que automatice el trabajo del oficial de correos. Para ello se debe ingresar el
//	mensaje a transmitir, el costo de cada palabra corta, y el costo de cada palabra larga. El programa
//	debe mostrar como salida el texto del telegrama y el costo que se debe abonar po4r el mismo.

Algoritmo Ejercicio_5
	
	Definir frase Como Caracter;
	
	Escribir "Por favor, ingrese una frase que va a ser enviada por el telegrama: ";
	Leer frase;
	
	Escribir "La frase enviada es: ";
	Escribir regularEspacios(frase);
	
FinAlgoritmo
///---------------------------------------------------------------------------------------------------------
Funcion palabraAcortada = acortarPalabra (palabra)
	
	Definir i, longitudPalabra Como Entero;
	Definir palabraAcortada Como Caracter;
	
	palabraAcortada = "";
	
	longitudPalabra = Longitud(palabra)
	
	si Subcadena(palabra, Longitud(palabra) - 1, Longitud(palabra) - 1) == ',' o Subcadena(palabra, Longitud(palabra) - 1, Longitud(palabra) - 1) == ' ' o Subcadena(palabra, Longitud(palabra) - 1, Longitud(palabra) - 1) == '.' Entonces
		
		longitudPalabra = longitudPalabra - 1;
		
		
	FinSi
	
	si Subcadena(palabra, 0, 0) == ' ' Entonces
		
		longitudPalabra = longitudPalabra - 1; 
		
	FinSi
	
	si longitudPalabra > 5 Entonces
		
		si Subcadena(palabra, 0, 0) == ' ' Entonces
			
			palabraAcortada = Concatenar(Subcadena(palabra, 0, 5), '@');
			
			si Subcadena(palabra, Longitud(palabra) - 1, Longitud(palabra) - 1) == '.' Entonces
				
				palabraAcortada = Concatenar(palabraAcortada, '.')
				
			FinSi
			
		SiNo
			
			palabraAcortada = Concatenar(Subcadena(palabra, 0, 4), '@');
			
			si Subcadena(palabra, Longitud(palabra) - 1, Longitud(palabra) - 1) == '.' Entonces
				
				palabraAcortada = Concatenar(palabraAcortada, '.')
				
			FinSi
			
		FinSi
		
	SiNo
		
		palabraAcortada = palabra;
		
	FinSi
	
FinFuncion
///---------------------------------------------------------------------------------------------------------
Funcion frasePalabrasAcortada = acortarFrase(frase)
	
	Definir frasePalabrasAcortada, caracterActual, palabraActual, palabraAcortada Como Caracter;
	Definir i, contador Como Entero
	
	frasePalabrasAcortada = "";
	caracterActual = "";
	palabraActual = "";
	contador = 0;
	
	Para i = 0 Hasta Longitud(frase) - 1 Hacer
		
		caracterActual = Subcadena(frase, i, i);
		
		si caracterActual <> " " 
			
			palabraActual = Concatenar(palabraActual, caracterActual);
			
		SiNo
			
			si caracterActual == " " Entonces
				
				palabraAcortada = acortarPalabra(palabraActual);
				frasePalabrasAcortada = Concatenar(frasePalabrasAcortada, palabraAcortada);
				
				palabraActual = " ";
				
			FinSi
			
			
		FinSi
		
	FinPara
	
	si Longitud(palabraActual) > 0 Entonces
		
        palabraAcortada = acortarPalabra(palabraActual);
        frasePalabrasAcortada = Concatenar(frasePalabrasAcortada, palabraAcortada);
		
    FinSi
	
	
FinFuncion
///---------------------------------------------------------------------------------------------------------
Funcion fraseNueva = cambiarPuntos (frase)
	
	Definir i Como Entero;
	Definir caracterActual, fraseNueva Como Cadena;
	
	frase = acortarFrase(frase);
	caracterActual = "";
	fraseNueva = "";
	
	Para i = 0 Hasta Longitud(frase) - 1 Hacer
		
		caracterActual = Subcadena(frase, i, i);
		
		si caracterActual <> "." Entonces
			
			fraseNueva = Concatenar(fraseNueva, caracterActual);
			
			si i = Longitud(frase) - 1 Entonces
				
				fraseNueva = Concatenar(fraseNueva, " STOPSTOP");
				
			FinSi
			
		SiNo
			
			si i = Longitud(frase) - 1 Entonces
				
				fraseNueva = Concatenar(fraseNueva, " STOPSTOP");
				
			SiNo
				
				fraseNueva = Concatenar(fraseNueva, " STOP");
				
			FinSi
			
		FinSi
		
	FinPara
	
FinSubProceso
///---------------------------------------------------------------------------------------------------------
Funcion fraseNueva = regularEspacios (frase)
	
	Definir caracterActual, fraseNueva Como Cadena;
	Definir i, contador Como Entero;
	
	fraseNueva = cambiarPuntos(frase);
	caracterActual = "";
	contador = 0;
	
	Para i = 0 Hasta Longitud(fraseNueva) - 1 Hacer
		
		caracterActual = Subcadena(fraseNueva, i, i);	
		
		si caracterActual == ' ' Entonces
			
			contador = contador + 1
			
		SiNo
			
			contador = 0;
			
		FinSi
		
		si contador > 1 Entonces
			
			fraseNueva = Concatenar(Subcadena(fraseNueva, 0, i - contador ), Subcadena(fraseNueva, i, Longitud(fraseNueva) - 1))
			
		FinSi
		
	FinPara
	
FinFuncion

















