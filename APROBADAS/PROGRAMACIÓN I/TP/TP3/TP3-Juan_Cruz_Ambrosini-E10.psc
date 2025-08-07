// Un supermercado ha puesto en oferta la venta al por mayor de cierto producto, ofreciendo un
// descuento del 15 %  por la compra de más de 3 docenas y 10 %  en caso contrario. Además por la
// compra de más de 3 docenas se obsequia una unidad del producto por cada docena en exceso
// sobre 3. Diseñe un algoritmo que determine el monto de la compra, el monto del descuento, el
// monto a pagar y el número de unidades de obsequio por la compra de cierta cantidad de
// docenas del producto.

// Se supondrá que el precio de cada unidad es de $50

/// Datos de entrada: Número entero que indica la cantidad de unidades que se van a comprar.
/// Datos de salida: 3 números reales que indican el monto de la compra, el monto del descuento y el monto a pagar.
///					 Número entero que indica el número de unidades de obsequio.

Algoritmo Ejercicio10
	
	Definir unidadesCompradas, unidadesDeObsequio, cantidadesDeDocenas Como Entero;
	Definir montoDeLaCompra, montoDelDescuento, montoAPagar Como Real;
	
	Escribir "Ingrese la cantidad de unidades que desean comprar.";
	Leer unidadesCompradas;
	
	cantidadesDeDocenas = trunc(unidadesCompradas/12);
	montoDeLaCompra = unidadesCompradas * 50;
	si unidadesCompradas > 0
		
		si cantidadesDeDocenas > 3 Entonces
			
			unidadesDeObsequio = cantidadesDeDocenas - 3;
			
			montoDelDescuento = montoDeLaCompra * 0.15;
			montoAPagar = montoDeLaCompra - montoDelDescuento;
			
			Escribir "Compra exitosa!";
			Escribir "Monto de la compra: $", montoDeLaCompra;
			Escribir "Monto del descuento (descuento del 15%): $", montoDelDescuento;
			Escribir "Monto a pagar: $", montoAPagar;
			Escribir "Unidades obsequiadas: ",unidadesDeObsequio;
			Escribir "Docenas compradas: ",cantidadesDeDocenas;
			
		SiNo
			
			montoDelDescuento = montoDeLaCompra * 0.10;
			montoAPagar = montoDeLaCompra - montoDelDescuento;
			
			Escribir "Compra exitosa!";
			Escribir "Monto de la compra: $", montoDeLaCompra;
			Escribir "Monto del descuento (descuento del 10%): $", montoDelDescuento;
			Escribir "Monto a pagar: $", montoAPagar;
			Escribir "No se recibieron unidades de regalo :(";
			Escribir "Docenas compradas: ",cantidadesDeDocenas;
			
		FinSi
		
	SiNo
		
		Escribir "Por favor, ingrese un valor válido."
		
	FinSi

FinAlgoritmo
