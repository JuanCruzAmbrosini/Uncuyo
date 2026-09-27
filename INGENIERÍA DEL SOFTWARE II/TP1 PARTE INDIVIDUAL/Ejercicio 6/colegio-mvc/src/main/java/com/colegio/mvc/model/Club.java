package com.colegio.mvc.model;

import com.colegio.mvc.model.audit.Auditable;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

/**
 * Nueva funcionalidad (parte a): Club/actividad extracurricular (ej "Ajedrez",
 * "Robotica"). ASOCIACION muchos-a-muchos con Alumno: un club tiene muchos
 * integrantes y un alumno puede anotarse a muchos clubes; ninguno depende
 * del otro para existir (relacion mas debil que agregacion/composicion).
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "clubes")
public class Club extends Auditable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 80)
    private String nombre;

    @Column(length = 250)
    private String descripcion;

    @ManyToMany(mappedBy = "clubes")
    private List<Alumno> integrantes = new ArrayList<>();
}
