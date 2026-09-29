package com.tecnostock.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

/**
 * Subclase de Usuario (HERENCIA). Es quien opera el AMB de productos y
 * registra las ordenes de compra a proveedores.
 *
 * Relacion de AGREGACION con Sucursal:
 *   Sucursal "1" o-- "0..*" Empleado
 * Un Empleado puede existir sin tener una sucursal asignada todavia
 * (por ejemplo, recien ingresado) y puede transferirse de una sucursal a otra
 * sin perder su identidad: la Sucursal "contiene" empleados pero no es dueña
 * de su ciclo de vida (a diferencia de la Composicion OrdenCompra-Detalle).
 */
@Entity
@Table(name = "empleado")
@Getter
@Setter
@NoArgsConstructor
public class Empleado extends Usuario {

    @Column(unique = true, length = 20)
    private String legajo;

    private LocalDate fechaIngreso;

    /**
     * Lado "muchos" de la agregacion. nullable = true porque un empleado
     * puede no estar asignado a ninguna sucursal en un momento dado.
     */
    @ManyToOne
    @JoinColumn(name = "id_sucursal", nullable = true)
    private Sucursal sucursal;
}
