package com.tecnostock.dto;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

/**
 * DTO DE ENTRADA. Es lo que llega desde el formulario Thymeleaf
 * (productos/form.html) al hacer POST /productos/guardar o
 * POST /productos/actualizar.
 *
 * Las anotaciones de Bean Validation (@NotBlank, @NotNull, etc.) se
 * validan en el Controller con @Valid antes de tocar el Service/Modelo,
 * manteniendo la logica de negocio limpia de validaciones de formato.
 *
 * Incluye TODOS los campos posibles (comunes + fisico + digital); el
 * ProductoService decide, segun "tipoProducto", que subclase instanciar
 * y que campos usar.
 */
@Getter
@Setter
public class ProductoRequestDTO {

    /** Nulo en el alta, con valor en la edicion. */
    private Long idProducto;

    @NotBlank(message = "El nombre es obligatorio")
    private String nombre;

    private String descripcion;

    @NotNull(message = "El precio es obligatorio")
    @DecimalMin(value = "0.0", inclusive = false, message = "El precio debe ser mayor a 0")
    private BigDecimal precio;

    @Min(value = 0, message = "El stock no puede ser negativo")
    private int stock;

    @Min(value = 0, message = "El stock minimo no puede ser negativo")
    private int stockMinimo;

    @NotNull(message = "Debe seleccionar una categoria")
    private Long idCategoria;

    /** "FISICO" o "DIGITAL" */
    @NotBlank(message = "Debe seleccionar un tipo de producto")
    private String tipoProducto;

    // --- Campos especificos de ProductoFisico (opcionales segun tipoProducto) ---
    private Double peso;
    private String dimensiones;
    private Integer garantiaMeses;

    // --- Campos especificos de ProductoDigital (opcionales segun tipoProducto) ---
    private String tipoLicencia;
    private String urlDescarga;
    private Double tamañoMB;
}
