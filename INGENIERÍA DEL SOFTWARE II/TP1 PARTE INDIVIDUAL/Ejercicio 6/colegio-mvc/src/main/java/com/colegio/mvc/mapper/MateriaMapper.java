package com.colegio.mvc.mapper;

import com.colegio.mvc.dto.MateriaDTO;
import com.colegio.mvc.model.Docente;
import com.colegio.mvc.model.Materia;

public class MateriaMapper {

    public static MateriaDTO toDTO(Materia materia) {
        MateriaDTO dto = new MateriaDTO();
        dto.setId(materia.getId());
        dto.setNombre(materia.getNombre());
        dto.setCargaHorariaSemanal(materia.getCargaHorariaSemanal());
        if (materia.getDocente() != null) {
            dto.setDocenteId(materia.getDocente().getId());
            dto.setDocenteNombreCompleto(materia.getDocente().getNombre() + " " + materia.getDocente().getApellido());
        }
        return dto;
    }

    public static void copyToEntity(MateriaDTO dto, Materia materia, Docente docente) {
        materia.setNombre(dto.getNombre());
        materia.setCargaHorariaSemanal(dto.getCargaHorariaSemanal());
        materia.setDocente(docente);
    }
}
