// El personal de ANSES requiere clasificar a las personas que se jubilaran en el año de 2030.
// Existen tres tipos de jubilaciones: por edad, por antigüedad joven y por antigüedad adulta. Las
// personas adscritas a la jubilación por edad deben tener 60 años o más, y una antigüedad en su
// empleo de menos de 25 años. Las personas adscritas a la jubilación por antigüedad joven deben
// tener menos de 60 años y una antigüedad en su empleo de 25 años o más. Las personas
// adscritas a la jubilación por antigüedad adulta deben tener 60 años o más y una antigüedad en
// su empleo de 25 años o más. Determinar en qué tipo de jubilación, quedara adscrita una
// persona.

/// Datos de entrada: 2 números enteros que muestren la edad de las personas adscritas y la antigüedad en su empleo.
/// Datos de salida: Una cadena que clasifique a los empleados de acuerdo a los parametros previamente descritos.

Algoritmo Ejercicio11
	
	Definir edad, antiguedadEmpleo Como Entero;
	Escribir "Ingrese la edad de la persona interesada: ";
	Leer edad;
	Escribir "Ingrese la antigüedad en el empleo de la persona interesada: ";
	Leer antiguedadEmpleo;
	
	si (edad > 0 y antiguedadEmpleo > 0) y (edad >= antiguedadEmpleo) y edad < 99 Entonces
		
		si edad >= 60 y antiguedadEmpleo >= 25
			
			Escribir "La persona correspondiente está adscrita a la jubilación por antigüedad adulta.";
			
		SiNo
			
			si edad >= 60 y antiguedadEmpleo < 25
				
				Escribir "La persona correspondiente está adscrita a la jubilación por edad.";
				
			SiNo
				
				si edad < 60 y antiguedadEmpleo >= 25
					
					Escribir "La persona correspondiente está adscrita a la jubilación por antigüedad joven.";
					
				SiNo
					
					Escribir "La persona no está calificada para acceder a ningún tipo de jubilación.";
					
				FinSi
				
			FinSi
			
		FinSi
		
	SiNo
		
		Escribir "Por favor, ingrese valores válidos.";
		
	FinSi
	
FinAlgoritmo
