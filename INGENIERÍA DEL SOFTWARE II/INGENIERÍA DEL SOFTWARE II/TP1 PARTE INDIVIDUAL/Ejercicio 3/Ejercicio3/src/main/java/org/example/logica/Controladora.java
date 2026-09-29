package org.example.logica;

import org.example.persistencia.ControladoraPersistencia;

import java.util.ArrayList;

public class Controladora {

    ControladoraPersistencia controlPersist = new ControladoraPersistencia();


    public void crearAlumno(Alumno alumno){
        controlPersist.crearAlumno(alumno);
    }

    public void eliminarAlumno(int id){
        controlPersist.eliminarAlumno(id);
    }

    public void editarAlumno(Alumno alumno){
        controlPersist.editarAlumno(alumno);
    }

    public Alumno traerAlumno(int id){
        return controlPersist.traerAlumno(id);
    }

    public ArrayList<Alumno> traerAlumnos(){
        return controlPersist.traerAlumnos();
    }

//CARRERA

    public void crearCarrera(Carrera carrera){
        controlPersist.crearCarrera(carrera);
    }

    public void eliminarCarrera(int id){
        controlPersist.eliminarCarrera(id);
    }

    public void editarCarrera(Carrera carrera){
        controlPersist.editarCarrera(carrera);
    }

    public Carrera traerCarrera(int id){
        return controlPersist.traerCarrera(id);
    }

    public ArrayList<Carrera> traerCarreras(){
        return controlPersist.traerCarreras();
    }

//MATERIA

    public void crearMateria(Materia materia){
        controlPersist.crearMateria(materia);
    }

    public void eliminarMateria(int id){
        controlPersist.eliminarMateria(id);
    }

    public void editarMateria(Materia materia){
        controlPersist.editarMateria(materia);
    }

    public Materia traerMateria(int id){
        return controlPersist.traerMateria(id);
    }

    public ArrayList<Materia> traerMaterias(){
        return controlPersist.traerMaterias();
    }

}
