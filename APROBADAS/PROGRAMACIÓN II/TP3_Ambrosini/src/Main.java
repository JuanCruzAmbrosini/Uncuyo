import entities.ListaTareas;
import entities.Tarea;

import java.util.Scanner;

public class Main {
    static Scanner scanner = new Scanner(System.in).useDelimiter("\n");

    public static void main(String[] args) {

        ListaTareas listaTareas = new ListaTareas();
        int opcionUsuario;
        boolean bandera = true;

        while (bandera) {

            System.out.println("-------------------------------------------------------------------------");
            System.out.println("Ingrese la opción deseada ");
            System.out.println("1_ Añadir tarea a la lista: ");
            System.out.println("2_ Mostrar tareas: ");
            System.out.println("3_ Buscar tarea en la lista: ");
            System.out.println("4_ Eliminar una tarea por índice: ");
            System.out.println("5_ Eliminar una tarea por objeto: ");
            System.out.println("6_ Vaciar lista de tareas: ");
            System.out.println("7_ Verificar vaciado de la lista: ");
            System.out.println("8_ Clonar lista y trabajar con el clon");
            System.out.println("9_ Completar tarea:");
            System.out.println("10_ Salir");
            System.out.println("-------------------------------------------------------------------------");
            opcionUsuario = scanner.nextInt();

            switch (opcionUsuario) {

                case 1:

                    listaTareas.agregarTarea(crearTarea());
                    System.out.println("Tarea creado con éxito.");
                    break;

                case 2:

                    listaTareas.mostrarTareas();
                    break;

                case 3:

                    String nombreTarea;

                    System.out.println("Ingrese el nombre de la tarea que desea buscar: ");
                    nombreTarea = scanner.next();

                    Tarea tareaDeseada = listaTareas.obtenerTarea(nombreTarea);

                    if (tareaDeseada != null) {

                        System.out.println(tareaDeseada.toString());

                    } else {

                        System.out.println("No se encontró la tarea seleccionada.");

                    }
                    break;

                case 4:

                    int indice;

                    System.out.println("Ingrese el índice donde se encuentra la tarea que desea borrar. ");
                    indice = scanner.nextInt();

                    listaTareas.eliminarTareaIndice(indice);
                    System.out.println("La tarea ha sido eliminada con éxito.");
                    break;

                case 5:

                    String nombreTareaAEliminar;

                    System.out.println("Ingrese el nombre de la tarea que desea eliminar: ");
                    nombreTareaAEliminar = scanner.next();
                    Tarea tareaAEliminar = listaTareas.obtenerTarea(nombreTareaAEliminar);

                    listaTareas.eliminarTarea(tareaAEliminar);
                    System.out.println("La tarea ha sido eliminada con éxito.");
                    break;

                case 6:

                    listaTareas.limpiarLista();
                    System.out.println("La lista ha sido limpiada!");
                    break;

                case 7:

                    if (listaTareas.estaVacia()) {

                        System.out.println("La lista está vacía!");

                    } else {

                        System.out.println("La lista no está vacía.");

                    }
                    break;

                case 8:

                    boolean bandera2 = true;
                    int opcionUsuario2;

                    ListaTareas listaClon = listaTareas.clonLista();

                    System.out.println("Usted está trabajando ahora, con el clon de la lista original!");
                    while (bandera2) {

                        System.out.println("-------------------------------------------------------------------------");
                        System.out.println("                                  CLON                                   ");
                        System.out.println("-------------------------------------------------------------------------");
                        System.out.println("Ingrese la opción deseada ");
                        System.out.println("1_ Añadir tarea a la lista (CLON): ");
                        System.out.println("2_ Mostrar tareas (CLON): ");
                        System.out.println("3_ Buscar tarea en la lista (CLON): ");
                        System.out.println("4_ Eliminar una tarea por índice (CLON): ");
                        System.out.println("5_ Eliminar una tarea por objeto (CLON): ");
                        System.out.println("6_ Vaciar lista de tareas (CLON): ");
                        System.out.println("7_ Verificar vaciado de la lista (CLON): ");
                        System.out.println("8_ Completar tarea:");
                        System.out.println("9_ Volver al menú anterior");
                        System.out.println("-------------------------------------------------------------------------");
                        opcionUsuario2 = scanner.nextInt();

                        switch (opcionUsuario2) {

                            case 1:

                                listaClon.agregarTarea(crearTarea());
                                System.out.println("Una nueva tarea ha sido añadida a la lista clonada!");
                                break;

                            case 2:

                                listaClon.mostrarTareas();
                                break;

                            case 3:

                                System.out.println("Ingrese el nombre de la tarea que desea buscar: ");
                                nombreTarea = scanner.next();

                                Tarea tareaDeseadaClon = listaClon.obtenerTarea(nombreTarea);

                                if (tareaDeseadaClon != null) {

                                    System.out.println(tareaDeseadaClon.toString());

                                } else {

                                    System.out.println("No se encontró la tarea seleccionada.");

                                }

                                break;

                            case 4:

                                System.out.println("Ingrese el índice donde se encuentra la tarea que desea borrar. ");
                                indice = scanner.nextInt();

                                listaClon.eliminarTareaIndice(indice);
                                break;

                            case 5:

                                System.out.println("Ingrese el nombre de la tarea que desea eliminar: ");
                                nombreTareaAEliminar = scanner.next();
                                Tarea tareaAEliminarClon = listaClon.obtenerTarea(nombreTareaAEliminar);

                                listaClon.eliminarTarea(tareaAEliminarClon);
                                break;

                            case 6:

                                listaClon.limpiarLista();
                                System.out.println("La lista ha sido limpiada!");
                                break;

                            case 7:

                                if (listaClon.estaVacia()) {

                                    System.out.println("La lista está vacía!");

                                } else {

                                    System.out.println("La lista no está vacía.");

                                }
                                break;

                            case 8:

                                System.out.println("Ingrese el nombre de la tarea que desea completar: ");
                                nombreTarea = scanner.next();

                                Tarea tarea = listaClon.obtenerTarea(nombreTarea);

                                if (tarea != null) {

                                    tarea.completarTarea();
                                    System.out.println("La tarea ha sido completada con éxito.");

                                } else {

                                    System.out.println("No se encontró la tarea que desea completar.");
                                }
                                break;

                            case 9:

                                System.out.println("Volviendo al menú anterior: ");
                                bandera2 = false;
                                break;

                            default:

                                System.out.println("Ingrese un valor válido.");

                        }

                    }

                    break;

                case 9:

                    System.out.println("Ingrese el nombre de la tarea que desea completar: ");
                    nombreTarea = scanner.next();

                    Tarea tarea = listaTareas.obtenerTarea(nombreTarea);

                    if (tarea != null) {

                        tarea.completarTarea();
                        System.out.println("La tarea ha sido completada con éxito.");

                    } else {

                        System.out.println("No se encontró la tarea que desea completar.");

                    }
                    break;

                case 10:

                    System.out.println("Gracias por utilizar nuestros servicios!");
                    bandera = false;
                    break;

                default:

                    System.out.println("Ingrese un valor válido.");

            }

        }
    }

    public static Tarea crearTarea() {

        String nombre;
        String descripcion;
        Tarea tarea = new Tarea();

        System.out.println("Ingrese el nombre de la tarea: ");
        nombre = scanner.next();
        tarea.setNombre(nombre);

        System.out.println("Ingrese la descripción de la tarea: ");
        descripcion = scanner.next();
        tarea.setDescripcion(descripcion);

        return tarea;

    }
}