package entities;

import java.util.ArrayList;
import java.util.Scanner;

public class Client extends Person{

    private String address;
    public Client() {
    }

    public String address() {
        return address;
    }

    public Client setAddress(String address) {
        this.address = address;
        return this;
    }

    public static void crearCliente(Company company) {

        Scanner scanner = new Scanner(System.in).useDelimiter("\n");

        ArrayList<Client> listaClientes = company.clients();

        Client client = new Client();

        System.out.println("Ingrese su nombre: ");
        String name = scanner.next();
        client.setName(name);
        System.out.println("Ingrese su DNI: ");
        String id = scanner.next();
        client.setId(id);
        System.out.println("Ingrese su sexo: ");
        String sex = scanner.next();
        client.setSex(sex);
        System.out.println("Ingrese su edad: ");
        int age = scanner.nextInt();
        client.setAge(age);
        System.out.println("Ingrese su dirección: ");
        String address = scanner.next();
        client.setAddress(address);

        listaClientes.add(client);
        company.setClients(listaClientes);

    }

    public static void puntuarTecnico (ArrayList <Technician> listaTecnicos) {

        Scanner scanner = new Scanner(System.in).useDelimiter("\n");
        String idTecnico;

        System.out.println("Ingrese el DNI del técnico que desea puntuar.");
        idTecnico = scanner.next();

        for (Technician tecnico : listaTecnicos) {

            if (idTecnico.equalsIgnoreCase(tecnico.id())) {

                ArrayList<Review> reviewsTecnico = tecnico.reviews();
                Review review = new Review();

                System.out.println("Ingrese un valor para puntuar al técnico (de 1 a 5): ");
                int valorReview = scanner.nextInt();
                review.setScore(valorReview);

                System.out.println("Ingrese un comentario acerca del técnico.");
                String comentarioReview = scanner.next();
                review.setComment(comentarioReview);

                reviewsTecnico.add(review);

                tecnico.setReviews(reviewsTecnico);

            } else {

                System.out.println("El técnico solicitado no fué encontrado o no existe.");

            }

        }

    }


    public static void crearOrden (Company company){

        Scanner scanner = new Scanner(System.in).useDelimiter("\n");

        String idTecnico;
        String tipoOrden;
        Order ordenNueva = new Order();

        System.out.println("Ingrese el DNI del técnico que desea solicitar.");
        idTecnico = scanner.next();

        for(Technician tecnico : company.technicians()) {

            if (idTecnico.equalsIgnoreCase(tecnico.id())) {

                ArrayList<Order> ordenesTecnico = tecnico.orders();

                System.out.println("Ingrese el tipo de orden: ");
                tipoOrden = scanner.next();
                ordenNueva.setOrderType(tipoOrden);

                ordenesTecnico.add(ordenNueva);
                company.orders().add(ordenNueva);

            } else {

                System.out.println("El técnico seleccionado no existe.");

            }

        }
    }
}

