package com.tecnostock.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

/**
 * DTO (Data Transfer Object) DE SALIDA.
 *
 * Motivo de usar DTO en vez de exponer la Entidad JPA directamente a la Vista:
 *   1) Desacopla el modelo de persistencia (Producto, ProductoFisico, ...) de
 *      lo que efectivamente necesita mostrar la pantalla, evitando enviar
 *      relaciones completas (@ManyToOne, listas @OneToMany) que podrian
 *      disparar lazy-loading fuera de una transaccion (LazyInitializationException).
 *   2) Permite "aplanar" datos de la jerarquia de herencia Producto/ProductoFisico/
 *      ProductoDigital en una sola estructura simple para la tabla del listado.
 *   3) Evita acoplar el contrato de la Vista a cambios internos del Modelo.
 *
 * Este ProductoDTO representa la fila que se muestra en el listado (list.html).
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductoDTO {

    private Long idProducto;
    private String nombre;
    private String descripcion;
    private BigDecimal precio;
    private int stock;
    private int stockMinimo;
    private String nombreCategoria;

    /** "FISICO" o "DIGITAL" -> se usa en la vista para mostrar un badge y decidir que campos extra mostrar. */
    private String tipoProducto;

    /** true si stock <= stockMinimo, calculado en el Service para no repetir logica en la vista. */
    private boolean stockBajoMinimo;
}
