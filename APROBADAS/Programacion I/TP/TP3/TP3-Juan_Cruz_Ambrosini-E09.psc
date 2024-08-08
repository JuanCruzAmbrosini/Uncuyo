// Determinar el precio de un pasaje de avi�n ida y vuelta, conociendo la distancia a recorrer y
// sabiendo que si el n�mero de d�as de estancia es superior a siete y la distancia es superior a
// 800km, el pasaje tiene un descuento del 30%. El precio por km es de $4.5.

/// Datos de entrada: N�mero entero que indica la cantidad de d�as que el usuario se va quedar en el destino.
///					  N�mero real que indica la distancia total que se va a recorrer.
/// Datos de salida: Menasje que indica el precio del pasaje de avi�n.

Algoritmo Ejercicio9
	
	Definir diasDeEstadio Como Entero;
	Definir distanciaTotal, precioVoleto Como Real;
	
	Escribir "Ingrese la cantidad de d�as que se espera quedar en el destino.";
	Leer diasDeEstadio;
	Escribir "Ingrese la cantidad de kil�metros que va a recorrer.";
	Leer distanciaTotal;
	
	si diasDeEstadio > 7 y distanciaTotal > 800
		
		precioVoleto = distanciaTotal * 4.5 - (distanciaTotal * 4.5) * 0.30;
		
		Escribir "Felicidades! Ha recibido un descuento del 30%. El precio del boleto es de: $", precioVoleto;
		
	SiNo
		
		precioVoleto = distanciaTotal * 4.5;
		
		Escribir "El precio del boleto es de: ", precioVoleto;
		
	FinSi
	
FinAlgoritmo
