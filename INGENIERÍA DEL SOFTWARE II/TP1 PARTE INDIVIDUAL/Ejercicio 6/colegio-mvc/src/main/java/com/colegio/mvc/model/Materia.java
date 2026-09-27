package com.colegio.mvc.model;

import com.colegio.mvc.model.audit.Auditable;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

/**
 * Materia (ej "Matematica"). Requisito original: "se registran las notas por
 * materias de los alumnos".
 *  - ASOCIACION con Docente: la materia es dictada por un docente; ambos
 *    existen de forma independiente (una materia puede quedar sin docente
 *    asignado momentaneamente).
 *  - COMPOSICION con Nota: las notas de una materia no tienen sentido sin ella.
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "materias")
public class Materia extends Auditable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 80)
    private String nombre;

    @Column(nullable = false)
    private Integer cargaHorariaSemanal;

    // --- ASOCIACION ---
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "docente_id")
    private Docente docente;

    // --- COMPOSICION ---
    @OneToMany(mappedBy = "materia", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Nota> notas = new ArrayList<>();
}
