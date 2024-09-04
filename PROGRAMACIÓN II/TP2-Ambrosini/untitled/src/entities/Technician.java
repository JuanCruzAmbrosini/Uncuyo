package entities;

import java.util.ArrayList;

public class Technician extends Person{

    protected String profession;
    private ArrayList<Review> reviews;
    private Inputs inputs;
    private ArrayList<Order> orders;

    public Technician() {

        this.inputs = new Inputs();

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

            System.out.println("El id de la orden: " + contador + "es: " + orden.id());

        }

    }
}
