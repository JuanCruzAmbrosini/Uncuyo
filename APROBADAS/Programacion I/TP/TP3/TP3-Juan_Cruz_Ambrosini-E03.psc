// Escriba un programa que lea tres longitudes y determine si forman o no un tri�ngulo. Si es un
// tri�ngulo determine de qu� tipo de tri�ngulo se trata entre: equil�tero (si tiene tres lados
// iguales), is�sceles (si tiene dos lados iguales) o escaleno (si tiene tres lados desiguales).

/// Datos de entreda: 3 n�meros (enteros o reales) que representan los lados de un tri�ngulo.
/// Datos de salida: Una cadena que informe si los lados forman o no un tri�ngulo o no y, si lo forman informar de que tri�ngulo se trata.

Algoritmo Ejercicio3
	
	Definir lado1, lado2, lado3, ladoMasGrande Como Real;
	Definir esTriangulo Como Logico
	Escribir "Ingrese 3 lados de un tri�ngulo.";
	Leer lado1, lado2, lado3;
	esTriangulo = Falso;
	
	si lado1 > lado2 y lado1 >lado2
		
		ladoMasGrande = lado1;
		
	SiNo
		
		si lado2 > lado1 y lado2 > lado3
			
			ladoMasGrande = lado2;
			
		SiNo
			
			ladoMasGrande = lado3;
			
		FinSi
		
	FinSi
	
	
	
	si ladoMasGrande == lado1 y (lado2 + lado3) > ladoMasGrande
		
		esTriangulo = Verdadero;
		
	SiNo
		
		si ladoMasGrande == lado2 y (lado1 + lado3) > ladoMasGrande
			
			esTriangulo = Verdadero;
			
		SiNo
			
			si ladoMasGrande == lado3 y (lado1 + lado2) > ladoMasGrande
				
				esTriangulo = Verdadero;
				
			SiNo
				
				esTriangulo = Falso;
				
			FinSi
			
		FinSi
		
	FinSi
	
	si lado1 <= 0 o lado2 <= 0 o lado3 <= 0
		
		esTriangulo = Falso;
		
	FinSi
	
	si esTriangulo Entonces
		
		si lado1 == lado2 y lado1 == lado3
			
			Escribir "Es un tri�ngulo equil�tero!"
			
		SiNo
			
			si (lado1 == lado2 y lado1 <> lado3) o (lado1 == lado3 y lado1 <> lado2) o (lado3 == lado2 y lado3 <> lado1)
				
				Escribir "Es un tri�ngulo is�celes!";
				
			SiNo
				
				Escribir "Es un tri�ngulo escaleno!";
				
			FinSi
			
		FinSi
		
	SiNo
		
		Escribir "No es tri�ngulo :(";
		
	FinSi
	
FinAlgoritmo
















