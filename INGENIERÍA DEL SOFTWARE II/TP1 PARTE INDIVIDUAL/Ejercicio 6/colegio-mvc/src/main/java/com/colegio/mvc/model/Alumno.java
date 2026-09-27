package com.colegio.mvc.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

/**
 * Alumno HEREDA de Persona (relacion UML de Herencia).
 *
 * Ademas participa en:
 *  - AGREGACION con Grado: un alumno pertenece a un Grado (grado_id), pero el
 *    alumno tiene existencia y sentido propio aunque temporalmente no tenga
 *    grado asignado (recien inscripto, pase de año, etc). Si se borra un Grado
 *    no se borran sus alumnos.
 *  - COMPOSICION con Nota: la lista de notas de un alumno vive y muere con el
 *    (cascade = ALL, orphanRemoval = true): una nota no tiene sentido sin "su" alumno.
 *  - ASOCIACION muchos-a-muchos con Club (nueva funcionalidad: actividades
 *    extracurriculares): un alumno puede anotarse a varios clubes y viceversa,
 *    y ambos existen de forma totalmente independiente uno del otro.
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "alumnos")
@PrimaryKeyJoinColumn(name = "persona_id")
public class Alumno extends Persona {

    // --- AGREGACION (Grado "tiene" Alumnos, alumno sobrevive sin grado) ---
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "grado_id")
    private Grado grado;

    // --- COMPOSICION (las notas no existen sin el alumno) ---
    @OneToMany(mappedBy = "alumno", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Nota> notas = new ArrayList<>();

    // --- ASOCIACION N a N (nueva funcionalidad: clubes/actividades extracurriculares) ---
    @ManyToMany
    @JoinTable(
            name = "alumnos_clubes",
            joinColumns = @JoinColumn(name = "alumno_id"),
            inverseJoinColumns = @JoinColumn(name = "club_id")
    )
    private List<Club> clubes = new ArrayList<>();
}
