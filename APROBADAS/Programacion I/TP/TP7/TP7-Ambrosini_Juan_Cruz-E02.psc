//	Realizar un programa que lea N valores ingresados por el usuario. A continuaci�n, se debe buscar
//	un n�mero indicado por el usuario dentro del arreglo. El programa debe indicar la posici�n donde
//	se encuentra el valor. Si el n�mero se encuentra repetido dentro del arreglo se deben imprimir
//	todas las posiciones donde se encuentra ese valor. Finalmente, en caso que el n�mero a buscar no
//	se encuentre dentro del arreglo se debe mostrar un mensaje al usuario.

/// Datos de entrada: El usuario ingresar� la dimension del arreglo y, posteriormente, proceder� a llenar el arreglo para finalmente, ingresar un valor a buscar.
/// Datos de salida: El algoritmo debe mostrar las posiciones donde se encuentra el n�mero buscado. Tambi�n debe indicar si el valor no fue encontrado.

Algoritmo Ejercicio_2
	
	Definir dimensionVector Como Entero;
	Definir vector Como Real;
	
	dimensionVector = ingresarNumeroMayorQueUno("Ingrese la dimensi�n del vector que desea calcular: ");
	Dimension vector(dimensionVector);
	
	llenarVector(vector, dimensionVector);
	
	encontrarPosiciones(vector, dimensionVector);
	
FinAlgoritmo
///------------------------------------------------------------------------------------------------------------------
Funcion numeroIngresado = ingresarNumeroMayorQueUno (mensaje)
	
	Definir numeroIngresado Como Entero;
	
	Repetir
		
		Escribir mensaje
		Leer numeroIngresado
		
		si numeroIngresado <= 1 Entonces
			
			Escribir "ERROR: Ingrese una expresi�n mayor a uno."
			
		FinSi
		
	Mientras Que numeroIngresado <= 1 
	
FinFuncion
///------------------------------------------------------------------------------------------------------------------
SubProceso llenarVector(vector, dimensionVector)
	
	Para i = 0 Hasta dimensionVector - 1 Con Paso 1 Hacer
		
		Escribir "Ingrese el elemento " i + 1 " del vector: "
		Leer vector(i)
		
	FinPara
	
FinSubProceso
///------------------------------------------------------------------------------------------------------------------
SubProceso encontrarPosiciones(vector, dimensionVector)
	
	Definir numeroABuscar Como Real; 
	Definir numeroEncontrado Como Logico;
	
	numeroEncontrado = Falso;
	Escribir "Ingrese el valor que desea encontrar en el vector: ";
	Leer numeroABuscar;
	
	Para i = 0 Hasta dimensionVector - 1 Con Paso 1 Hacer
		
		si vector(i) == numeroABuscar Entonces
			
			Escribir "El valor buscado est� en la posici�n " i + 1 " del vector.";
			numeroEncontrado = Verdadero;
			
		FinSi
		
	FinPara
	
	si no numeroEncontrado Entonces
		
		Escribir "El valor buscado no se encuentra en el vector.";
		
	FinSi
	
FinSubProceso



























