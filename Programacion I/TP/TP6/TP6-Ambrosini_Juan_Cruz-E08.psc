//Los empleados de una fábrica trabajan en dos turnos: Diurno y Nocturno. Se desea calcular el jornal
//diario de acuerdo con las siguientes reglas:
//	a. La tarifa de las horas diurnas es de $ 90
//	b. La tarifa de las horas nocturnas es de $ 125
//	c. En caso de ser fin de semana, la tarifa se incrementa en un 10% si el turno es diurno y en un
//		15% si el turno es nocturno.
//	d. En caso de ser día feriado la tarifa se duplica. Independientemente que sea fin de semana o no.
//El programa debe solicitar la siguiente información al usuario: el nombre del trabajador, el día de la
//semana, el turno (diurno o nocturno) y la cantidad de horas trabajadas. Tener en cuenta que al usuario
//se le solicita que ingrese el día de la semana (lunes, martes, etc.), pero para calcular el jornal diario
//debemos saber si el día ingresado es feriado o no.

/// Datos de entrada: El nombre del trabajador, el día de la semana, el turno, cantidad de horas trabajadas y si es feriado o no.
/// Datos de salida: Se debe mostrar el jornal diario de los trabajadores (en relación a las reglas establecidas en la consigna). 

Algoritmo Ejercicio_8
	
	Definir diaSemana, cantidadHoras Como Entero;
	Definir nombreEmpleado Como Caracter;
	Definir esFeriado, turnoNoche Como Logico;
	Definir jornal Como Real
	
	nombreEmpleado = ingresarNombreUsuario;
	diaSemana = eleccionDiaSemana;
	esFeriado = definidorVariableLogica ("¿El día trabajado ha sido un día feriado?", "1_ Si", "2_ No")
	turnoNoche = definidorVariableLogica ("Ingrese en que turno ha trabajado: ", "1_ Turno diurno", "2_ Turno nocturno");
	cantidadHoras = ingresarNumeroPositivoOCero ("Ingrese la cantidad de horas trabajadas: ")
	
	jornal = calcularJornal(cantidadHoras, esFeriado, turnoNoche, diaSemana);
	
	Escribir "El jornal diario para el empleado " nombreEmpleado " es de: $" jornal;
	
FinAlgoritmo
///---------------------------------------------------------------------------------------------------------------------------
Funcion diaSemana = eleccionDiaSemana
	
	Definir diaSemana Como Entero
	
	Repetir
		
		Escribir "Por favor, ingrese de que día desea calcular el jornal: ";
		Escribir "1_ Lunes";
		Escribir "2_ Martes";
		Escribir "3_ Miercoles";
		Escribir "4_ Jueves";
		Escribir "5_ Viernes";
		Escribir "6_ Sábado";
		Escribir "7_ Domingo";
		
		Leer diaSemana
		
		si diaSemana < 1 o diaSemana > 7 Entonces
			
			Escribir "ERROR: Por favor, ingrese una opción válida."
			
		FinSi
		
	Mientras Que diaSemana < 1 o diaSemana > 7 
	
FinFuncion
///---------------------------------------------------------------------------------------------------------------------------
Funcion nombreUsuario = ingresarNombreUsuario
	
	Definir nombreUsuario, confirmador Como Caracter;
	
	Repetir
		
		Escribir "Por favor, ingrese su nombre completo: "
		Leer nombreUsuario;
		
		Escribir "Usted ha ingresado el nombre: -" nombreUsuario "-. ¿Desea confirmar la entrada? (y/n)"
		Leer confirmador
		
		confirmador = Minusculas(confirmador);
		
		si confirmador <> "n" y confirmador <> "y"  Entonces
			
			Escribir "No se ha ingresado una opción válida y se le solicitará el nombre nuevamente."
			
		FinSi
		
	Mientras Que confirmador <> "y"
	
FinFuncion
///---------------------------------------------------------------------------------------------------------------------------
Funcion variableLogica = definidorVariableLogica (mensaje, opcion1, opcion2)
	
	Definir variableLogica Como Logico;
	Definir selector Como Entero;
	
	variableLogica = Verdadero;
	
	Repetir
		
		Escribir mensaje;
		Escribir opcion1;
		Escribir opcion2;
		
		Leer selector;
		
		si selector == 1 Entonces
			
			variableLogica = Falso;
			
		SiNo si selector <> 2 Entonces
				
				Escribir "ERROR: Inngrese una opción válida.";
				
			FinSi
		FinSi
		
	Mientras Que selector <> 1 y selector <> 2
	
FinFuncion
///---------------------------------------------------------------------------------------------------------------------------
Funcion numeroIngresado = ingresarNumeroPositivoOCero (mensaje)
	
	Definir numeroIngresado Como Entero;
	
	Repetir
		
		Escribir mensaje
		Leer numeroIngresado
		
		si numeroIngresado < 0 Entonces
			
			Escribir "ERROR: Ingrese una expresión positiva o 0."
			
		SiNo
			
			si numeroIngresado > 8 Entonces
				
				Escribir "ERROR: El máximo de horas laborales es de 8 hs."
				
			FinSi
			
		FinSi
		
		
	Mientras Que numeroIngresado < 0 o numeroIngresado > 8
	
FinFuncion
///---------------------------------------------------------------------------------------------------------------------------
Funcion jornal = calcularJornal (cantidadHoras, esFeriado, turnoNoche, diaSemana)
	
	Definir tarifaHora Como Real
	
	si turnoNoche Entonces
		
		tarifaHora = 125
		
	SiNo
		
		tarifaHora = 90;
		
	FinSi
	
	Segun diaSemana Hacer
		
		6,7: 
			si turnoNoche Entonces
				
				tarifaHora = tarifaHora + (tarifaHora * 0.15)
				
			SiNo
				
				tarifaHora = tarifaHora + (tarifaHora * 0.10)
				
			FinSi
		
	FinSegun
	
	si no esFeriado Entonces
		
		tarifaHora = tarifaHora * 2;
		
	FinSi
	
	jornal = tarifaHora * cantidadHoras;
	
FinFuncion









	