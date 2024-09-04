package entities;

import java.util.ArrayList;

public abstract class Person {

    protected String name;
    protected String id;
    protected String sex;
    protected int age;

    public Person() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String id() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String sex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int age() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
    public Technician buscarTecnicoPorId (String idTecnico, ArrayList<Technician> listaTecnicos){

        Technician tecnicoBuscado  = new Technician();

        for (Technician tecnico : listaTecnicos){

            if (idTecnico.equalsIgnoreCase(tecnico.id())){

                tecnicoBuscado = tecnico;

            } else {

                System.out.println("No se encontraron técnicos con ese id");

            }

        }

        return tecnicoBuscado;

    }
    public Client buscarClientePorId (String idCliente, ArrayList<Client> listaClientes){

        Client clienteBuscado  = new Client();

        for (Client cliente : listaClientes){

            if (idCliente.equalsIgnoreCase(cliente.id())){

                clienteBuscado = cliente;

            } else {

                System.out.println("No se encontraron clientes con ese id");

            }

        }

        return clienteBuscado;

    }
}
