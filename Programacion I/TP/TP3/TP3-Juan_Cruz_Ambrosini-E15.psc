// Escriba un programa que solicite al usuario el tiempo que tardaron dos competidores de un rally
// y que establezca cuál competidor tardó menos. Si ambos lo hicieron exactamente en el mismo
// tiempo deberá indicarlo. El tiempo deberá ser ingresado en horas, minutos y segundos. Por
// ejemplo:
//	Tiempo que tardó el competidor (A) 
//		3 horas
//		16 minutos
//		48 segundos
//	Tiempo que tardó el competidor (B)
//		3 horas
//		21 minutos
//		12 segundos
//	Salida: El competidor que lo hizo en menos tiempo fue el A

/// Datos de entrada: Horas competidor A, Minutos competidor A, Segundos competidor A, Horas competidor B, Minutos competidor B, Segundos competidor B (Todos enteros).
/// Datos de salida: Mensaje que indica que competidor tardó menos (también se indica si lo hicieron al mismo tiempo).

Algoritmo Ejercicio15
	
	Definir horasCompetidorA, minutosCompetidorA, segundosCompetidorA, horasCompetidorB, minutosCompetidorB, segundosCompetidorB Como Entero;
	Escribir "Ingrese el tiempo del competidor A: (hh/mm/ss)";
	Leer horasCompetidorA, minutosCompetidorA, segundosCompetidorA;
	Escribir "Ingrese el tiempo del competidor B: (hh/mm/ss)";
	Leer horasCompetidorB, minutosCompetidorB, segundosCompetidorB;
	
	si horasCompetidorA > 0 y minutosCompetidorA > 0 y segundosCompetidorA > 0 y horasCompetidorB > 0 y minutosCompetidorB > 0 y segundosCompetidorB > 0 y minutosCompetidorA < 60 y minutosCompetidorB < 60 y segundosCompetidorA < 60 y segundosCompetidorB < 60 Entonces
		
		si horasCompetidorA == horasCompetidorB y minutosCompetidorA == minutosCompetidorB y segundosCompetidorA == segundosCompetidorB Entonces
			
			Escribir "Los competidores tardaron el mismo tiempo!";
			
		SiNo si horasCompetidorA == horasCompetidorB y minutosCompetidorA == minutosCompetidorB
				
				si segundosCompetidorA > segundosCompetidorB
					
					Escribir "El competidor que lo hizo en menos tiempo fue el B.";
					
				SiNo
					
					Escribir "El competidor que lo hizo en menos tiempo fue el A.";
					
				FinSi
				
			SiNo si horasCompetidorA == horasCompetidorB
					
					si minutosCompetidorA > minutosCompetidorB
						
						Escribir "El competidor que lo hizo en menos tiempo fue el B.";
						
					SiNo
						
						Escribir "El competidor que lo hizo en menos tiempo fue el A.";
						
					FinSi
					
				SiNo si horasCompetidorA > horasCompetidorB
						
						Escribir "El competidor que lo hizo en menos tiempo fue el B.";
						
					SiNo
						
						Escribir "El competidor que lo hizo en menos tiempo fue el A.";
						
					FinSi
					
				FinSi
				
			FinSi
			
		FinSi
		
	SiNo
		
		Escribir "Ingrese una expresión válida!"
		
	FinSi
	
FinAlgoritmo
