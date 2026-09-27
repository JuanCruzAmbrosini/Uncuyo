package com.colegio.mvc.model;

import com.colegio.mvc.model.audit.Auditable;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

/**
 * Nueva funcionalidad (parte a): Departamento academico (ej "Departamento de
 * Ciencias", "Departamento de Humanidades") que agrupa docentes.
 *
 * - COMPOSICION con Colegio (es la "parte" en Colegio *-- Departamento).
 * - AGREGACION con Docente (es el "todo" en Departamento o-- Docente): un
 *   docente puede cambiar de departamento o no tener ninguno asignado sin
 *   dejar de existir.
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "departamentos")
public class Departamento extends Auditable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 100)
    private String nombre;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "colegio_id", nullable = false)
    private Colegio colegio;

    @OneToMany(mappedBy = "departamento")
    private List<Docente> docentes = new ArrayList<>();
}
