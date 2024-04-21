// Realice un algoritmo para mostrar en pantalla la "Tabla de multiplicar" de un número dado por el
// usuario.

/// Datos de entrada: Número del que se quiere saber la tabla.
/// Datos de salida: Mensaje que muestra la tabla de dicho número.

Algoritmo Ejercicio1
	
	Definir numeroTabla, resultado Como Entero
	
	Repetir
		
		Escribir "Ingrese un valor mayor que 0 para calcular las tablas: ";
		Leer numeroTabla;
		
	Mientras Que numeroTabla < 0
	
	Para i = 1 Hasta 10 Con Paso 1 Hacer
		
		Escribir numeroTabla " * " i " = " i * numeroTabla  
		
	FinPara
	
FinAlgoritmo
