package com.colegio.mvc.dto;

import com.colegio.mvc.enums.Sexo;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

/**
 * DTO de Alumno: es lo que viaja entre el Controller y la Vista (y lo que el
 * formulario envia de vuelta al Controller). Nunca se expone la entidad JPA
 * directamente: asi evitamos problemas de serializacion por colecciones lazy
 * (notas, clubes) y desacoplamos el modelo de persistencia de la capa web.
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AlumnoDTO {
    private Long id;

    @NotBlank(message = "El nombre es obligatorio")
    private String nombre;

    @NotBlank(message = "El apellido es obligatorio")
    private String apellido;

    @NotNull(message = "El sexo es obligatorio")
    private Sexo sexo;

    @NotNull(message = "La fecha de nacimiento es obligatoria")
    private LocalDate fechaNacimiento;

    private Long gradoId;
    private String gradoNombre; // solo lectura, para mostrar en listados
}
