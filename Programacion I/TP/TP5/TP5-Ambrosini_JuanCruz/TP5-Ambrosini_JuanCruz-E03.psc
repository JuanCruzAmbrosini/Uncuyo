//Realizar un programa que muestre por pantalla el siguiente menú:
//		MENU
//		1. Ingresar Operandos
//		2. Sumar
//		3. Restar
//		4. Multiplicar
//		5. Dividir
//		6. Salir
//		Elija opción:
//		
//	Una vez que se muestra el menú por pantalla se debe solicitar al usuario que ingrese una opción del
//	menú. En caso de seleccionar una operación aritmética el programa deberá verificar que se hayan
//	ingresado los operandos y mostrar el resultado por pantalla. Luego de cada operación se debe volver a
//	mostrar el menú por si el usuario quiere realizar otra operación. El programa se ejecuta hasta que se
//	elija la opción 6. Tener en cuenta que si el usuario selecciona la opción 6, en vez de salir del programa
//	directamente, se debe mostrar el siguiente mensaje de confirmación: ¿Está seguro que desea salir del
//	programa (S/N)? Si el usuario ingresa ?S? se sale del programa, caso contrario se vuelve a mostrar el
//	menú.

/// Datos de entrada: El usuario decide que operación desea realizar, los operandos y si desea continuar operando o no.
/// Datos de salida: Se le muestra al usuario la solución de la operación aritmética y se le muestra nuevamente el menú.

Algoritmo Ejercicio3
	
	Definir seleccion Como Entero;
	Definir operando1, operando2, resultado Como Real;
	Definir hayOperandos Como Logico;
	Definir continuar Como Caracter;
	
	hayOperandos = Falso;
	
	Repetir
		
		Escribir "MENU"
		Escribir "1. Ingresar Operandos"
		Escribir "2. Sumar"
		Escribir "3. Restar"
		Escribir "4. Multiplicar"
		Escribir "5. Dividir"
		Escribir "6. Salir"
		Escribir "Elija opción:"
		Leer seleccion;
		
		Segun seleccion Hacer
			
			1:
				Escribir "Ingrese el primer operando: ";
				Leer operando1;
				
				Escribir "Ingrese el segundo operando: ";
				Leer operando2;
				
				hayOperandos = Verdadero;
				
			2:
				si hayOperandos Entonces
					
					Escribir operando1 " + " operando2 " = " operando1 + operando2;
					
				SiNo
					
					Escribir "Error: No hay operandos."
					
				FinSi
				
			3:
				si hayOperandos Entonces
					
					Escribir operando1 " - " operando2 " = " operando1 - operando2;
					
				SiNo
					
					Escribir "Error: No hay operandos."
					
				FinSi
				
			4:
				si hayOperandos Entonces
					
					Escribir operando1 " * " operando2 " = " operando1 * operando2;
					
				SiNo
					
					Escribir "Error: No hay operandos."
					
				FinSi
				
			5:
				si hayOperandos y operando2 <> 0 Entonces
					
					Escribir operando1 " / " operando2 " = " operando1 / operando2;
					
				SiNo si no hayOperandos
					
						Escribir "Error: No hay operandos.";
						
					FinSi
					
					si operando2 = 0 Entonces
						
						Escribir "Error: el 2do operando no puede ser 0.";
						
					FinSi
					
				FinSi
				
			6:
				
				Repetir
					
					Escribir "Desea salir del programa (y/n)."
					Leer continuar;
					continuar = Minusculas(continuar);
					
					si continuar <> 'y' y continuar <> 'n' Entonces
						
						Escribir "Ingrese una opción válida.";
						
					FinSi
					
				Mientras Que continuar <> 'y' y continuar <> 'n';
				
			De Otro Modo:
				
				Escribir "Por favor, ingrese una opción válida."
			
		FinSegun
		
	Mientras Que continuar <> 'y'
	
	Escribir "Gracias por utilizar nuestros seervicios."
	
FinAlgoritmo
