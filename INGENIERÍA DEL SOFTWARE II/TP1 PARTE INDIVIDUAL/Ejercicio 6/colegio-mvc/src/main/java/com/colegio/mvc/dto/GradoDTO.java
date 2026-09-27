package com.colegio.mvc.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class GradoDTO {
    private Long id;

    @NotBlank(message = "El nombre es obligatorio")
    private String nombre;

    @NotNull(message = "El anio lectivo es obligatorio")
    private Integer anioLectivo;

    private Long aulaId;
    private String aulaNombre; // solo lectura
    private int cantidadAlumnos; // solo lectura
}
