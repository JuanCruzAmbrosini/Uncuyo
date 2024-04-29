//Se pide que programe el famoso juego de "Piedra, Papel o Tijera". En el mismo juegan dos
//contrincantes "A" y "B". En cada jugada, cada uno de los jugadores debe ingresar una opción
//de acuerdo a lo siguiente:
//	1- piedra
//	2- papel
//	3- tijera
//	Si alguno de los jugadores ingresa un valor incorrecto se indica "valor inválido" y se debe
//	asegurar que el jugador ingrese un valor válido.
//	Si los dos jugadores seleccionan la misma palabra se debe indicar el resultado de la jugada
//	como "empate". De otra manera, se debe indicar que jugador ganó siguiendo la siguiente
//	lógica: "1" pierde ante "2" (tijera corta papel); "2" pierde ante "3" (piedra rompe tijera); y "3"
//	pierde ante "1" (papel envuelve piedra).
//	La partida termina cuando uno de los jugadores consigue ganar tres juegos. Al finalizar el juego
//	se debe indicar el resultado del ganador de la partida y las estadísticas de cantidad de jugadas
//	ganadas por cada jugador y cantidad de empates. Por ejemplo:
//		-Ganador del juego el jugador A.
//		-Cantidad de juegos ganados por A: 3.
//		-Cantidad de juegos ganados por B: 2.
//		-Cantidad de empates: 0

/// Datos de entrada: 2 Jugadores eligen pierda, papel o tijeras para jugar al juego de ese nombre, el primer jugador que consiga 3 victorias, gana el juego.
/// Datos de salida: Que jugador ganó el juego, la cantidad de partidas ganadas por cada jugador y la cantidad de empates.

Algoritmo Ejercicio10
	
	Definir contadorPartidasA, contadorPartidasB, contadorEmpates, desicionJugadores, opcionA, opcionB Como Entero
	
	contadorEmpates = 0;
	contadorPartidasA = 0;
	contadorPartidasB = 0;
	
	Mientras contadorPartidasA < 3 y contadorPartidasB < 3 Hacer
		
		Hacer
			
			Escribir "Jugador A, por favor, seleccione una opción: ";
			Escribir "1_ Piedra";
			Escribir "2_ Papel";
			Escribir "3_ Tijera";
			Leer opcionA;
			
			si opcionA <> 1 y opcionA <> 2 y opcionA <> 3 Entonces
				
				Escribir "Error: Por favor, ingrese una opción válida.";
				
			FinSi
			
		Mientras Que opcionA <> 1 y opcionA <> 2 y opcionA <> 3
		
		Hacer
			
			Escribir "Jugador B, por favor, seleccione una opción: ";
			Escribir "1_ Piedra";
			Escribir "2_ Papel";
			Escribir "3_ Tijera";
			Leer opcionB;
			
			si opcionB <> 1 y opcionB <> 2 y opcionB <> 3 Entonces
				
				Escribir "Error: Por favor, ingrese una opción válida.";
				
			FinSi
			
		Mientras Que opcionA <> 1 y opcionA <> 2 y opcionA <> 3
		
		si opcionA == opcionB Entonces
			
			Escribir "Ha sido un empate!";
			contadorEmpates = contadorEmpates + 1
			
		SiNo si opcionA == 1 y opcionB == 2 Entonces
				
				contadorPartidasB = contadorPartidasB + 1
				Escribir "Ha ganado el jugador B! Lleva " contadorPartidasB " partidas ganadas."
				
			SiNo si opcionA == 1 y opcionB == 3 Entonces
					
					contadorPartidasA = contadorPartidasA + 1
					Escribir "Ha ganado el jugador A! Lleva " contadorPartidasA " partidas ganadas."
					
				SiNo si opcionA == 2 y opcionB == 1 Entonces
						
						contadorPartidasA = contadorPartidasA + 1
						Escribir "Ha ganado el jugador A! Lleva " contadorPartidasA " partidas ganadas."
						
					SiNo si opcionA == 2 y opcionB == 3 Entonces
							
							contadorPartidasB = contadorPartidasB + 1
							Escribir "Ha ganado el jugador B! Lleva " contadorPartidasB " partidas ganadas."
							
						SiNo si opcionA == 3 y opcionB == 1 Entonces
								
								contadorPartidasB = contadorPartidasB + 1
								Escribir "Ha ganado el jugador B! Lleva " contadorPartidasB " partidas ganadas."
								
							SiNo
								
								contadorPartidasA = contadorPartidasA + 1
								Escribir "Ha ganado el jugador A! Lleva " contadorPartidasA " partidas ganadas."
								
							FinSi
						FinSi
					FinSi
				FinSi
			FinSi
		FinSi
		
	FinMientras
	
	si contadorPartidasA == 3 Entonces
		
		Escribir "Ganador del juego: Jugador A, Felicidades!"
		
	SiNo si contadorPartidasB == 3 Entonces
			
			Escribir "Ganador del juego: Jugador B, Felicidades!"
			
		FinSi
	FinSi
	
	Escribir "Cantidad de juegos ganados por A: " contadorPartidasA;
	Escribir "Cantidad de juegos ganados por B: " contadorPartidasB;
	Escribir "Cantidad de empates: ", contadorEmpates;
	
FinAlgoritmo
