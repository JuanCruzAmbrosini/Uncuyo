package entities;

import java.util.ArrayList;
import java.util.Iterator;

/*    Implementar una clase ListaTareas que gestione una lista de objetos Tarea
      utilizando ArrayList. Debe contener los siguientes métodos:
        ▪ agregarTarea: Añadir nuevas tareas a la lista.
        ▪ mostrarTareas: Mostrar todas las tareas utilizando un Iterator.
        ▪ obtenerTarea: Obtener una tarea específica usando get.
        ▪ contieneTarea: Verificar si una tarea está en la lista usando contains.
        ▪ indiceTarea: Obtener la posición de una tarea usando indexOf o
            lastIndexOf.
        ▪ eliminarTarea: Eliminar tareas de la lista, ya sea por índice o por el
            objeto.
        ▪ limpiarLista: Vaciar toda la lista usando clear.
        ▪ estaVacia: Verificar si la lista está vacía usando isEmpty.
        ▪ clonarLista: Crear una copia de la lista utilizando clone.

*/

public class ListaTareas {

    private ArrayList<Tarea> tareas;

    public ListaTareas (){

        this.tareas = new ArrayList<>();

    }

    public ArrayList<Tarea> tareas() {
        return tareas;
    }

    public ListaTareas setTareas(ArrayList<Tarea> tareas) {
        this.tareas = tareas;
        return this;
    }

    @Override
    public String toString() {

        String mensajeTareas = "";

        for (Tarea tarea : tareas){

            mensajeTareas = mensajeTareas + tarea.toString() + "\n";

        }

        return mensajeTareas;

    }

    public void agregarTarea(Tarea tarea){

        tareas.add(tarea);

    }

    public void mostrarTareas(){

        Iterator<Tarea> it = tareas.iterator();

        while (it.hasNext()){

            System.out.println(it.next().toString());

        }

    }

    public Tarea obtenerTarea (String nombreTarea){

        Tarea tareaDeseada = null;

        for (Tarea tarea : tareas){

            if (nombreTarea.equalsIgnoreCase(tarea.getNombre())){

                tareaDeseada = tarea;

            }

        }

        if (tareaDeseada == null){

            System.out.println("La tarea seleccionada no existe y se ha retornado un valor nulo.");

        }

        return tareaDeseada;

    }

    public boolean contieneTarea (Tarea tarea){

        return tareas.contains(tarea);

    }

    public int indiceTarea (Tarea tarea) {

        return tareas.indexOf(tarea);

    }

    public void eliminarTarea (Tarea tarea){

        boolean bandera = false;

        Iterator<Tarea> it = tareas.iterator();

        while (it.hasNext()){

            if (it.next() == tarea){

                tareas.remove(tarea);
                bandera = true;

            }

        }

        if (bandera){

            System.out.println("No se encontró la tarea para ser eliminada.");

        } else {

            System.out.println("La tarea ha sido eliminada con éxito.");

        }

    }

    public void eliminarTareaIndice (int indice){

        tareas.remove(indice);

    }

    public void limpiarLista (){

        tareas.clear();

    }

    public boolean estaVacia (){

        return tareas.isEmpty();

    }

    public  ListaTareas clonLista (){

        ListaTareas listaClon = new ListaTareas();
        ArrayList<Tarea> tareasClon = (ArrayList<Tarea>) tareas.clone();

        listaClon.setTareas(tareasClon);

        return listaClon;

    }

}