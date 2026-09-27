package com.colegio.mvc.repository;

import com.colegio.mvc.model.Alumno;
import org.springframework.data.jpa.repository.JpaRepository;

/** Repositorio JPA de Alumno: Spring Data genera la implementacion (capa ORM) en tiempo de ejecucion. */
public interface AlumnoRepository extends JpaRepository<Alumno, Long> {
}
