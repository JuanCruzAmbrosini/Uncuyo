package com.colegio.mvc.dto;

import com.colegio.mvc.enums.Sexo;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

/**
 * DTO de ENTRADA para el formulario de registro de un nuevo docente
 * (enunciado: "los docentes se registran con Nombre, Apellido, Sexo y Fecha
 * de Nacimiento", "el usuario es el correo personal del docente").
 * Incluye la contrasena en texto plano SOLO en este DTO transitorio: el
 * Service la hashea con BCrypt antes de guardarla y este objeto se descarta.
 */
@Getter
@Setter
public class DocenteRegistroDTO {

    @NotBlank(message = "El nombre es obligatorio")
    private String nombre;

    @NotBlank(message = "El apellido es obligatorio")
    private String apellido;

    @NotNull(message = "El sexo es obligatorio")
    private Sexo sexo;

    @NotNull(message = "La fecha de nacimiento es obligatoria")
    private LocalDate fechaNacimiento;

    @NotBlank(message = "El correo es obligatorio")
    @Email(message = "Debe ser un correo valido")
    private String email;

    @NotBlank(message = "La contrasena es obligatoria")
    @Size(min = 6, message = "La contrasena debe tener al menos 6 caracteres")
    private String password;

    private Long departamentoId;
}
