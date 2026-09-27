package com.colegio.mvc.model;

import com.colegio.mvc.model.audit.Auditable;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

/**
 * Aula fisica del colegio.
 *  - COMPOSICION con Colegio (es la "parte": un aula no existe sin su colegio).
 *  - ASOCIACION con Grado: un aula puede ser usada por uno o varios grados
 *    (ej turno manana / turno tarde); ambas entidades existen independientemente.
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "aulas")
public class Aula extends Auditable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 60)
    private String nombre;

    @Column(nullable = false)
    private Integer capacidad;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "colegio_id", nullable = false)
    private Colegio colegio;

    // --- ASOCIACION ---
    @OneToMany(mappedBy = "aula")
    private List<Grado> grados = new ArrayList<>();
}
