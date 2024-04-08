// Dada la nota de un alumno como una letra A, B, C o D. Indicar si el alumno aprob�, recupera
// o perdi� la materia. Se conoce que un alumno aprueba si tiene A o B; recupera si tiene una C
// y pierde la materia si tiene una D.

/// Entrada de datos: Caracter que indica la nota del alumno.
/// Salida de datos: Mensaje que indica si el alumno aprob�, recupera o pierde la materia.

Algoritmo Ejercicio4
	
	Definir nota Como Caracter;
	Escribir "Ingrese la nota del alumno: ";
	Leer nota;
	
	nota = Mayusculas(nota);
	
	Segun nota
		
		'A','B':
			Escribir "El alumno aprob�! Felicidades!";
			
		'C':
			Escribir "El alumno recupera la materia.";
			
		'D':
			Escribir "El alumno perdi� la materia :(";
			
		De Otro Modo:
			Escribir "La opci�n ingresada no es v�lida.";
		
	FinSegun
	
FinAlgoritmo
