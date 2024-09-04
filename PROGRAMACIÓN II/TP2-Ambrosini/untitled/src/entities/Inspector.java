package entities;

import java.util.ArrayList;
import java.util.Scanner;

public class Inspector extends Technician{

    Scanner scanner = new Scanner(System.in).useDelimiter("\n");
    private int approvedOrders;
    private int deniedOrders;

    public Inspector() {

        this.approvedOrders = 0;
        this.deniedOrders = 0;

    }

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

    public void evaluarOrden (Company company, Inspector inspector){

        company.mostrarOrdenes(company.orders());
        String idOrden;
        String estadoOrden;

        System.out.println("Ingrese la orden que desea evaluar.");
        idOrden = scanner.next();

        for (Order orden : company.orders()){

            if (orden.id().equalsIgnoreCase(idOrden)){

                System.out.println("Ingrese el estado de la orden: (aprovada/rechazada)");
                estadoOrden = scanner.next();


                if (estadoOrden.equalsIgnoreCase("aprovada")){

                    inspector.setApprovedOrders(inspector.approvedOrders++);
                    orden.setOrderState(estadoOrden);

                } else if (estadoOrden.equalsIgnoreCase("rechazada")){

                    inspector.setDeniedOrders(inspector.deniedOrders++);
                    orden.setOrderState(estadoOrden);

                } else {

                    System.out.println("El valor ingresado no es válido.");

                }

            } else {

                System.out.println("No se encontró la orden seleccionada");

            }

        }


    }

}
