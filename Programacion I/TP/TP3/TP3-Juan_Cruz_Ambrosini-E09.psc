// Determinar el precio de un pasaje de avión ida y vuelta, conociendo la distancia a recorrer y
// sabiendo que si el número de días de estancia es superior a siete y la distancia es superior a
// 800km, el pasaje tiene un descuento del 30%. El precio por km es de $4.5.

/// Datos de entrada: Número entero que indica la cantidad de días que el usuario se va quedar en el destino.
///					  Número real que indica la distancia total que se va a recorrer.
/// Datos de salida: Menasje que indica el precio del pasaje de avión.

Algoritmo Ejercicio9
	
	Definir diasDeEstadio Como Entero;
	Definir distanciaTotal, precioVoleto Como Real;
	
	Escribir "Ingrese la cantidad de días que se espera quedar en el destino.";
	Leer diasDeEstadio;
	Escribir "Ingrese la cantidad de kilómetros que va a recorrer.";
	Leer distanciaTotal;
	
	si diasDeEstadio > 7 y distanciaTotal > 800
		
		precioVoleto = distanciaTotal * 4.5 - (distanciaTotal * 4.5) * 0.30;
		
		Escribir "Felicidades! Ha recibido un descuento del 30%. El precio del boleto es de: $", precioVoleto;
		
	SiNo
		
		precioVoleto = distanciaTotal * 4.5;
		
		Escribir "El precio del boleto es de: ", precioVoleto;
		
	FinSi
	
FinAlgoritmo
