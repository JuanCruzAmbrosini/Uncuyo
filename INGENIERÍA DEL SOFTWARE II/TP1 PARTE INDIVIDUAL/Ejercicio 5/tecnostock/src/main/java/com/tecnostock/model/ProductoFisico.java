package com.tecnostock.model;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/** Subclase de Producto (HERENCIA). Representa hardware, accesorios, etc. */
@Entity
@DiscriminatorValue("FISICO")
@Getter
@Setter
@NoArgsConstructor
public class ProductoFisico extends Producto {

    private double peso;
    private String dimensiones;
    private int garantiaMeses;
}
