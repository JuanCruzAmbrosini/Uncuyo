package org.example;

import org.example.logica.Alumno;
import org.example.logica.Carrera;
import org.example.logica.Controladora;
import org.example.logica.Materia;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Main {
    static void main(String[] args) {

        Controladora control = new Controladora();

        //Creamos Lista de Materias
        List<Materia> listaMaterias = new ArrayList<>();

        //Creación Carrera con Lista de Materias
        Carrera carrera = new Carrera("Licenciatura en Ciencias de la Computación", listaMaterias);

        //Guardado Carrera en BD
        control.crearCarrera(carrera);

        //Creación Materias
        Materia mate1 = new Materia("Programación I", "Cuatrismestral", carrera);
        Materia mate2 = new Materia("Programacion II",  "Cuatrismestral", carrera );
        Materia mate3 = new Materia("Paradigmas de Programación", "Anual", carrera);

        //Guardado Materias en BD
        control.crearMateria(mate1);
        control.crearMateria(mate2);
        control.crearMateria(mate3);

        //Agregar a la Lista de Materias
        listaMaterias.add(mate1);
        listaMaterias.add(mate2);
        listaMaterias.add(mate3);

        carrera.setListaMaterias(listaMaterias);
        control.editarCarrera(carrera);

        //Creación Alumno (con carrera)
        Alumno jovani = new Alumno("Jovani", "Vazquez", new Date(), carrera );

        //Guardamos el alumno en la BD
        control.crearAlumno(jovani);


    }
}
