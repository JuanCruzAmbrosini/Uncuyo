// Se desea realizar un programa para calcular la cantidad de frigorías necesarias para mantener un
// ambiente acordemente refrigerado. Para realizar el cálculo de la cantidad de frigorías en primer
// lugar se necesita saber el volumen en metros cúbicos de la habitación donde se va a instalar el
// aparato (Esto es ancho, largo y alto de la habitación). Luego según la siguiente tabla se
// determinan la cantidad de frigorías mínimas y máximas según la temperatura máxima estimada
// para la zona:

// Para obtener las frigorías mínimas de una zona se multiplican los metros cúbicos por el
// coeficiente adecuado. Por ejemplo, suponiendo que tiene una habitación de 50 m3 y la
// temperatura máxima estimada de la zona es 38 grados, entonces la cantidad mínima de
// frigorías es 2170 (50 * 43.4) y la cantidad máxima es 2820 (50 * 56.4) La información variable
// consiste de: El volumen de la habitación (ancho, largo y alto). Temperatura máxima de la zona
// en grados.

/// Datos de entrada: 3 números reales que indican las dimensiones de la habitación a refrigerar. Un número real que informa la temperatura máxima de la zona.
/// Datos de salida: Mensaje mostrando la cantidad de frigorías mínimas para refrigerar la habitación

Algoritmo Ejercicio13
	
	Definir ancho, largo, alto, volumenHabitacion, temperaturaMaxima, frigoriasMinimas, frigoriasMaximas Como Real;
	
	Escribir "Ingrese las dimensiones de la habitación: (ancho, largo, alto)";
	Leer ancho, largo, alto;
	Escribir "Ingrese la temperatura máxima de su zona"
	leer temperaturaMaxima;
	
	si (ancho > 0 y largo > 0 y alto > 0) y (temperaturaMaxima >= -30 y temperaturaMaxima <= 60)
		
		volumenHabitacion = ancho * largo * alto;
		
		si temperaturaMaxima < 30 Entonces
			
			frigoriasMinimas = volumenHabitacion * 36.15;
			frigoriasMaximas = volumenHabitacion * 47;
			
			Escribir "La cantidad de frigorías mínimas requeridas para refrigerar la habitación es de: ", frigoriasMinimas;
			Escribir "La cantidad de frigorías máximas requeridas para refrigerar la habitación es de: ", frigoriasMaximas;
			
		SiNo
			
			si temperaturaMaxima >= 30 y temperaturaMaxima <= 40 Entonces
				
				frigoriasMinimas = volumenHabitacion * 43.4;
				frigoriasMaximas = volumenHabitacion * 56.4;
				
				Escribir "La cantidad de frigorías mínimas requeridas para refrigerar la habitación es de: ", frigoriasMinimas;
				Escribir "La cantidad de frigorías máximas requeridas para refrigerar la habitación es de: ", frigoriasMaximas;
				
			SiNo
				
				frigoriasMinimas = volumenHabitacion * 50.6;
				frigoriasMaximas = volumenHabitacion * 65.8;
				
				Escribir "La cantidad de frigorías mínimas requeridas para refrigerar la habitación es de: ", frigoriasMinimas;
				Escribir "La cantidad de frigorías máximas requeridas para refrigerar la habitación es de: ", frigoriasMaximas;
				
			FinSi
			
		FinSi
		
	SiNo
		
		Escribir "Por favor ingrese expresiones válidas"
		
	FinSi
	
FinAlgoritmo
