// El personal de ANSES requiere clasificar a las personas que se jubilaran en el a�o de 2030.
// Existen tres tipos de jubilaciones: por edad, por antig�edad joven y por antig�edad adulta. Las
// personas adscritas a la jubilaci�n por edad deben tener 60 a�os o m�s, y una antig�edad en su
// empleo de menos de 25 a�os. Las personas adscritas a la jubilaci�n por antig�edad joven deben
// tener menos de 60 a�os y una antig�edad en su empleo de 25 a�os o m�s. Las personas
// adscritas a la jubilaci�n por antig�edad adulta deben tener 60 a�os o m�s y una antig�edad en
// su empleo de 25 a�os o m�s. Determinar en qu� tipo de jubilaci�n, quedara adscrita una
// persona.

/// Datos de entrada: 2 n�meros enteros que muestren la edad de las personas adscritas y la antig�edad en su empleo.
/// Datos de salida: Una cadena que clasifique a los empleados de acuerdo a los parametros previamente descritos.

Algoritmo Ejercicio11
	
	Definir edad, antiguedadEmpleo Como Entero;
	Escribir "Ingrese la edad de la persona interesada: ";
	Leer edad;
	Escribir "Ingrese la antig�edad en el empleo de la persona interesada: ";
	Leer antiguedadEmpleo;
	
	si (edad > 0 y antiguedadEmpleo > 0) y (edad >= antiguedadEmpleo) y edad < 99 Entonces
		
		si edad >= 60 y antiguedadEmpleo >= 25
			
			Escribir "La persona correspondiente est� adscrita a la jubilaci�n por antig�edad adulta.";
			
		SiNo
			
			si edad >= 60 y antiguedadEmpleo < 25
				
				Escribir "La persona correspondiente est� adscrita a la jubilaci�n por edad.";
				
			SiNo
				
				si edad < 60 y antiguedadEmpleo >= 25
					
					Escribir "La persona correspondiente est� adscrita a la jubilaci�n por antig�edad joven.";
					
				SiNo
					
					Escribir "La persona no est� calificada para acceder a ning�n tipo de jubilaci�n.";
					
				FinSi
				
			FinSi
			
		FinSi
		
	SiNo
		
		Escribir "Por favor, ingrese valores v�lidos.";
		
	FinSi
	
FinAlgoritmo
