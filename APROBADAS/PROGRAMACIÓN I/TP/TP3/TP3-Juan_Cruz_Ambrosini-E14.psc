// Cierto atleta pierde en sus carreras 100 gramos de peso por cada 50m recorridos. Su entrenador
// desea un programa que a partir de datos como:
//		? Peso del corredor
//		? Longitud del circuito (nunca menor a 50m)
//		? Tiempo empleado (en seg.)
// le permita:
//		a. Determinar cuántos gramos pierde el corredor y cuál es su peso final.
//		b. Si ha perdido más de 300g de peso, indicar que necesitará vitamina A y si pierde más
//			de 450g necesitará también vitamina C.
//		c. Sabiendo que para el circuito olímpico el tiempo récord es de 25 seg., y que para el
//		   circuito panamericano el tiempo récord es de 15 seg., determinar si el corredor ha
//		   mejorado alguno de estos récords.

// Se supone que el circuito olímpico es de 200 m
// Se supone que el circuito panamericano es de 125 m

/// Datos de entrada: Peso del corredor (real), Longitud del circuito (real), Tiempo empleado (real)
/// Datos de salida: Gramos perdidos (real), Peso final (real), falta de viatamina A y falta de vitamina C (2 lógicas), récord panamericano y récord olímpico (2 lógicas)

Algoritmo Ejercicio14
	
	Definir pesoCorredor, longitudCircuito, tiempo, gramosPerdidos, pesoFinal Como Real;
	Definir faltaVitaminaA, faltaVitaminaC, recordPanamericano, recordOlimpico Como Logico;
	
	Escribir "Ingrese el peso del corredor: ";
	Leer pesoCorredor;
	pesoCorredor = pesoCorredor * 1000;
	Escribir "Ingrese la longitud del circuito: ";
	Leer longitudCircuito;
	Escribir "Ingrese el tiempo empleado por el corredor: ";
	Leer tiempo;
	
	faltaVitaminaA = Falso;
	faltaVitaminaC = Falso;
	recordPanamericano = Falso;
	recordOlimpico = Falso;
	
	si longitudCircuito >= 50 y pesoCorredor >= 50000 y tiempo > 5
		
		gramosPerdidos = (longitudCircuito/50) * 100;
		pesoFinal = pesoCorredor - gramosPerdidos;
		
		Escribir "Los gramos perdidos por el corredor durante el recorrido son: ",gramosPerdidos;
		Escribir "El peso final del corredor es de: ",pesoFinal;
		
		si gramosPerdidos > 450 Entonces
			
			Escribir "Se necesitan complementos de vitamina A y vitamina C.";
			
		SiNo
			
			si gramosPerdidos > 300 y gramosPerdidos <= 450
				
				Escribir "Se necesitan complementos de vitamina A";
				
			FinSi
			
		FinSi
		
		si longitudCircuito == 200 y tiempo < 25 Entonces
			
			Escribir "Se ha roto el récord olímpico! Felicidades!";
			
		SiNo
			
			si longitudCircuito == 125 y tiempo < 15 Entonces
				
				Escribir "Se ha roto el récord panamericano! Felicidades!";
				
			FinSi
			
		FinSi
		
	SiNo
		
		Escribir "Ingrese una expresión válida.";
		
	FinSi
	
FinAlgoritmo

















