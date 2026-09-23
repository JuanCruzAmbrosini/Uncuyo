package com.tecnostock.model;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/** Subclase de Producto (HERENCIA). Representa licencias / software. */
@Entity
@DiscriminatorValue("DIGITAL")
@Getter
@Setter
@NoArgsConstructor
public class ProductoDigital extends Producto {

    private String tipoLicencia;
    private String urlDescarga;
    private double tamañoMB;
}
