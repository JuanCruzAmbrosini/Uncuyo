//	Realizar un programa que lea N valores ingresados por el usuario. A continuación, se debe buscar
//	un número indicado por el usuario dentro del arreglo. El programa debe indicar la posición donde
//	se encuentra el valor. Si el número se encuentra repetido dentro del arreglo se deben imprimir
//	todas las posiciones donde se encuentra ese valor. Finalmente, en caso que el número a buscar no
//	se encuentre dentro del arreglo se debe mostrar un mensaje al usuario.

/// Datos de entrada: El usuario ingresará la dimension del arreglo y, posteriormente, procederá a llenar el arreglo para finalmente, ingresar un valor a buscar.
/// Datos de salida: El algoritmo debe mostrar las posiciones donde se encuentra el número buscado. También debe indicar si el valor no fue encontrado.

Algoritmo Ejercicio_2
	
	Definir dimensionVector Como Entero;
	Definir vector Como Real;
	
	dimensionVector = ingresarNumeroMayorQueUno("Ingrese la dimensión del vector que desea calcular: ");
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
			
			Escribir "ERROR: Ingrese una expresión mayor a uno."
			
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
			
			Escribir "El valor buscado está en la posición " i + 1 " del vector.";
			numeroEncontrado = Verdadero;
			
		FinSi
		
	FinPara
	
	si no numeroEncontrado Entonces
		
		Escribir "El valor buscado no se encuentra en el vector.";
		
	FinSi
	
FinSubProceso



























