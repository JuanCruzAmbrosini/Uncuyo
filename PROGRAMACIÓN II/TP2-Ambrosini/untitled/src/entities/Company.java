package entities;

import javax.management.remote.NotificationResult;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

public class Company {

    Scanner scanner = new Scanner(System.in).useDelimiter("\n");

    private ArrayList <Technician> technicians;
    private ArrayList <Order> orders;
    private ArrayList<Order> acceptedOrders;
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
        this.inspectors = new ArrayList<Inspector>();
        this.acceptedOrders = new ArrayList<>();
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

    public ArrayList<Order> getAcceptedOrders() {
        return acceptedOrders;
    }

    public void setAcceptedOrders(ArrayList<Order> acceptedOrders) {
        this.acceptedOrders = acceptedOrders;
    }

    @Override
    public String toString() {
        return "Company{" +
                "scanner=" + scanner +
                ", technicians=" + technicians +
                ", orders=" + orders +
                ", inputs=" + inputs +
                ", clients=" + clients +
                ", inspectors=" + inspectors +
                '}';
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

    public void crearInspector(Company company){

        Inspector inspector = new Inspector();

        String nombre;
        String dni;
        String sexo;
        int edad;
        String profesion;

        System.out.println("Ingrese su nombre: ");
        nombre = scanner.next();
        inspector.setName(nombre);

        System.out.println("Ingrese su DNI: ");
        dni = scanner.next();
        inspector.setId(dni);

        System.out.println("Ingrese su sexo: ");
        sexo = scanner.next();
        inspector.setSex(sexo);

        System.out.println("Ingrese su edad: ");
        edad = scanner.nextInt();
        inspector.setAge(edad);

        System.out.println("Ingrese su profesión: ");
        profesion = scanner.next();
        inspector.setProfession(profesion);

        company.inspectors().add(inspector);

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

            System.out.println("El técnico necesitará herramientas para el insumo " + i + ": (s/n)");
            necesitaHerramientas = scanner.next();
            if (necesitaHerramientas == "s" ^ necesitaHerramientas == "S") {

                insumoActual.setNeedsTools(true);

            } else if (necesitaHerramientas == "n" ^ necesitaHerramientas == "N") {

                insumoActual.setNeedsTools(false);

            }

            System.out.println("¿Tiene alguna otra aclaración? (insumo" + i + ")");
            otros = scanner.next();
            insumoActual.setOthers(otros);

            listaDeInsumosActuales.add(insumoActual);
            company.setInputs(listaDeInsumosActuales);

        }

    }
    public void eliminarTecnico(Company company, String id) {

        boolean found = false;
        Iterator<Technician> iterator = company.technicians().iterator();

        while (iterator.hasNext()) {
            Technician tecnico = iterator.next();

            if (tecnico.id().equalsIgnoreCase(id)) {
                iterator.remove();
                found = true;
                break;
            }
        }

        if (!found) {
            System.out.println("No se encontró el técnico solicitado.");
        }
    }

    public void eliminarCliente(Company company, String id){

        boolean found = false;
        Iterator<Client> iterator = company.clients().iterator();

        while (iterator.hasNext()) {
            Client cliente = iterator.next();

            if (cliente.id().equalsIgnoreCase(id)) {
                iterator.remove();
                found = true;
                break;
            }
        }

        if (!found) {
            System.out.println("No se encontró el cliente solicitado.");
        }

    }

    public void eliminarInspector(Company company, String id){

        boolean found = false;
        Iterator<Inspector> iterator = company.inspectors().iterator();

        while (iterator.hasNext()) {
            Inspector inspector = iterator.next();

            if (inspector.id().equalsIgnoreCase(id)) {
                iterator.remove();
                found = true;
                break;
            }
        }

        if (!found) {
            System.out.println("No se encontró el técnico solicitado.");
        }

    }

    public void mostrarOrdenes (ArrayList<Order> ordenes){

        int contador = 0;

        for (Order orden : ordenes){

            contador ++;

            if (orden.budget() != 0 ) {
                System.out.println("-------------------------------------------------------------------------------------------");
                System.out.println("El id de la orden: " + contador + " es: " + orden.id() + "\nEl estado de evaluación de la orden es: " + orden.orderState() + "\nEl tipo de la orden es: " + orden.orderType() + "\nAceptación de la orden: " + orden.getOrderStateTechnisian() + "\nEl presupuesto para la orden es de: $" + orden.budget());
                System.out.println("-------------------------------------------------------------------------------------------");

            } else {

                System.out.println("-------------------------------------------------------------------------------------------");
                System.out.println("El id de la orden: " + contador + " es: " + orden.id() + "\nEl estado de evaluación de la orden es: " + orden.orderState() + "\nEl tipo de la orden es: " + orden.orderType() + "\nAceptación de la orden: " + orden.getOrderStateTechnisian());
                System.out.println("-------------------------------------------------------------------------------------------");
            }
        }
    }

    public void mostrarClientes (ArrayList<Client> clientes){

        int contador = 0;

        for (Client cliente : clientes){

            contador ++;

            System.out.println("-------------------------------------------------------------------------------------------");
            System.out.println("Cliente N°: " + contador + "\nNombre: " + cliente.getName() + "\nDNI: " + cliente.id());
            System.out.println("-------------------------------------------------------------------------------------------");

        }

    }

    public void mostrarTecnicos (ArrayList<Technician> tecnicos){

        int contador = 0;
        double puntuacionGeneral = 0;
        int puntuacionTotal = 0;

        for (Technician tecnico : tecnicos){

            if (tecnico.reviews().size() > 0){

                for (Review review : tecnico.reviews()){

                    puntuacionTotal += review.score();

                }

                puntuacionGeneral = (double) puntuacionTotal/tecnico.reviews().size();

                contador ++;
                System.out.println("-------------------------------------------------------------------------------------------");
                System.out.println("Tecnico N°: " + contador + "\nNombre: " + tecnico.getName() + "\nDNI: " + tecnico.id() + "\nProfesión: " + tecnico.profession() + "\nValoración: " + puntuacionGeneral);
                System.out.println("-------------------------------------------------------------------------------------------");

            } else {

                contador ++;
                System.out.println("-------------------------------------------------------------------------------------------");
                System.out.println("Tecnico N°: " + contador + "\nNombre: " + tecnico.getName() + "\nDNI: " + tecnico.id() + "\nProfesión: " + tecnico.profession());
                System.out.println("-------------------------------------------------------------------------------------------");

            }

        }

    }

    public void mostrarInspectores (ArrayList<Inspector> inspectores){

        int contador = 0;

        for (Inspector inspector : inspectores){

            contador ++;
            System.out.println("-------------------------------------------------------------------------------------------");
            System.out.println("Inspector N°: " + contador + "\nNombre: " + inspector.getName() + "\nDNI: " + inspector.id() + "\nProfesión: " + inspector.profession());
            System.out.println("-------------------------------------------------------------------------------------------");

        }

    }

    public Technician buscarTecnicoPorId(Company company, String idTecnico){

        Technician technician = new Technician();

        for(Technician tecnico : company.technicians()){

            if (idTecnico.equalsIgnoreCase(tecnico.id())){

                technician = tecnico;

            } else {

                technician = null;

            }

        }

        return technician;
    }

    public Inspector buscarInspectorPorId(Company company, String idInspector){

        Inspector inspector = new Inspector();

        for(Inspector inspector1 : company.inspectors()){

            if (idInspector.equalsIgnoreCase(inspector1.id())){

                inspector = inspector1;

            } else {

                inspector = null;

            }

        }

        return inspector;
    }

}
