// Considere que se tienen los datos litros_usados, litros_que_faltan, y total_latas, que
// corresponden respectivamente a: los litros ya usados para pintar, los litros que faltan aún para
// completar el trabajo, y el total de latas de 4 litros compradas. Si la diferencia entre el total de
// pintura comprada y lo que ya fue usado alcanza para terminar el trabajo deberá mostrar por
// pantalla el texto "la pintura alcanza", de lo contrario deberá mostrar "la pintura no alcanza" y
// cuantos litros de pintura hace falta.

/// Datos de entrada: 3 números (reales o enteros) que representan los litros de pintura usados en un trabajo, los faltantes para completar el 
///trabajo y la pintura total que se ha comprado.

/// Datos de salida: Mensaje notificando si la pintura alcanza o no, y de ser así, indicar cuanto falta.

Algoritmo Ejercicio5
	
	Definir litrosUsados, litrosQueFaltan, totalLitrosComprados Como Real;
	Definir totalLatas Como Entero;
	Definir haySuficientePintura Como Logico;
	
	Escribir "Ingrese la cantidad de litros que ha utilizado: ";
	Leer litrosUsados;
	Escribir "Ingrese la cantidad de litros que le faltan: ";
	Leer litrosQueFaltan;
	Escribir "Ingrese la cantidad de latas que ha comprado: ";
	Leer totalLatas;
	
	totalLitrosComprados = 4 * totalLatas;
	totalLitrosNecesarios = litrosUsados + litrosQueFaltan
	
	si (litrosUsados >= 0 y litrosQueFaltan > 0 y totalLitrosComprados >= 0) y (litrosUsados <= totalLitrosComprados)
		
		si litrosQueFaltan <= totalLitrosComprados - litrosUsados
			
			Escribir "La pintura si alcanza!";
			
		SiNo
			
			Escribir "La pintura no alcanza :( Falta/faltan ", (totalLitrosNecesarios - totalLitrosComprados)," litro/s.";
			
		FinSi
		
	SiNo
		
		Escribir "Ingrese un valor válido.";
		
	FinSi
	
	
FinAlgoritmo





