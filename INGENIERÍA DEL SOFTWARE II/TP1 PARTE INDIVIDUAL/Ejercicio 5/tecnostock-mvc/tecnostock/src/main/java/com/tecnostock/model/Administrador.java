package com.tecnostock.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Subclase de Usuario (HERENCIA). Representa a quien administra el sistema:
 * gestiona usuarios, ve reportes, configura categorias, proveedores, etc.
 */
@Entity
@Table(name = "administrador")
@Getter
@Setter
@NoArgsConstructor
public class Administrador extends Usuario {

    /** 1 = acceso total, 2 = acceso limitado a reportes, etc. */
    private int nivelAcceso;
}
