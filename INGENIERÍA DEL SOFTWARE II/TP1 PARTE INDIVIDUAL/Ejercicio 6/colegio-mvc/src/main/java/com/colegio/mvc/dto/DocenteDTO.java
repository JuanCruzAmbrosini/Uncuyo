package com.colegio.mvc.dto;

import com.colegio.mvc.enums.Sexo;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

/** DTO de solo lectura, para listados/perfil del docente (nunca incluye el password). */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DocenteDTO {
    private Long id;
    private String nombre;
    private String apellido;
    private Sexo sexo;
    private LocalDate fechaNacimiento;
    private String email;
    private Long departamentoId;
    private String departamentoNombre;
}
