package entities;

import javax.print.attribute.standard.PrinterMakeAndModel;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

public class Technician extends Person{

    Scanner scanner = new Scanner(System.in).useDelimiter("\n");
    protected String profession;
    private ArrayList<Review> reviews;
    private Inputs inputs;
    private ArrayList<Order> orders;

    public Technician() {

        this.inputs = new Inputs();
        this.reviews = new ArrayList<Review>();
        this.orders = new ArrayList<Order>();

    }

    public String profession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public Inputs inputs() {
        return inputs;
    }

    public ArrayList<Order> orders() {
        return orders;
    }

    public Technician setOrders(ArrayList<Order> orders) {
        this.orders = orders;
        return this;
    }

    public Technician setInputs(Inputs inputs) {
        this.inputs = inputs;
        return this;
    }

    public ArrayList<Review> reviews() {
        return reviews;
    }

    public Technician setReviews(ArrayList<Review> reviews) {
        this.reviews = reviews;
        return this;
    }
    public void mostrarOrdenesTecnico (Technician tecnico){

        int contador = 0;

        for (Order orden : tecnico.orders){

            contador ++;

            System.out.println("-------------------------------------------------------------------------------------------");
            System.out.println("El id de la orden: " + contador + " es: " + orden.id() + "\nEl estado de la orden es: " + orden.orderState() + "\nEl tipo de la orden es: " + orden.orderType());
            System.out.println("-------------------------------------------------------------------------------------------");

        }

    }

    public void tomarOrden(Technician tecnico, Company company) {
        String idOrden;
        String option;
        double presupuesto;

        System.out.println("Ingrese el id de la orden que desea tomar: ");
        idOrden = scanner.next();

        Iterator<Order> iterator = tecnico.orders.iterator();

        while (iterator.hasNext()) {
            Order orden = iterator.next();

            if (orden.id().equalsIgnoreCase(idOrden)) {
                System.out.println("¿Desea tomar la orden (1) o desea denegarla (2)?");
                option = scanner.next();

                if (option.equals("1")) {
                    if (company.inputs().size() < 1) {
                        System.out.println("No alcanzan los insumos para esta orden.");
                        return; // Salir del método si no hay insumos suficientes
                    }

                    System.out.println("La orden ha sido aceptada.");
                    System.out.println("Ingrese su presupuesto para la orden: ");
                    presupuesto = scanner.nextDouble();

                    orden.setBudget(presupuesto);
                    orden.setOrderStateTechnisian("Tomada");
                    company.inputs().remove(1); // Remover un insumo (index 1 parece incorrecto, revísalo)

                    iterator.remove(); // Eliminar la orden de manera segura usando el iterador

                } else if (option.equals("2")) {
                    System.out.println("La orden ha sido denegada.");
                } else {
                    System.out.println("Opción no válida.");
                }

                return; // Salir del método una vez que se procesa la orden
            }
        }

        System.out.println("La orden seleccionada no existe.");
    }

    public static void mostrarMensajesReviews(ArrayList<Technician> tecnicos, String idTecnico){

        int contador = 0;

        for (Technician tecnico : tecnicos){

            if (idTecnico.equalsIgnoreCase(tecnico.id())){

                for(Review review : tecnico.reviews()){

                    contador ++;

                    System.out.println("-------------------------------------------------------------------------------------------");
                    System.out.println("Comentario N° " + contador + ": " + review.comment());
                    System.out.println("-------------------------------------------------------------------------------------------");

                }

            }

        }

    }

}
