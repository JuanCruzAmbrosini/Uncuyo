package com.colegio.mvc.mapper;

import com.colegio.mvc.dto.GradoDTO;
import com.colegio.mvc.model.Aula;
import com.colegio.mvc.model.Grado;

public class GradoMapper {

    public static GradoDTO toDTO(Grado grado) {
        GradoDTO dto = new GradoDTO();
        dto.setId(grado.getId());
        dto.setNombre(grado.getNombre());
        dto.setAnioLectivo(grado.getAnioLectivo());
        if (grado.getAula() != null) {
            dto.setAulaId(grado.getAula().getId());
            dto.setAulaNombre(grado.getAula().getNombre());
        }
        dto.setCantidadAlumnos(grado.getAlumnos() == null ? 0 : grado.getAlumnos().size());
        return dto;
    }

    public static void copyToEntity(GradoDTO dto, Grado grado, Aula aula) {
        grado.setNombre(dto.getNombre());
        grado.setAnioLectivo(dto.getAnioLectivo());
        grado.setAula(aula);
    }
}
