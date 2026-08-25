package com.example.Ej4_3.ThymeleafCollections.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
public class Producto {

    private Long id;
    private String nombre;
    private String marca;
    private Double precio;

}
