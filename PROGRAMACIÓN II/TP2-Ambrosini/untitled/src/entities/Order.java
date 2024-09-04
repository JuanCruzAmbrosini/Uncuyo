package entities;

import java.util.Random;

public class Order {

    private String orderType;
    private double budget;
    private String orderState;
    private String id;

    public Order(){

        Random random = new Random();

        this.orderState = "No evaluada";
        this.id = String.valueOf(random.nextInt(1000));

    }
    public String orderType() {
        return orderType;
    }

    public Order setOrderType(String orderType) {
        this.orderType = orderType;
        return this;
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

    public Order setOrderState(String orderState) {
        this.orderState = orderState;
        return this;
    }

    public String id() {
        return id;
    }

    public Order setId(String id) {
        this.id = id;
        return this;
    }
}
