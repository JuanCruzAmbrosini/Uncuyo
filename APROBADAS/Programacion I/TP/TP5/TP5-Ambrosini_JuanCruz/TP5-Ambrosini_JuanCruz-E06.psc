//	Realice un programa que genere aleatoriamente 7 operaciones aritméticas consecutivas a las que el
//	usuario deberá ir respondiendo correctamente para ir avanzando. Los primeros dos números
//	(aleatorios) sobre los que se realizan las operaciones deben ser generados de manera aleatoria. Las
//	operaciones aritméticas (también aleatorias) permitidas serán la suma, resta, multiplicación y división.
//	En el caso de la división el resultado debe ser un número entero, poro tanto se deberá utilizar la
// función trunc de PSeInt para obtener la parte entera del resultado. 

//	Nota: A partir de la segunda operación el primer operando será el resultado de la operación aritmética
//	anterior y el segundo operando se genera de manera aleatoria.

/// Datos de entrada: La respuesta del usuario a la operación que se le muestra en pantalla.
/// Datos de salida: Mensaje que le muestre al usuario si respondió correctamente y que le permite avanzar.

Algoritmo Ejercicio6
	
	Definir operacion, operando1, operando2, resultado, respuestaUsuario Como Entero;
	Definir exitoUsuario Como Logico
	
	exitoUsuario = Falso;
	operando1 = Aleatorio(0,100);
	operando2 = Aleatorio(0,100);
	
	Para i = 1 Hasta 7 Con Paso 1 Hacer
		
		operacion = Aleatorio(1,4);
		exitoUsuario = Falso;
		
		Segun operacion
			
			1:
				
				Hacer
					
					resultado = operando1 + operando2;
					Escribir operando1 " + " operando2 " =  ?";
					Leer respuestaUsuario;
					
					si resultado <> respuestaUsuario Entonces
						
						Escribir "Lo lamento, pero ha ingresado un valor erróneo, inténtelo nuevamente!"
						
					SiNo
						
						Escribir "Genial! Lo ha conseguido!"
						exitoUsuario = Verdadero
						
					FinSi
					
				Mientras Que resultado <> respuestaUsuario;
				
			2:
				
				Hacer
					
					resultado = operando1 - operando2;
					Escribir operando1 " - " operando2 " =  ?";
					Leer respuestaUsuario;
					
					si resultado <> respuestaUsuario Entonces
						
						Escribir "Lo lamento, pero ha ingresado un valor erróneo, inténtelo nuevamente!"
						
					SiNo
						
						Escribir "Genial! Lo ha conseguido!"
						exitoUsuario = Verdadero
						
					FinSi
					
				Mientras Que resultado <> respuestaUsuario;
				
			3:
				
				Hacer
					
					resultado = operando1 * operando2;
					Escribir operando1 " * " operando2 " =  ?";
					Leer respuestaUsuario;
					
					si resultado <> respuestaUsuario Entonces
						
						Escribir "Lo lamento, pero ha ingresado un valor erróneo, inténtelo nuevamente!"
						
					SiNo
						
						Escribir "Genial! Lo ha conseguido!"
						exitoUsuario = Verdadero
						
					FinSi
					
				Mientras Que resultado <> respuestaUsuario;
				
			4:
				
				Hacer
					
					si operando2 == 0 Entonces
						
						operando2 = Aleatorio(0,100);
						
					FinSi
					
					resultado = trunc(operando1 / operando2);
					Escribir operando1 " / " operando2 " =  ?  (Ingrese solo el entero) ";
					Leer respuestaUsuario;
					
					si resultado <> respuestaUsuario Entonces
						
						Escribir "Lo lamento, pero ha ingresado un valor erróneo, inténtelo nuevamente!"
						
					SiNo
						
						Escribir "Genial! Lo ha conseguido!"
						exitoUsuario = Verdadero
						
					FinSi
					
				Mientras Que resultado <> respuestaUsuario y operando2 = 0;
				
		FinSegun
		
		operando1 = resultado;
		operando2 = Aleatorio(0,100);
		
		si i == 7 Entonces
			
			Escribir "Fin del juego. ¡Lo ha conseguido! Felicidades!"
			
		FinSi
		
	FinPara
	
FinAlgoritmo
