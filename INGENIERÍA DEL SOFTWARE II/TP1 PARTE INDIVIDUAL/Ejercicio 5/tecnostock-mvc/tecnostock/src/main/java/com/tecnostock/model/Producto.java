package com.tecnostock.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

/**
 * MODELO central del sistema. Es la clase BASE de una segunda jerarquia
 * de HERENCIA (independiente de la de Usuario), justificada porque una
 * empresa de tecnologia vende tanto productos fisicos (notebooks,
 * perifericos) como productos digitales (licencias de software):
 *
 *      Producto  <|--  ProductoFisico
 *      Producto  <|--  ProductoDigital
 *
 * Estrategia SINGLE_TABLE: una unica tabla "producto" con una columna
 * discriminadora "tipo_producto" que indica la subclase real de cada
 * fila. Se eligio esta estrategia (en lugar de JOINED, usada en Usuario)
 * para mostrar ambas alternativas y porque las columnas especificas de
 * cada subtipo de producto son pocas (no justifica el JOIN extra).
 */
@Entity
@Table(name = "producto")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "tipo_producto", discriminatorType = DiscriminatorType.STRING)
@Getter
@Setter
@NoArgsConstructor
public abstract class Producto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idProducto;

    @Column(nullable = false, length = 120)
    private String nombre;

    @Column(length = 500)
    private String descripcion;

    @Column(nullable = false, precision = 12, scale = 2)
    private BigDecimal precio;

    @Column(nullable = false)
    private int stock;

    @Column(nullable = false)
    private int stockMinimo;

    /** Lado "muchos" de la Asociacion Categoria "1" -- "0..*" Producto. */
    @ManyToOne
    @JoinColumn(name = "id_categoria", nullable = false)
    private Categoria categoria;

    public void aumentarStock(int cantidad) {
        this.stock += cantidad;
    }

    public void disminuirStock(int cantidad) {
        if (cantidad > this.stock) {
            throw new IllegalStateException("Stock insuficiente para descontar " + cantidad + " unidades");
        }
        this.stock -= cantidad;
    }

    public boolean estaEnStockBajoMinimo() {
        return this.stock <= this.stockMinimo;
    }
}
