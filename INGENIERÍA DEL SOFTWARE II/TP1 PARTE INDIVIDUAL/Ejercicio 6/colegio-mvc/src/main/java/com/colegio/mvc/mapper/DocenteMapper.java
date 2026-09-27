package com.colegio.mvc.mapper;

import com.colegio.mvc.dto.DocenteDTO;
import com.colegio.mvc.model.Docente;

public class DocenteMapper {

    public static DocenteDTO toDTO(Docente docente) {
        DocenteDTO dto = new DocenteDTO();
        dto.setId(docente.getId());
        dto.setNombre(docente.getNombre());
        dto.setApellido(docente.getApellido());
        dto.setSexo(docente.getSexo());
        dto.setFechaNacimiento(docente.getFechaNacimiento());
        dto.setEmail(docente.getEmail());
        if (docente.getDepartamento() != null) {
            dto.setDepartamentoId(docente.getDepartamento().getId());
            dto.setDepartamentoNombre(docente.getDepartamento().getNombre());
        }
        return dto;
    }
}
