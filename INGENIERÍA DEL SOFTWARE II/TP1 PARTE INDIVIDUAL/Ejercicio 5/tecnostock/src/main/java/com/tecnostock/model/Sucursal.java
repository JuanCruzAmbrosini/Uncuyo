package com.tecnostock.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

/**
 * Lado "todo" de la relacion de AGREGACION Sucursal o-- Empleado.
 * mappedBy indica que la clave foranea vive del lado de Empleado
 * (Empleado.sucursal). Si se elimina una Sucursal, sus empleados
 * NO se eliminan (a diferencia de una composicion): quedan sin sucursal
 * asignada, lo cual demuestra la semantica de "parte que puede vivir
 * independientemente del todo".
 */
@Entity
@Table(name = "sucursal")
@Getter
@Setter
@NoArgsConstructor
public class Sucursal {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idSucursal;

    @Column(nullable = false, length = 100)
    private String nombre;

    private String direccion;
    private String telefono;

    @OneToMany(mappedBy = "sucursal")
    private List<Empleado> empleados = new ArrayList<>();

    public void agregarEmpleado(Empleado e) {
        empleados.add(e);
        e.setSucursal(this);
    }
}
