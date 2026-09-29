package org.example.persistencia;

import jakarta.persistence.EntityNotFoundException;
import org.example.logica.Alumno;
import org.example.logica.Carrera;
import org.example.logica.Materia;

import java.util.ArrayList;
import java.util.List;

public class ControladoraPersistencia {

    AlumnoJpaController aluJpa = new AlumnoJpaController();
    CarreraJpaController carrJpa = new CarreraJpaController();
    MateriaJpaController materJpa = new MateriaJpaController();

    public void crearAlumno(Alumno alumno) {
        aluJpa.create(alumno);
    }

    public void eliminarAlumno(int id) {
        try {
            aluJpa.destroy(id);
        } catch (EntityNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public void editarAlumno(Alumno alumno) {
        try {
            aluJpa.edit(alumno);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public Alumno traerAlumno(int id) {

        return aluJpa.findAlumno(id);

    }

    public ArrayList<Alumno> traerAlumnos() {

        List<Alumno> alumnosAux = aluJpa.findAlumnoEntities();
        ArrayList<Alumno> alumnos = new ArrayList<>(alumnosAux);

        return alumnos;

    }

    //CARRERA

    public void crearCarrera(Carrera carrera) {
        carrJpa.create(carrera);
    }

    public void eliminarCarrera(int id) {
        try {
            carrJpa.destroy(id);
        } catch (EntityNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public void editarCarrera(Carrera carrera) {
        try {
            carrJpa.edit(carrera);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public Carrera traerCarrera(int id) {

        return carrJpa.findCarrera(id);

    }

    public ArrayList<Carrera> traerCarreras() {

        List<Carrera> carrerasAux = carrJpa.findCarreraEntities();
        ArrayList<Carrera> carreras = new ArrayList<>(carrerasAux);

        return carreras;

    }

    //MATERIA

    public void crearMateria(Materia materia) {
        materJpa.create(materia);
    }

    public void eliminarMateria(int id) {
        try {
            materJpa.destroy(id);
        } catch (EntityNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public void editarMateria(Materia materia) {
        try {
            materJpa.edit(materia);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public Materia traerMateria(int id) {

        return materJpa.findMateria(id);

    }

    public ArrayList<Materia> traerMaterias() {

        List<Materia> materiasAux = materJpa.findMateriaEntities();
        ArrayList<Materia> materias = new ArrayList<>(materiasAux);

        return materias;

    }

}
