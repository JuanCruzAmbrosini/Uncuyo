// Se desea realizar un programa para calcular la cantidad de frigor�as necesarias para mantener un
// ambiente acordemente refrigerado. Para realizar el c�lculo de la cantidad de frigor�as en primer
// lugar se necesita saber el volumen en metros c�bicos de la habitaci�n donde se va a instalar el
// aparato (Esto es ancho, largo y alto de la habitaci�n). Luego seg�n la siguiente tabla se
// determinan la cantidad de frigor�as m�nimas y m�ximas seg�n la temperatura m�xima estimada
// para la zona:

// Para obtener las frigor�as m�nimas de una zona se multiplican los metros c�bicos por el
// coeficiente adecuado. Por ejemplo, suponiendo que tiene una habitaci�n de 50 m3 y la
// temperatura m�xima estimada de la zona es 38 grados, entonces la cantidad m�nima de
// frigor�as es 2170 (50 * 43.4) y la cantidad m�xima es 2820 (50 * 56.4) La informaci�n variable
// consiste de: El volumen de la habitaci�n (ancho, largo y alto). Temperatura m�xima de la zona
// en grados.

/// Datos de entrada: 3 n�meros reales que indican las dimensiones de la habitaci�n a refrigerar. Un n�mero real que informa la temperatura m�xima de la zona.
/// Datos de salida: Mensaje mostrando la cantidad de frigor�as m�nimas para refrigerar la habitaci�n

Algoritmo Ejercicio13
	
	Definir ancho, largo, alto, volumenHabitacion, temperaturaMaxima, frigoriasMinimas, frigoriasMaximas Como Real;
	
	Escribir "Ingrese las dimensiones de la habitaci�n: (ancho, largo, alto)";
	Leer ancho, largo, alto;
	Escribir "Ingrese la temperatura m�xima de su zona"
	leer temperaturaMaxima;
	
	si (ancho > 0 y largo > 0 y alto > 0) y (temperaturaMaxima >= -30 y temperaturaMaxima <= 60)
		
		volumenHabitacion = ancho * largo * alto;
		
		si temperaturaMaxima < 30 Entonces
			
			frigoriasMinimas = volumenHabitacion * 36.15;
			frigoriasMaximas = volumenHabitacion * 47;
			
			Escribir "La cantidad de frigor�as m�nimas requeridas para refrigerar la habitaci�n es de: ", frigoriasMinimas;
			Escribir "La cantidad de frigor�as m�ximas requeridas para refrigerar la habitaci�n es de: ", frigoriasMaximas;
			
		SiNo
			
			si temperaturaMaxima >= 30 y temperaturaMaxima <= 40 Entonces
				
				frigoriasMinimas = volumenHabitacion * 43.4;
				frigoriasMaximas = volumenHabitacion * 56.4;
				
				Escribir "La cantidad de frigor�as m�nimas requeridas para refrigerar la habitaci�n es de: ", frigoriasMinimas;
				Escribir "La cantidad de frigor�as m�ximas requeridas para refrigerar la habitaci�n es de: ", frigoriasMaximas;
				
			SiNo
				
				frigoriasMinimas = volumenHabitacion * 50.6;
				frigoriasMaximas = volumenHabitacion * 65.8;
				
				Escribir "La cantidad de frigor�as m�nimas requeridas para refrigerar la habitaci�n es de: ", frigoriasMinimas;
				Escribir "La cantidad de frigor�as m�ximas requeridas para refrigerar la habitaci�n es de: ", frigoriasMaximas;
				
			FinSi
			
		FinSi
		
	SiNo
		
		Escribir "Por favor ingrese expresiones v�lidas"
		
	FinSi
	
FinAlgoritmo
