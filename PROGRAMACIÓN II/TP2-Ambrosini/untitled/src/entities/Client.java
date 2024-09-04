package entities;

import java.util.ArrayList;
import java.util.Scanner;

/*
Clase Client: Clase que hereda de la clase "Person". Sus atributos son: nombre, DNI, sexo, edad y dirección. Representa el usuario que solicitará los servicios del técnico.
 */

public class Client extends Person{

    private String address;

    /*
    Constructor de la clase, en este caso, el constructor está vacío, ya que se prefirió definir los atributos del objeto a la hora de instanciarlo con otro método.
     */

    public Client() {
    }

    /*
    Bloque de getters y setters
     */

    public String address() {
        return address;
    }

    public Client setAddress(String address) {
        this.address = address;
        return this;
    }

    /*
    Método crearCliente, usado, valga la redundancia, para crear un cliente. Toma aun objeto de tipo "Company" y guarda el objeto creado en una lista que ésta clase tiene como atributo
    (relación uno a muchos), por éste motivo, el método es void, ya que no retorna ningún valor en sí mismo.
     */

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

    /*
    El método puntuarTécnico le solicita al usuario un puntaje y un mensaje (atributos de la clase "Review") para asignarle una reseña que va a ser guardada en una lista que el técnico
    tiene como atributo (otra relación uno a muchos, un técnico puede tener múltiples reseñas).
     */

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

    /*
    Éste método tiene como finalidad darle la posibilidad al usuario de crear una orden que va a ser asignada a un técnico específico. Cada técnico puede tener varias ordenes
    (relación uno a muchos).
     */

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

