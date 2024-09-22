package entities;

public class Tarea {


    private String nombre;
    private String descripcion;
    private boolean completada;

    public Tarea() {

        this.completada = false;

    }

    public String getNombre() {
        return nombre;
    }

    public Tarea setNombre(String nombre) {
        this.nombre = nombre;
        return this;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public Tarea setDescripcion(String descripcion) {
        this.descripcion = descripcion;
        return this;
    }

    public boolean getCompletada() {
        return completada;
    }

    public Tarea setCompletada(boolean completada) {
        this.completada = completada;
        return this;
    }

    @Override
    public String toString() {
        return "Tarea{" +
                "nombre='" + nombre + '\'' +
                ", descripcion='" + descripcion + '\'' +
                ", completada=" + completada +
                '}';
    }

    public void completarTarea (){

        this.completada = true;

    }

}