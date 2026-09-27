package com.colegio.mvc.dto;

import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NotaDTO {
    private Long id;

    @NotNull(message = "Debe seleccionar un alumno")
    private Long alumnoId;
    private String alumnoNombreCompleto; // solo lectura

    @NotNull(message = "Debe seleccionar una materia")
    private Long materiaId;
    private String materiaNombre; // solo lectura

    @NotNull(message = "La nota es obligatoria")
    @DecimalMin(value = "1.0", message = "La nota minima es 1")
    @DecimalMax(value = "10.0", message = "La nota maxima es 10")
    private Double valor;

    @NotNull(message = "La fecha es obligatoria")
    private LocalDate fecha;

    private String periodo;
}
