package com.tecnostock.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 * Cabecera de la orden de compra que la empresa emite a un Proveedor
 * mayorista para reponer stock.
 *
 * Relacion de COMPOSICION con DetalleOrdenCompra:
 *   OrdenCompra "1" *-- "1..*" DetalleOrdenCompra
 * cascade = ALL + orphanRemoval = true  =>  un DetalleOrdenCompra NO tiene
 * sentido ni existencia fuera de su OrdenCompra: si se elimina la orden,
 * se eliminan en cascada sus detalles; si se quita un detalle de la
 * lista, se elimina de la base (orphanRemoval).
 */
@Entity
@Table(name = "orden_compra")
@Getter
@Setter
@NoArgsConstructor
public class OrdenCompra {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idOrdenCompra;

    @Column(nullable = false)
    private LocalDate fechaEmision;

    /** PENDIENTE, CONFIRMADA, RECIBIDA, CANCELADA */
    @Column(nullable = false, length = 20)
    private String estado = "PENDIENTE";

    @Column(precision = 14, scale = 2)
    private BigDecimal total = BigDecimal.ZERO;

    /** Lado "muchos" de la Asociacion Proveedor "1" -- "0..*" OrdenCompra. */
    @ManyToOne
    @JoinColumn(name = "id_proveedor", nullable = false)
    private Proveedor proveedor;

    /** Lado "muchos" de la Asociacion Empleado "1" -- "0..*" OrdenCompra (quien la registro). */
    @ManyToOne
    @JoinColumn(name = "id_empleado", nullable = false)
    private Empleado empleadoResponsable;

    @OneToMany(mappedBy = "ordenCompra", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<DetalleOrdenCompra> detalles = new ArrayList<>();

    public void agregarDetalle(DetalleOrdenCompra detalle) {
        detalle.setOrdenCompra(this);
        this.detalles.add(detalle);
        calcularTotal();
    }

    public BigDecimal calcularTotal() {
        this.total = detalles.stream()
                .map(DetalleOrdenCompra::calcularSubtotal)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        return this.total;
    }

    public void confirmar() {
        this.estado = "CONFIRMADA";
    }
}
