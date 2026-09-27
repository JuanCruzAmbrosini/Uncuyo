package com.colegio.mvc.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

/** DTO de entrada para el formulario de cambio de contrasena del docente logueado. */
@Getter
@Setter
public class CambioPasswordDTO {

    @NotBlank(message = "Debe ingresar su contrasena actual")
    private String passwordActual;

    @NotBlank(message = "Debe ingresar la nueva contrasena")
    @Size(min = 6, message = "La nueva contrasena debe tener al menos 6 caracteres")
    private String passwordNueva;

    @NotBlank(message = "Debe confirmar la nueva contrasena")
    private String passwordConfirmacion;
}
