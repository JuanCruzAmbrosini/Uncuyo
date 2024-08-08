// Una obra social tiene tres clases de socios. Los socios tipo A abonan una cuota mayor pero
// tiene un 50% de descuento en todos los tipos de tratamientos odontológicos. Los socios tipo B
// abonan una cuota moderada y tienen un 35% de descuento para los mismos tratamientos que
// los socios del tipo A. Los socios que menos aportan, los de tipo C, no reciben descuentos sobre
// dichos tratamientos. Solicite una letra (carácter) que representa la clase de un socio, y luego un
// valor real que represente el costo del tratamiento (previo al descuento) y determine el importe
// en efectivo a pagar por dicho socio.

/// Datos de entrada: Caracter que indica el tipo de socio dentro de la obra social. Valor real que indique el costo del tratamiento.
/// Datos de salida: Valor real que representa el importe a pagar en efectivo y mensaje informandole al usuario.

Algoritmo Ejercicio12
	
	Definir tipoSocio Como Caracter;
	Definir costoTratamiento, importeAPagar Como Real;
	
	Escribir "Indique el tipo de plan que ha contratado: ";
	Escribir "Tipo A (A)";
	Escribir "Tipo B (B)";
	Escribir "Tipo C (C)";
	Leer tipoSocio;
	tipoSocio = Minusculas(tipoSocio);
	
	Escribir "Indique el costo del tratamiento: ";
	Leer costoTratamiento;
	
	si costoTratamiento > 0
		
		Segun tipoSocio Hacer
			
			"a", "tipo a", "tipoa":
				
				importeAPagar = costoTratamiento - (costoTratamiento * 0.50)
				Escribir "Su importe a pagar, como socio de tipo A es de: ", importeAPagar;
				
			"b", "tipo b", "tipob":
				
				importeAPagar = costoTratamiento - (costoTratamiento * 0.35)
				Escribir "Su importe a pagar, como socio de tipo B es de: ", importeAPagar;
				
			"c", "tipo c", "tipoc":
				
				importeAPagar = costoTratamiento
				Escribir "Su importe a pagar, como socio de tipo C es de: ", importeAPagar;
				
			De Otro Modo:
				
				Escribir "Ingrese una expresión válida."
				
		FinSegun
		
	SiNo
		
		Escribir "Ingrese una expresión válida."
		
	FinSi
	
FinAlgoritmo
