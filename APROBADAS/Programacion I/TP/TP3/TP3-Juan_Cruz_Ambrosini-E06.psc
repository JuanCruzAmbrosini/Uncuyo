// Construir un programa que calcule el �ndice de masa corporal de una persona:
// e indique el estado en el que se encuentra esa persona en funci�n del valor de IMC:

/// Datos de entrada: Altura y peso del usuario, es decir, 2 n�meros reales.
/// Datos de salida: Mensaje que indique el estado en el que se encuentra la persona en funci�n del IMC.

Algoritmo Ejercicio6
	
	Definir altura, peso Como Real;
	Escribir "Ingrese su peso: ";
	Leer peso;
	Escribir "Ingrese su altura: ";
	Leer altura;
	
	imc = peso/altura^2;
	
	si peso > 10 y altura > 1 y peso < 300 y altura < 3 Entonces
		
		si imc < 16 Entonces
			
			Escribir "Criterio de ingreso en hospital.";
			
		SiNo
			
			si imc >= 16 y imc < 18 Entonces
				
				Escribir "Bajo peso.";
				
			SiNo
				
				si imc >= 18 y imc < 25 Entonces
					
					Escribir "Peso normal (saludable).";
					
				SiNo
					
					si imc >= 25 y imc < 30 Entonces
						
						Escribir "Sobrepeso (Obesidad de grado I)";
						
					SiNo
						
						si imc >= 30 y imc < 35 Entonces
							
							Escribir "Sobrepeso cr�nico (Obesidad de grado II)";
							
						SiNo
							
							si imc >= 35 y imc < 40 Entonces
								
								Escribir "Obesidad pre-m�rbida (Obesidad de grado III)";
								
							SiNo
								
								si imc >= 40 Entonces
									
									Escribir "Obesidad m�rbida (Obesidad de grado IV)";
									
								FinSi
								
							FinSi
							
						FinSi
						
					FinSi
					
				FinSi
				
			FinSi
			
		FinSi
		
	SiNo
		
		Escribir "Ingrese un dato v�lido."
		
	FinSi
	
FinAlgoritmo
