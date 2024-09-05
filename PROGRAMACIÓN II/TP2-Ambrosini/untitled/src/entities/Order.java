package entities;

import java.util.Random;

/*
Clase Order: Clase usada para formar ordenes, no tinene métodos propios, ya que otras entidades son las que se encargan de gestionarlas. Sus atributos son: Tipo de orden, presupuesto,
orden aceptada por tecnico, estado de la orden, id de la orden.
 */

public class Order {

    private String orderType;
    private double budget;
    private String orderState;
    private String orderStateTechnisian;
    private String id;

    public Order(){

        Random random = new Random();

        this.orderState = "No evaluada";
        this.orderStateTechnisian = "No tomada";
        this.id = String.valueOf(random.nextInt(1000));

    }
    public String orderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public double budget() {
        return budget;
    }

    public Order setBudget(double budget) {
        this.budget = budget;
        return this;
    }

    public String orderState() {
        return orderState;
    }

    public void setOrderState(String orderState) {
        this.orderState = orderState;
    }

    public String id() {
        return id;
    }

    public Order setId(String id) {
        this.id = id;
        return this;
    }

    public String getOrderStateTechnisian() {
        return orderStateTechnisian;
    }

    public void setOrderStateTechnisian(String orderStateTechnisian) {
        this.orderStateTechnisian = orderStateTechnisian;
    }
}
