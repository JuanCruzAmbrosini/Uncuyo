package com.colegio.mvc.model;

import com.colegio.mvc.model.audit.Auditable;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

/**
 * Nueva funcionalidad (parte a): representar el Colegio como entidad propia
 * (antes el problema no distinguia "colegio" de sus aulas/departamentos).
 *
 * Colegio COMPONE Aulas y Departamentos: si se elimina el colegio, sus aulas y
 * departamentos dejan de tener sentido y se eliminan en cascada
 * (cascade = ALL, orphanRemoval = true). Es una relacion mas fuerte que la
 * agregacion: el "todo" controla por completo el ciclo de vida de la "parte".
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "colegios")
public class Colegio extends Auditable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 120)
    private String nombre;

    @Column(length = 200)
    private String direccion;

    // --- COMPOSICION ---
    @OneToMany(mappedBy = "colegio", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Aula> aulas = new ArrayList<>();

    // --- COMPOSICION ---
    @OneToMany(mappedBy = "colegio", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Departamento> departamentos = new ArrayList<>();
}
