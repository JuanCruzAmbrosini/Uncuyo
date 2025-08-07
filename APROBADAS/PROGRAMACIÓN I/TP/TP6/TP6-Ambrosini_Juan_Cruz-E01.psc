//Rehacer el ejercicio Nº3 del Trabajo Práctico 5 pero haciendo uso de subprogramas:
//Un programa que muestre por pantalla el siguiente menú:
//				MENU
//		1. Ingresar Operandos
//		2. Sumar
//		3. Restar
//		4. Multiplicar
//		5. Dividir
//		6. Salir
//		Elija opción:
//			Una vez que se muestra el menú por pantalla se debe solicitar al usuario que ingrese una opción del
//			menú. En caso de seleccionar una operación aritmética el programa deberá verificar que se hayan
//			ingresado los operandos y mostrar el resultado por pantalla. Luego de cada operación se debe volver a
//			mostrar el menú por si el usuario desea realizar otra operación. El programa se ejecuta hasta que se
//			elija la opción 6. Tener en cuenta que si el usuario selecciona la opción 6, en vez de salir del programa
//			directamente, se debe mostrar el siguiente mensaje de confirmación: ¿Está seguro que desea salir del
//			programa (S/N)? Si el usuario ingresa ?S? se sale del programa, caso contrario se vuelve a mostrar el
//			menú.

/// Datos de entrada: Dos operandos que ingresa el usuario para realizar la operación deseada y la operación en si.
/// Datos de salida: El resultado de la operación.

Algoritmo Ejercicio_1
	
	Definir seleccionUsuario Como Entero;
	Definir operando1, operando2, resultado Como Real;
	Definir continuar Como Caracter;
	Definir hayOperandos Como Logico
	
	hayOperandos = Falso;
	continuar = 'Y'
	
	Hacer
		
		seleccionUsuario = menu()
		
		si seleccionUsuario = 1 Entonces
			
			operando1 = ingresarOperando("Ingrese el primer operando.");
			operando2 = ingresarOperando("Ingrese el segundo operando.");
			hayOperandos = Verdadero;
			
		SiNo si (seleccionUsuario > 1 y seleccionUsuario <= 6 ) Entonces
				
				Segun seleccionUsuario Hacer
					
					2: resultado = suma (operando1, operando2);
					3: resultado = resta (operando1, operando2);
					4: resultado = multiplicacion (operando1, operando2);
					5: resultado = division (operando1, operando2);
					6: continuar = decisionContinuarPrograma();
						
				FinSegun
				
				si seleccionUsuario <> 6 y seleccionUsuario <> 1 y hayOperandos = Verdadero Entonces
					
					Escribir "El resultado es: " resultado;
					
				SiNo si seleccionUsuario <> 6 y seleccionUsuario <> 1
						
						Escribir "No se han ingresado los operandos!"
						
					FinSi
				FinSi
				
			SiNo
				
				Escribir "Por favor, ingrese una opción válida."
				
			FinSi
		FinSi
		
	Mientras Que continuar = 'Y' 
	
FinAlgoritmo

Funcion  seleccionUsuario = menu ()
	
	Definir seleccionUsuario Como Entero;
	
	Escribir "MENU";
	Escribir "1. Ingresar Operandos";
	Escribir "2. Sumar";
	Escribir "3. Restar";
	Escribir "4. Multiplicar";
	Escribir "5. Dividir";
	Escribir "6. Salir";
	
	Leer seleccionUsuario;
	
FinFuncion

Funcion resultado = suma (operando1, operando2)
	
	Definir resultado Como Real
	
	resultado = operando1 + operando2;
	
FinFuncion

Funcion resultado = resta (operando1, operando2)
	
	Definir resultado Como Real
	
	resultado = operando1 - operando2;
	
FinFuncion

Funcion resultado = multiplicacion (operando1, operando2)
	
	Definir resultado Como Real
	
	resultado = operando1 * operando2;
	
FinFuncion

Funcion resultado = division (operando1, operando2)
	
	Definir resultado Como Real
	
	si operando2 <> 0 Entonces
		
		resultado = operando1 / operando2;
		
	SiNo
		
		Escribir "La división por 0 no está definida.";
		
	FinSi
	
FinFuncion

Funcion continuar = decisionContinuarPrograma()
	
	Definir continuar Como Caracter
	
	Hacer
		
		Escribir "¿Desea seguir operando? (y/n) "
		Leer continuar;
		continuar = Mayusculas(continuar);
		
		si continuar <> 'Y' y continuar <> 'N' Entonces
			
			Escribir "Por favor, ingrese una opción válida.";
			
		FinSi
		
	Mientras Que  continuar <> 'Y' y continuar <> 'N'
	
FinFuncion

Funcion operando = ingresarOperando (mensaje)
	
	Escribir mensaje;
	Leer operando;
	
FinFuncion

























