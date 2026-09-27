package com.colegio.mvc.model;

import com.colegio.mvc.enums.Sexo;
import com.colegio.mvc.model.audit.Auditable;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

/**
 * RELACION UML: HERENCIA (superclase abstracta).
 *
 * Persona concentra los datos comunes a Alumno y Docente. Se mapea con
 * @Inheritance(strategy = InheritanceType.JOINED): Hibernate crea una tabla
 * "personas" con los campos comunes, y una tabla propia por cada subclase
 * (alumnos, docentes) que se une a "personas" por clave foranea/primaria
 * compartida (@PrimaryKeyJoinColumn en las subclases). Es la forma mas clara
 * de traducir una herencia UML a un modelo relacional (a diferencia de
 * SINGLE_TABLE, que mezclaria todo en una sola tabla con columnas nulas).
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "personas")
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class Persona extends Auditable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 80)
    private String nombre;

    @Column(nullable = false, length = 80)
    private String apellido;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private Sexo sexo;

    @Column(nullable = false)
    private LocalDate fechaNacimiento;
}
