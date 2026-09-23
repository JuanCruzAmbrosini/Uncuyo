package com.tecnostock.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

/**
 * Registra el detalle de una orden de compra: que producto, cuantas
 * unidades y a que precio unitario se compraron al proveedor mayorista.
 *
 * Es la "parte" en la relacion de COMPOSICION con OrdenCompra: no tiene
 * sentido de negocio ni identidad propia por fuera de la orden a la que
 * pertenece (por eso el JoinColumn no es nullable).
 *
 * Tambien mantiene una ASOCIACION simple hacia Producto (el detalle
 * "referencia" al producto comprado; el producto sigue existiendo aunque
 * se borre el detalle o la orden).
 */
@Entity
@Table(name = "detalle_orden_compra")
@Getter
@Setter
@NoArgsConstructor
public class DetalleOrdenCompra {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idDetalle;

    @Column(nullable = false)
    private int cantidad;

    @Column(nullable = false, precision = 12, scale = 2)
    private BigDecimal precioUnitario;

    /** Parte de la Composicion: FK obligatoria, sin la orden el detalle no existe. */
    @ManyToOne
    @JoinColumn(name = "id_orden_compra", nullable = false)
    private OrdenCompra ordenCompra;

    /** Asociacion simple hacia el producto comprado. */
    @ManyToOne
    @JoinColumn(name = "id_producto", nullable = false)
    private Producto producto;

    public BigDecimal calcularSubtotal() {
        return precioUnitario.multiply(BigDecimal.valueOf(cantidad));
    }
}
