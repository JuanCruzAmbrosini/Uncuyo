Algoritmo Correccion_SiAnidado
	Definir n1, n2 , n3 Como Entero
	Escribir "MOSTRAR EL MAYOR DE 3 N�MEROS"
	Escribir "INGRESE N�MERO 01 : "
	leer n1
	Escribir "INGRESE N�MERO 02 : "
	leer n2
	Escribir "INGRESE N�MERO 03 : "
	Leer n3
	Si (n1 > n2 y n1>n3) Entonces
		Escribir "EL MAYOR ES ", n1
		SiNo
		Si (n2>n1 y n2 > n3) Entonces
			Escribir "EL MAYOR ES ", n2
			Sino 
			Escribir "EL MAYOR ES ", n3
		FinSi
	FinSi
	
FinAlgoritmo