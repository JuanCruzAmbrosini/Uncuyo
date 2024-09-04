package entities;

import java.util.ArrayList;
import java.util.Scanner;

/*Clase Inspector: Clase que va a ser la encargada de inspeccionar los trabajos realizados por los técnicos de la empresa (hereda de la clase "Technician", que a su vez hereda de la clase
"Person". Sus atributos son: Nombre, DNI, sexo, edad, Profesión, ordenes aprobadas y ordenes desaprobadas).
 */

public class Inspector extends Technician{

    Scanner scanner = new Scanner(System.in).useDelimiter("\n");
    private int approvedOrders;
    private int deniedOrders;

    /*Constructor usado para instanciar los objetos de tipo "Inspector" en el que se inicializan los atributos "ordenes aprobadas" y ordenes desaprobadas en 0"
     */

    public Inspector() {

        this.approvedOrders = 0;
        this.deniedOrders = 0;

    }

    /*
    Bloque de getters y setters
     */

    public int approvedOrders() {
        return approvedOrders;
    }

    public Inspector setApprovedOrders(int approvedOrders) {
        this.approvedOrders = approvedOrders;
        return this;
    }

    public int deniedOrders() {
        return deniedOrders;
    }

    public Inspector setDeniedOrders(int deniedOrders) {
        this.deniedOrders = deniedOrders;
        return this;
    }

    /*
    Método utilizado para cambiar el estado de la orden una vez haya sido finalizada por el técnico. Errores a corregir: El inspector puede evaluar las ordenes por más que hayan sido
    rechazadas por el técnico y se seguirán mostrando las ordenes por más que hayan recibido una evaluación.
     */

    public void evaluarOrden (Company company, Inspector inspector){

        company.mostrarOrdenes(company.orders());

        String idOrden;
        String estadoOrden;
        int ordenesAprobadas = 0;
        int ordenesDesaprobadas = 0;

        System.out.println("Ingrese la orden que desea evaluar.");
        idOrden = scanner.next();

        for (Order orden : company.orders()){

            if (idOrden.equalsIgnoreCase(orden.id()) ^ orden.orderState().equalsIgnoreCase("aprobada") ^ orden.orderState().equalsIgnoreCase("rechazada") ){

                System.out.println("Ingrese el estado de la orden: (aprobada/rechazada)");
                estadoOrden = scanner.next();


                if (estadoOrden.equalsIgnoreCase("aprobada")){

                    ordenesAprobadas = inspector.approvedOrders();
                    ordenesAprobadas++;

                    inspector.setApprovedOrders(ordenesAprobadas);
                    orden.setOrderState(estadoOrden);

                } else if (estadoOrden.equalsIgnoreCase("rechazada")){

                    ordenesDesaprobadas = inspector.deniedOrders();
                    ordenesDesaprobadas++;

                    inspector.setDeniedOrders(ordenesDesaprobadas);
                    orden.setOrderState(estadoOrden);

                } else {

                    System.out.println("El valor ingresado no es válido.");

                }

            } else {

                System.out.println("No se encontró la orden seleccionada o ya ha sido evaluada.");

            }

        }


    }

}
