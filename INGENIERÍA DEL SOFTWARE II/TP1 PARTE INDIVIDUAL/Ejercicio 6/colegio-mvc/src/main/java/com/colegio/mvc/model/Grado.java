package com.colegio.mvc.model;

import com.colegio.mvc.model.audit.Auditable;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

/**
 * Grado (ej "3° A"). Es el requisito original del problema ("alumnos con su
 * respectivo grado y aula").
 *  - ASOCIACION con Aula: el grado usa un aula, ambos existen independientemente.
 *  - AGREGACION con Alumno (el grado es el "todo"): agrupa alumnos, pero un
 *    alumno puede existir sin grado (recien inscripto) o cambiar de grado
 *    (pase de año) sin ser destruido.
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "grados")
public class Grado extends Auditable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 20)
    private String nombre; // ej: "3° A"

    @Column(nullable = false)
    private Integer anioLectivo;

    // --- ASOCIACION ---
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "aula_id")
    private Aula aula;

    // --- AGREGACION ---
    @OneToMany(mappedBy = "grado")
    private List<Alumno> alumnos = new ArrayList<>();
}
