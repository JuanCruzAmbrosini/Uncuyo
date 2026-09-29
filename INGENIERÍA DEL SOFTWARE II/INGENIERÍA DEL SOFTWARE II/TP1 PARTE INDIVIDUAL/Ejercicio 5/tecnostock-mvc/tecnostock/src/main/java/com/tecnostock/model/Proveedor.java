package com.tecnostock.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Proveedor mayorista al que la empresa le realiza Ordenes de Compra
 * para reponer stock. Se relaciona con OrdenCompra mediante ASOCIACION
 * (Proveedor "1" -- "0..*" OrdenCompra).
 */
@Entity
@Table(name = "proveedor")
@Getter
@Setter
@NoArgsConstructor
public class Proveedor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idProveedor;

    @Column(nullable = false, length = 120)
    private String razonSocial;

    @Column(nullable = false, unique = true, length = 20)
    private String cuit;

    private String telefono;
    private String direccion;
    private String email;
}
