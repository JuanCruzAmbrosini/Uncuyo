//Rehacer el ejercicio N�3 del Trabajo Pr�ctico 5 pero haciendo uso de subprogramas:
//Un programa que muestre por pantalla el siguiente men�:
//				MENU
//		1. Ingresar Operandos
//		2. Sumar
//		3. Restar
//		4. Multiplicar
//		5. Dividir
//		6. Salir
//		Elija opci�n:
//			Una vez que se muestra el men� por pantalla se debe solicitar al usuario que ingrese una opci�n del
//			men�. En caso de seleccionar una operaci�n aritm�tica el programa deber� verificar que se hayan
//			ingresado los operandos y mostrar el resultado por pantalla. Luego de cada operaci�n se debe volver a
//			mostrar el men� por si el usuario desea realizar otra operaci�n. El programa se ejecuta hasta que se
//			elija la opci�n 6. Tener en cuenta que si el usuario selecciona la opci�n 6, en vez de salir del programa
//			directamente, se debe mostrar el siguiente mensaje de confirmaci�n: �Est� seguro que desea salir del
//			programa (S/N)? Si el usuario ingresa ?S? se sale del programa, caso contrario se vuelve a mostrar el
//			men�.

/// Datos de entrada: Dos operandos que ingresa el usuario para realizar la operaci�n deseada y la operaci�n en si.
/// Datos de salida: El resultado de la operaci�n.

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
				
				Escribir "Por favor, ingrese una opci�n v�lida."
				
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
		
		Escribir "La divisi�n por 0 no est� definida.";
		
	FinSi
	
FinFuncion

Funcion continuar = decisionContinuarPrograma()
	
	Definir continuar Como Caracter
	
	Hacer
		
		Escribir "�Desea seguir operando? (y/n) "
		Leer continuar;
		continuar = Mayusculas(continuar);
		
		si continuar <> 'Y' y continuar <> 'N' Entonces
			
			Escribir "Por favor, ingrese una opci�n v�lida.";
			
		FinSi
		
	Mientras Que  continuar <> 'Y' y continuar <> 'N'
	
FinFuncion

Funcion operando = ingresarOperando (mensaje)
	
	Escribir mensaje;
	Leer operando;
	
FinFuncion

























