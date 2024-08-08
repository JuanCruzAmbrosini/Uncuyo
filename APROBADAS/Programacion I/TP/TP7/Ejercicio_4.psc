//	Escribir un programa que procese una secuencia de caracteres ingresada por teclado y terminada
//	en punto (leídos de a uno por vez), y luego codifique la palabra o frase ingresada de la siguiente
//	manera: cada vocal se reemplaza por el carácter que se indica en la tabla y el resto de los
//	caracteres (incluyendo a las vocales acentuadas) se mantienen sin cambios.

//	Realice un subprograma que reciba una vocal y retorne la codificación correspondiente.
//	Utilice la estructura "según" para la transformación. Además se debe calcular cuál es la
//	consonante dentro de la frase que se repite más veces.
//		Por ejemplo, si el usuario ingresa: Ayer, lunes, salimos a las once y 10.
//		La salida del programa debería ser:
//			@y#r, l*n#s, s@l$m%s @ l@s %nc# y 10.
//			La letra s es la más repetida y aparece 4 veces
//		Nota: investigue el uso de la función concatenar de PSeInt para armar la palabra/frase.

/// Datos de entrada: Cadena de caracteres que terminen en un punto.
/// Datos de salida: Mensaje que muestra la frase encriptada y que consonante se repite una mayor cantidad de veces.

Algoritmo Ejercicio_4
	
	Definir cadenaUsuario, cadenaEncriptada Como Caracter;
	
	cadenaEncriptada = "";
	
	cadenaUsuario = ingresarFrase;
	cadenaEncriptada = encriptadorCadena(cadenaUsuario);
	
	Escribir "La cadena encriptada es: ";
	Escribir cadenaEncriptada;
	
	contarConsonantes(cadenaUsuario);
	Escribir "Si una letra se repite la misma cantidad de veces que otra, se mostrará únicamente la primera en aparecer."
	
FinAlgoritmo
///---------------------------------------------------------------------------------------------------------
SubAlgoritmo contarConsonantes(cadenaUsuario)
	
	Definir i, j, contador, vectorContador, valorMasAlto, indice Como Entero;
	Definir caracterSubcadena, vectorConsonante Como Caracter;
	Definir estaEnLaCadena Como Logico;
	
	cadenaUsuario = Minusculas(cadenaUsuario);
	
	valorMasAlto = -10000;
	indice = 0;
	estaEnLaCadena = Falso;
	contador = 0;
	
	Dimension vectorContador[Longitud(cadenaUsuario)]
	Dimension vectorConsonante[Longitud(cadenaUsuario)];
	
	Para i = 0 Hasta Longitud(cadenaUsuario) - 1 Con Paso  1 Hacer
		
		vectorContador(i) = 0;
		vectorConsonante(i) = "°";
		
	FinPara
	
	Para i = 0 Hasta Longitud(cadenaUsuario) - 1 Con Paso 1 Hacer
		
		caracterSubcadena = Subcadena(cadenaUsuario, i, i);
		
		Para j = 0 Hasta Longitud(cadenaUsuario) - 1 Con Paso 1
			
			si vectorConsonante(j) == caracterSubcadena Entonces
				
				estaEnLaCadena = Verdadero;
				
			FinSi
			
		FinPara
		
		si no estaEnLaCadena y caracterSubcadena <> 'a' y caracterSubcadena <> 'e' y caracterSubcadena <> 'i' y caracterSubcadena <> 'o' y caracterSubcadena <> 'u'   Entonces
			
			vectorConsonante(contador) = caracterSubcadena;
			contador = contador + 1;
			
		FinSi
		
		estaEnLaCadena = Falso;
		
	FinPara
	
	Para i = 0 Hasta Longitud(cadenaUsuario) - 1 Con Paso 1 Hacer
		
		contador = 0;
		
		caracterSubcadena = vectorConsonante(i);
		
		Para j = 0 Hasta Longitud(cadenaUsuario) - 1 Con Paso 1 Hacer
			
			si caracterSubcadena == Subcadena(cadenaUsuario, j, j) y caracterSubcadena <> " " Entonces
				
				contador = contador + 1;
				
			FinSi
			
		FinPara
		
		vectorContador(i) = contador;
		
	FinPara
	
	encontrarValorMasAltoEIndice(vectorContador, indice, valorMasAlto, Longitud(cadenaUsuario))
	
	Escribir "La consonante más repetida es la letra: " vectorConsonante(indice) ". Y se repite " vectorContador(indice) " veces."
	
FinSubAlgoritmo
///---------------------------------------------------------------------------------------------------------
SubProceso encontrarValorMasAltoEIndice(vector, indice Por Referencia, valorMasAlto Por Referencia, dimensionVector)
	
	Definir i, valorAuxiliar Como Entero;
	
	valorAuxiliar = -10000;
	
	Para i = 0 Hasta dimensionVector - 1 Con Paso 1 Hacer
		
		si valorAuxiliar < vector(i) Entonces
			
			indice = i;
			valorAuxiliar = vector(i);
			
		FinSi
		
	FinPara
	
	valorMasAlto = valorAuxiliar;
	
FinSubProceso
///---------------------------------------------------------------------------------------------------------
SubProceso mostrarVector (vector, dimensionVector)
	
	Definir i Como Entero;
	
	Para i = 0 Hasta dimensionVector - 1 Con Paso 1 Hacer
		
		Escribir Sin Saltar vector(i) " |"
		
	FinPara
	
	Escribir "";
	
FinSubProceso
///---------------------------------------------------------------------------------------------------------
Funcion cadenaUsuario = ingresarFrase
	
	Definir ultimoCaracter, cadenaUsuario Como Caracter;
	
	Repetir
		
		Escribir "Ingrese la frase que desee (debe finalizar en un punto)";
		Leer cadenaUsuario;
		
		ultimoCaracter = Subcadena(cadenaUsuario,Longitud(cadenaUsuario) - 1,Longitud(cadenaUsuario) - 1)
		
		si ultimoCaracter <> '.' Entonces
			
			Escribir "ERROR: La frase ingresada no es válida! Intentelo nuevamente."
			
		FinSi
		
	Mientras Que ultimoCaracter <> '.'
	
FinSubAlgoritmo
///---------------------------------------------------------------------------------------------------------
Funcion nuevaCadena = encriptadorCadena(cadenaUsuario)
	
	Definir i Como Entero;
	Definir nuevaCadena, caracterActual Como Caracter;
	
	nuevaCadena = ""
	
	Para i = 0 Hasta Longitud(cadenaUsuario) - 1 Con Paso 1 Hacer
		
		caracterActual = Subcadena(cadenaUsuario, i,i )
		
		Segun caracterActual
			
			'A','a':
				
				caracterActual = '@';
				
			'E','e':
				
				caracterActual = '#';
				
			'I','i':
				
				caracterActual = '$';
				
			'O','o': 
				
				caracterActual = '%';
				
			'U','u':
				
				caracterActual = '*';
				
		FinSegun
		
		nuevaCadena = Concatenar(nuevaCadena,caracterActual);
		
	FinPara
	
FinFuncion