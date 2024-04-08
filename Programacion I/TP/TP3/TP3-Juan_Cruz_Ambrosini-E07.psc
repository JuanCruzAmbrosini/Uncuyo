// La pizzer�a Bella Napoli ofrece pizzas vegetarianas y no vegetarianas a sus clientes. Los
// ingredientes para cada tipo de pizza aparecen a continuaci�n.

//    ? Ingredientes vegetarianos: Pimiento y tofu.
//    ? Ingredientes no vegetarianos: Peperoni, Jam�n y Salm�n.

// Escribir un programa que pregunte al usuario si quiere una pizza vegetariana o no, y en funci�n
// de su respuesta le muestre un men� con los ingredientes disponibles para que elija. Solo se
// puede eligir un ingrediente adem�s de la mozzarella y el tomate que est�n en todas la pizzas. Al
// final se debe mostrar por pantalla si la pizza elegida es vegetariana o no y todos los ingredientes
// que lleva.

/// Datos de entrada: Variable l�gica que determina si la pizza es vegetariana o no. Variable de tipo cadena que describe el ingrediente seleccionado.
/// Datos de salida: Mensaje que verifica si la pizza es vegetariana o no y todos los ingredientes que llevan.

Algoritmo Ejercicio7
	
	Definir eleccionDelUsuario, eleccionDelUsuarioVegetariana, eleccionDelUsuarioNoVegetariana Como Caracter;
	
	Escribir "Bienvenido a nuestra pizzer�a!";
	Escribir "Desea usted nuestra opci�n vegetariana? (s/n)";
	Leer eleccionDelUsuario;
	
	eleccionDelUsuario = Minusculas(eleccionDelUsuario);
	
	Segun eleccionDelUsuario
		
		"s":
			Escribir "Nuuestras opciones vegetarianas son:";
			Escribir "Pimiento";
			Escribir "Tofu";
			Escribir "Por favor, seleccione la opci�n deseada.";
			Leer eleccionDelUsuarioVegetariana;
			eleccionDelUsuarioVegetariana = Minusculas(eleccionDelUsuarioVegetariana);
			
			Segun eleccionDelUsuarioVegetariana
				
				"pimiento":
					
					Escribir "Usted ha seleccionado la opci�n vegetariana.";
					Escribir "Ingredientes:";
					Escribir "Pimientos";
					Escribir "Mozzarella";
					Escribir "Tomate";
					Escribir "Por favor, seleccione la opci�n deseada.";
					
				"tofu":
					
					Escribir "Usted ha seleccionado la opci�n vegetariana.";
					Escribir "Ingredientes:";
					Escribir "Tofu";
					Escribir "Mozzarella";
					Escribir "Tomate";
					
				De Otro Modo:
					
					Escribir "Por favor, int�ntalo nuevamente usando una oci�n v�lida.";
				
			FinSegun
			
		"n":
			
			Escribir "Nuuestras opciones no vegetarianas son:";
			Escribir "Peperoni";
			Escribir "Jam�n";
			Escribir "Salm�n";
			Escribir "Por favor, seleccione la opci�n deseada.";
			Leer eleccionDelUsuarioNoVegetariana;
			eleccionDelUsuarioNoVegetariana = Minusculas(eleccionDelUsuarioNoVegetariana);
			
			Segun eleccionDelUsuarioNoVegetariana
				
				"peperoni":
					
					Escribir "Usted ha seleccionado la opci�n no vegetariana.";
					Escribir "Ingredientes:";
					Escribir "Peperoni";
					Escribir "Mozzarella";
					Escribir "Tomate";
					
				"jam�n" , "jamon":
					
					Escribir "Usted ha seleccionado la opci�n no vegetariana.";
					Escribir "Ingredientes:";
					Escribir "Jam�n";
					Escribir "Mozzarella";
					Escribir "Tomate";
					
				"salm�n" , "salmon":
					
					Escribir "Usted ha seleccionado la opci�n no vegetariana.";
					Escribir "Ingredientes:";
					Escribir "Salm�n";
					Escribir "Mozzarella";
					Escribir "Tomate";
					
				De Otro Modo:
					
					Escribir "Por favor, int�ntalo nuevamente usando una oci�n v�lida.";
					
			FinSegun
			
	FinSegun
	
FinAlgoritmo
