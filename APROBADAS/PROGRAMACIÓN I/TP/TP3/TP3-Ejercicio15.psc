// Escriba un programa que solicite al usuario el tiempo que tardaron dos competidores de un rally
// y que establezca cu�l competidor tard� menos. Si ambos lo hicieron exactamente en el mismo
// tiempo deber� indicarlo. El tiempo deber� ser ingresado en horas, minutos y segundos. Por
// ejemplo:
// Tiempo que tard� el competidor (A) 
// 3 horas
// 16 minutos
// 48 segundos
// Tiempo que tard� el competidor (B)
// 3 horas
// 21 minutos
// 12 segundos
// Salida: El competidor que lo hizo en menos tiempo fue el A
/// Datos de entrada: Horas competidor A, Minutos competidor A, Segundos competidor A, Horas competidor B, Minutos competidor B, Segundos competidor B (Todos enteros).
/// Datos de salida: Mensaje que indica que competidor tard� menos (tambi�n se indica si lo hicieron al mismo tiempo).
Algoritmo Ejercicio15
	Definir horasCompetidorA, minutosCompetidorA, segundosCompetidorA, horasCompetidorB, minutosCompetidorB, segundosCompetidorB Como Entero
	Escribir 'Ingrese el tiempo del competidor A: (hh/mm/ss) (Valor m�ximo de minutos y segundos: 59)'
	Leer horasCompetidorA, minutosCompetidorA, segundosCompetidorA
	Escribir 'Ingrese el tiempo del competidor B: (hh/mm/ss) (Valor m�ximo de minutos y segundos: 59)'
	Leer horasCompetidorB, minutosCompetidorB, segundosCompetidorB
	Si horasCompetidorA>0 Y minutosCompetidorA>0 Y segundosCompetidorA>0 Y horasCompetidorB>0 Y minutosCompetidorB>0 Y segundosCompetidorB>0 Y minutosCompetidorA<60 Y minutosCompetidorB<60 Y segundosCompetidorA<60 Y segundosCompetidorB<60 Entonces
		Si horasCompetidorA==horasCompetidorB Y minutosCompetidorA==minutosCompetidorB Y segundosCompetidorA==segundosCompetidorB Entonces
			Escribir 'Los competidores tardaron el mismo tiempo!'
		SiNo
			Si horasCompetidorA==horasCompetidorB Y minutosCompetidorA==minutosCompetidorB Entonces
				Si segundosCompetidorA>segundosCompetidorB Entonces
					Escribir 'El competidor que lo hizo en menos tiempo fue el B.'
				SiNo
					Escribir 'El competidor que lo hizo en menos tiempo fue el A.'
				FinSi
			SiNo
				Si horasCompetidorA==horasCompetidorB Entonces
					Si minutosCompetidorA>minutosCompetidorB Entonces
						Escribir 'El competidor que lo hizo en menos tiempo fue el B.'
					SiNo
						Escribir 'El competidor que lo hizo en menos tiempo fue el A.'
					FinSi
				SiNo
					Si horasCompetidorA>horasCompetidorB Entonces
						Escribir 'El competidor que lo hizo en menos tiempo fue el B.'
					SiNo
						Escribir 'El competidor que lo hizo en menos tiempo fue el A.'
					FinSi
				FinSi
			FinSi
		FinSi
	SiNo
		Escribir 'Ingrese una expresi�n v�lida!'
	FinSi
FinAlgoritmo
