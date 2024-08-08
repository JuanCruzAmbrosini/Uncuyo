// La pizzería Bella Napoli ofrece pizzas vegetarianas y no vegetarianas a sus clientes. Los
// ingredientes para cada tipo de pizza aparecen a continuación.

//    ? Ingredientes vegetarianos: Pimiento y tofu.
//    ? Ingredientes no vegetarianos: Peperoni, Jamón y Salmón.

// Escribir un programa que pregunte al usuario si quiere una pizza vegetariana o no, y en función
// de su respuesta le muestre un menú con los ingredientes disponibles para que elija. Solo se
// puede eligir un ingrediente además de la mozzarella y el tomate que están en todas la pizzas. Al
// final se debe mostrar por pantalla si la pizza elegida es vegetariana o no y todos los ingredientes
// que lleva.

/// Datos de entrada: Variable lógica que determina si la pizza es vegetariana o no. Variable de tipo cadena que describe el ingrediente seleccionado.
/// Datos de salida: Mensaje que verifica si la pizza es vegetariana o no y todos los ingredientes que llevan.

Algoritmo Ejercicio7
	
	Definir eleccionDelUsuario, eleccionDelUsuarioVegetariana, eleccionDelUsuarioNoVegetariana Como Caracter;
	
	Escribir "Bienvenido a nuestra pizzería!";
	Escribir "Desea usted nuestra opción vegetariana? (s/n)";
	Leer eleccionDelUsuario;
	
	eleccionDelUsuario = Minusculas(eleccionDelUsuario);
	
	Segun eleccionDelUsuario
		
		"s":
			Escribir "Nuuestras opciones vegetarianas son:";
			Escribir "Pimiento";
			Escribir "Tofu";
			Escribir "Por favor, seleccione la opción deseada.";
			Leer eleccionDelUsuarioVegetariana;
			eleccionDelUsuarioVegetariana = Minusculas(eleccionDelUsuarioVegetariana);
			
			Segun eleccionDelUsuarioVegetariana
				
				"pimiento":
					
					Escribir "Usted ha seleccionado la opción vegetariana.";
					Escribir "Ingredientes:";
					Escribir "Pimientos";
					Escribir "Mozzarella";
					Escribir "Tomate";
					Escribir "Por favor, seleccione la opción deseada.";
					
				"tofu":
					
					Escribir "Usted ha seleccionado la opción vegetariana.";
					Escribir "Ingredientes:";
					Escribir "Tofu";
					Escribir "Mozzarella";
					Escribir "Tomate";
					
				De Otro Modo:
					
					Escribir "Por favor, inténtalo nuevamente usando una oción válida.";
				
			FinSegun
			
		"n":
			
			Escribir "Nuuestras opciones no vegetarianas son:";
			Escribir "Peperoni";
			Escribir "Jamón";
			Escribir "Salmón";
			Escribir "Por favor, seleccione la opción deseada.";
			Leer eleccionDelUsuarioNoVegetariana;
			eleccionDelUsuarioNoVegetariana = Minusculas(eleccionDelUsuarioNoVegetariana);
			
			Segun eleccionDelUsuarioNoVegetariana
				
				"peperoni":
					
					Escribir "Usted ha seleccionado la opción no vegetariana.";
					Escribir "Ingredientes:";
					Escribir "Peperoni";
					Escribir "Mozzarella";
					Escribir "Tomate";
					
				"jamón" , "jamon":
					
					Escribir "Usted ha seleccionado la opción no vegetariana.";
					Escribir "Ingredientes:";
					Escribir "Jamón";
					Escribir "Mozzarella";
					Escribir "Tomate";
					
				"salmón" , "salmon":
					
					Escribir "Usted ha seleccionado la opción no vegetariana.";
					Escribir "Ingredientes:";
					Escribir "Salmón";
					Escribir "Mozzarella";
					Escribir "Tomate";
					
				De Otro Modo:
					
					Escribir "Por favor, inténtalo nuevamente usando una oción válida.";
					
			FinSegun
			
	FinSegun
	
FinAlgoritmo
