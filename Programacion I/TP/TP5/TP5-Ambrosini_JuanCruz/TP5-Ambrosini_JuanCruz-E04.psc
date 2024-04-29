// Una compañía de seguros tiene contratados a N vendedores. Cada vendedor hace múltiples ventas a la
// semana (5 días laborales). La política de pagos de la compañía es que cada vendedor recibe un sueldo
// base más un 10% extra por comisiones de sus ventas. El gerente de la compañía desea saber cuánto
// dinero deberá pagar a cada vendedor en la semana por concepto de comisiones totales.

/// Datos de entrada: Cantidad de empleados y ventas a la semana por empleado, más el sueldo base del los mismos.
/// Datos de salida: Mensaje informando al gerente el pago de cada empleado por semana

Algoritmo Ejercicio4
	
	Definir sueldoBase, aumento, sueldoTotal Como Real;
	Definir cantidadEmpleados, cantidadVentasTotales, cantidadVentasDia Como Entero;
	
	cantidadVentasTotales = 0;
	
	Hacer
		
		Escribir "Ingrese la cantidad de vendedores empleados: ";
		Leer cantidadEmpleados;
		
		Escribir "Ingrese el sueldo base de los empleados: (debe ser mayor a $100)";
		Leer sueldoBase
		
		si cantidadEmpleados <= 0 Entonces
			
			Escribir "Error: Ingrese una cantidad de empleados válida."
			
		FinSi
		
		si sueldoBase < 100
			
			Escribir "Error: Ingrese un sueldo válido (mayor a 100)."
			
		FinSi
		
		Mientras  Que cantidadEmpleados < 0 y sueldoBase < 100
			
			aumento = sueldoBase * 0.10;
			
			Para i = 1 Hasta cantidadEmpleados Con Paso 1 Hacer
				
				cantidadVentasTotales = 0;
				
				Para j = 1 Hasta 5 Con Paso 1 Hacer
					
					Hacer
						
						
						Escribir "Ingrese la cantidad de ventas que el empleado N°" i " realizó el día " j " .";
						Leer cantidadVentasDia
						
						cantidadVentasTotales = cantidadVentasTotales + cantidadVentasDia
						
						si cantidadVentasDia < 0 Entonces
							
							Escribir "Error: la cantidad de ventas no puede ser negativa."
							
						FinSi
						
					Mientras Que cantidadVentasDia < 0
					
				FinPara
				
				sueldoTotal = sueldoBase + (aumento * cantidadVentasTotales)
				
				Escribir "El dinero que hay que pagarle al empleado " i " al final de la semana es de: " sueldoTotal;
				
			FinPara
			
FinAlgoritmo
















