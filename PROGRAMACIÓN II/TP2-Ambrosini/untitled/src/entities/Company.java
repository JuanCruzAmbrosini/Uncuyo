package entities;

import javax.management.remote.NotificationResult;
import java.util.ArrayList;
import java.util.Scanner;

public class Company {

    Scanner scanner = new Scanner(System.in).useDelimiter("\n");

    private ArrayList <Technician> technicians;
    private ArrayList <Order> orders;
    private ArrayList <Inputs> inputs;
    private ArrayList <Client> clients;
    private ArrayList<Inspector> inspectors;

    public Company() {

        ArrayList<Inputs> inputList = new ArrayList<Inputs>();

        for (int i = 0; i < 9; i++) {

            Inputs inputActual = new Inputs();

            inputList.add(inputActual);

        }

        this.technicians = new ArrayList<Technician>();
        this.orders = new ArrayList<Order>();
        this.clients = new ArrayList<Client>();
        this.inputs = inputList;

    }

    public ArrayList<Technician> technicians() {
        return technicians;
    }

    public Company setTechnicians(ArrayList<Technician> technicians) {
        this.technicians = technicians;
        return this;
    }

    public ArrayList<Order> orders() {
        return orders;
    }

    public Company setOrders(ArrayList<Order> orders) {
        this.orders = orders;
        return this;
    }

    public ArrayList<Inputs> inputs() {
        return inputs;
    }

    public Company setInputs(ArrayList<Inputs> inputs) {
        this.inputs = inputs;
        return this;
    }

    public ArrayList<Client> clients() {
        return clients;
    }

    public Company setClients(ArrayList<Client> clients) {
        this.clients = clients;
        return this;
    }

    public ArrayList<Inspector> inspectors() {
        return inspectors;
    }

    public Company setInspectors(ArrayList<Inspector> inspectors) {
        this.inspectors = inspectors;
        return this;
    }

    public void createTechnician (Company company){

        ArrayList<Technician> listaTecnicos = company.technicians();

        Technician technician = new Technician();

        System.out.println("Ingrese el nombre del técnico: ");
        String name = scanner.next();
        technician.setName(name);
        System.out.println("Ingrese el DNI del técnico: ");
        String id = scanner.next();
        technician.setId(id);
        System.out.println("Ingrese el sexo del técnico: ");
        String sex = scanner.next();
        technician.setSex(sex);
        System.out.println("Ingrese la edad del técnico: ");
        int age = scanner.nextInt();
        technician.setAge(age);
        System.out.println("Ingrese la profesión del técnico: ");
        String profession = scanner.next();
        technician.setProfession(profession);

        listaTecnicos.add(technician);
        company.setTechnicians(listaTecnicos);

    }

    public void comprarInsumos(Company company){

        int insumosAComprar;
        double cantidadLitros;
        String necesitaHerramientas;
        String otros;

        ArrayList<Inputs> listaDeInsumosActuales = company.inputs();
        System.out.println("Ingrese la cantidad de insumos que desea comprar: ");
        insumosAComprar = scanner.nextInt();
        for (int i = 1; i <= insumosAComprar; i++) {

            Inputs insumoActual = new Inputs();

            System.out.println("Ingrese la cantidad de litros del insumo " + i + ": ");
            cantidadLitros = scanner.nextDouble();
            insumoActual.setProductLiters(cantidadLitros);

            System.out.println("El técnico necesitará herramientas para el insumo " + i + ": ");
            necesitaHerramientas = scanner.next();
            if (necesitaHerramientas == "s" ^ necesitaHerramientas == "S") {

                insumoActual.setNeedsTools(true);

            } else if (necesitaHerramientas == "o" ^ necesitaHerramientas == "O") {

                insumoActual.setNeedsTools(false);

            }

            System.out.println("¿Tiene alguna otra aclaración? (insumo" + i + ")");
            otros = scanner.next();
            insumoActual.setOthers(otros);

            listaDeInsumosActuales.add(insumoActual);
            company.setInputs(listaDeInsumosActuales);

        }

    }
    public void eliminarTecnico(Company company, String id){

        for(Technician tecnico : company.technicians()){

            if(tecnico.id().equalsIgnoreCase(id)){

                company.technicians.remove(tecnico);

            } else {

                System.out.println("No se encontró el técnico solicitado.");

            }

        }

    }

    public void eliminarCliente(Company company, String id){

        for(Client client : company.clients()){

            if(client.id().equalsIgnoreCase(id)){

                company.clients.remove(client);

            } else {

                System.out.println("No se encontró el cliente solicitado.");

            }

        }

    }

    public void mostrarOrdenes (ArrayList<Order> ordenes){

        int contador = 0;

        for (Order orden : ordenes){

            contador ++;

            System.out.println("El id de la orden: " + contador + "es: " + orden.id());

        }

    }

}
