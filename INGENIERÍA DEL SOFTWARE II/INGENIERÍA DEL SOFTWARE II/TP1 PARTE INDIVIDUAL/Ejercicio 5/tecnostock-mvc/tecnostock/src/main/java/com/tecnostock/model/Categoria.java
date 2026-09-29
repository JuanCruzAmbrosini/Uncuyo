package com.tecnostock.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Entidad simple. Se relaciona con Producto mediante una ASOCIACION
 * simple 1 a muchos (Categoria "1" -- "0..*" Producto): ambas clases
 * tienen ciclo de vida totalmente independiente, solo se "conocen".
 */
@Entity
@Table(name = "categoria")
@Getter
@Setter
@NoArgsConstructor
public class Categoria {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idCategoria;

    @Column(nullable = false, unique = true, length = 60)
    private String nombre;

    private String descripcion;
}
