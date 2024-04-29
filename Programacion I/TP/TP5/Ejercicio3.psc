//Realizar un programa que muestre por pantalla el siguiente men�:
//		MENU
//		1. Ingresar Operandos
//		2. Sumar
//		3. Restar
//		4. Multiplicar
//		5. Dividir
//		6. Salir
//		Elija opci�n:
//		
//	Una vez que se muestra el men� por pantalla se debe solicitar al usuario que ingrese una opci�n del
//	men�. En caso de seleccionar una operaci�n aritm�tica el programa deber� verificar que se hayan
//	ingresado los operandos y mostrar el resultado por pantalla. Luego de cada operaci�n se debe volver a
//	mostrar el men� por si el usuario quiere realizar otra operaci�n. El programa se ejecuta hasta que se
//	elija la opci�n 6. Tener en cuenta que si el usuario selecciona la opci�n 6, en vez de salir del programa
//	directamente, se debe mostrar el siguiente mensaje de confirmaci�n: �Est� seguro que desea salir del
//	programa (S/N)? Si el usuario ingresa ?S? se sale del programa, caso contrario se vuelve a mostrar el
//	men�.

/// Datos de entrada: El usuario decide que operaci�n desea realizar, los operandos y si desea continuar operando o no.
/// Datos de salida: Se le muestra al usuario la soluci�n de la operaci�n aritm�tica y se le muestra nuevamente el men�.

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
		Escribir "Elija opci�n:"
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
						
						Escribir "Ingrese una opci�n v�lida.";
						
					FinSi
					
				Mientras Que continuar <> 'y' y continuar <> 'n';
				
			De Otro Modo:
				
				Escribir "Por favor, ingrese una opci�n v�lida."
			
		FinSegun
		
	Mientras Que continuar <> 'y'
	
	Escribir "Gracias por utilizar nuestros seervicios."
	
FinAlgoritmo
