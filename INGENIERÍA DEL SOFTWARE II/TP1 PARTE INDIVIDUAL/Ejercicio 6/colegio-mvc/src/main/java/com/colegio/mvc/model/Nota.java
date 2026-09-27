package com.colegio.mvc.model;

import com.colegio.mvc.model.audit.Auditable;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

/**
 * Nota: es la CLASE DE ASOCIACION entre Alumno y Materia (el requisito original
 * "se registran las notas por materias de los alumnos"). Representa la
 * calificacion de UN alumno en UNA materia, en una fecha/periodo determinado.
 *
 * Es simultaneamente parte de dos relaciones de COMPOSICION: no existe sin su
 * Alumno ni sin su Materia (ambos padres la eliminan en cascada, orphanRemoval).
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "notas")
public class Nota extends Auditable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "alumno_id", nullable = false)
    private Alumno alumno;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "materia_id", nullable = false)
    private Materia materia;

    @Column(nullable = false)
    private Double valor;

    @Column(nullable = false)
    private LocalDate fecha;

    @Column(length = 40)
    private String periodo; // ej: "1er cuatrimestre"
}
