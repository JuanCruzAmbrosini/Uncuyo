import entities.Client;
import entities.Company;
import entities.Inspector;
import entities.Technician;

import java.util.Scanner;
/*
* Este programa está dedicado a crear un sistema que gestione la conexión entre usuarios o clientes con sus técnicos que brinden servicios para el hogar (como por ejemplo servicios
* de gasista, electricista, plomería, etc...). Para lograr este cometido se han creado las clases "Company", "Client", "Technician" entre otras que ayudan a la congruencia y al funcionamiento
* del programa. Soy conciente de algunos fallos en el funcionamiento del software, pero he decidido dejarlos para que este TP no sea tan extenso (fallos como el control de excepciones, login
* de usuarios o actualización de las listas), también he modificado ciertas cosas que estaban presentes en el TP 1 porque me parecía que sería más correcto aplicarlas como en este código)
* */
public class Main {
    /* Método main: Método principal en la ejecución del programa. En éste método se propone un menú, gestionado por un bloque switch case, que controla que "tipo de sesión" está iniciada
        o de que manera tratar al usuario. Se compone de una variedad de llamadas a métodos pertenecientes, en su mayoría, a diferentes clases.
     */
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in).useDelimiter("\n");
        Company servinic = new Company();

        boolean flag = true;
        String option;

        while (flag == true){

            System.out.println("Ingrese con que rol desea iniciar sesión: ");
            System.out.println("Compañía: (1)");
            System.out.println("Cliente: (2)");
            System.out.println("Técnico: (3)");
            System.out.println("Inspector: (4)");
            System.out.println("salir: (5)");

            option = scanner.next();

            switch ( option ){

                case "1":

                    caseCompany(servinic);

                    break;

                case "2":

                    caseClient(servinic);

                    break;

                case "3":

                    caseTechnician(servinic);

                    break;

                case "4":

                    caseInspector(servinic);

                    break;

                case "5" :

                    System.out.println("Gracias por usar nuestros servicios.");
                    flag = false;

                    break;

                default:

                    System.out.println("Ingrese una opción válida.");

            }

        }

    }

    /*Método "caseCompany: Se utiliza para gestionar el caso de que el usuario sea la empresa que brinda el servicio de conectar al cliente con el técnico en el main"
     */

    public static void caseCompany(Company company){

        Scanner scanner = new Scanner(System.in).useDelimiter("\n");

        boolean flag = true;
        String option;

        System.out.println("Usuario: Servinic");

        while (flag == true) {

            System.out.println("Ingrese la opción deseada: ");
            System.out.println("Mostrar clientes: (1)");
            System.out.println("Mostrar técnicos: (2)");
            System.out.println("Mostrar ordenes: (3)");
            System.out.println("Mostrar inspectores: (4)");
            System.out.println("Crear técnico: (5)");
            System.out.println("Crer inspector: (6)");
            System.out.println("Eliminar cliente: (7)");
            System.out.println("Eliminar técnico: (8)");
            System.out.println("Eliminar inspector: (9)");
            System.out.println("Comprar insumos: (10)");
            System.out.println("Volver al menú anterior: (11)");

            option = scanner.next();

            switch (option){

                case "1":

                    company.mostrarClientes(company.clients());
                    break;

                case "2":

                    company.mostrarTecnicos(company.technicians());
                    break;

                case "3":

                    company.mostrarOrdenes(company.orders());
                    break;

                case "4":

                    company.mostrarInspectores(company.inspectors());
                    break;

                case "5":

                    company.createTechnician(company);
                    break;

                case "6":

                    company.crearInspector(company);
                    break;

                case "7":

                    String idCliente;

                    System.out.println("Ingrese el DNI del cliente que desea eliminar: ");
                    idCliente = scanner.next();

                    company.eliminarCliente(company,idCliente);
                    break;

                case "8":

                    String idTecnico;

                    System.out.println("Ingrese el DNI del técnico que desea eliminar: ");
                    idTecnico = scanner.next();

                    company.eliminarTecnico(company,idTecnico);
                    break;

                case "9":

                    String idInspector;

                    System.out.println("Ingrese el DNI del inspector que desea eliminar: ");
                    idInspector = scanner.next();

                    company.eliminarInspector(company,idInspector);
                    break;

                case "10":

                    company.comprarInsumos(company);
                    System.out.println("Quedan " + company.inputs().size() + " paquetes de insumos.");

                    break;

                case "11":

                    System.out.println("Volviendo al menú anterior.");
                    flag = false;

                    break;

                default:

                    System.out.println("Ingrese una opción válida");

            }

        }
    }

    /*Método "caseClient: Se utiliza para gestionar el caso de que el usuario se un cliente que solicita servicios de un técnico en el main"
     */

    public static void caseClient(Company company){

        Scanner scanner = new Scanner(System.in).useDelimiter("\n");

        boolean flag = true;
        String option;

        while (flag == true){

            System.out.println("Crear usuario: (1)");
            System.out.println("Mostrar técnicos: (2)");
            System.out.println("Generar orden: (3)");
            System.out.println("Puntuar técnicos: (4)");
            System.out.println("Mostrar comentarios: (5)");
            System.out.println("Volver al menú anterior: (6)");

            option = scanner.next();

            switch (option){

                case "1":

                    Client.crearCliente(company);
                    break;

                case "2":

                    company.mostrarTecnicos(company.technicians());
                    break;

                case "3":

                    Client.crearOrden(company);
                    break;

                case "4":

                    Client.puntuarTecnico(company.technicians());
                    break;

                case "5":

                    String idTecnico;

                    System.out.println("Ingrese el DNI del técnico del que desea ver los comentarios: ");
                    idTecnico = scanner.next();

                    Technician.mostrarMensajesReviews(company.technicians(), idTecnico);
                    break;

                case "6":

                    System.out.println("Volviendo al menú anterior.");
                    flag = false;

                    break;

                default:

                    System.out.println("Ingrese una opción válida");

            }

        }

    }

    /*Método "caseTechnician: Se utiliza para gestionar el caso de que el usuario se un técnico que brinda servicios en el main"
     */

    public static void caseTechnician(Company company){

        Scanner scanner = new Scanner(System.in).useDelimiter("\n");

        boolean flag = true;
        String option;
        String idTecnico;

        System.out.println("Ingrese su DNI: ");
        idTecnico = scanner.next();

        Technician tecnico = company.buscarTecnicoPorId(company, idTecnico);

        if (tecnico == null){

            System.out.println("El DNI ingresado no se corresponde con ningun técnico.");
            flag = false;

        }

        while (flag == true) {

            System.out.println("Mostrar ordenes: (1)");
            System.out.println("Tomar o denegar una orden: (2)");
            System.out.println("Volver al menú anterior: (3)");

            option = scanner.next();

            switch (option){

                case "1":

                    tecnico.mostrarOrdenesTecnico(tecnico);
                    break;

                case "2":

                    tecnico.tomarOrden(tecnico, company);
                    break;

                case "3":

                    System.out.println("Volviendo al menú anterior.");
                    flag = false;

                    break;

                default:

                    System.out.println("Ingrese una opción válida");

            }

        }

    }

    /*Método "caseCompany: Se utiliza para gestionar el caso de que el usuario se un inspector que inspecciona los servicios brindados por los técnicos en el main"
     */

    public static void caseInspector(Company company){

        Scanner scanner = new Scanner(System.in).useDelimiter("\n");

        boolean flag = true;
        String option;
        String idInspector;

        System.out.println("Ingrese su DNI: ");
        idInspector = scanner.next();

        Inspector inspector = company.buscarInspectorPorId(company, idInspector);

        while (flag == true) {

            System.out.println("Evaluar orden: (1)");
            System.out.println("Volver al menú anterior: (2)");

            option = scanner.next();

            if (option.equals("1")){

                inspector.evaluarOrden(company,inspector);

            } else if (option.equals("2")){

                System.out.println("Volviendo al menú anterior.");
                flag = false;

            } else {

                System.out.println("Ingrese un valor válido");

            }

        }

    }

}