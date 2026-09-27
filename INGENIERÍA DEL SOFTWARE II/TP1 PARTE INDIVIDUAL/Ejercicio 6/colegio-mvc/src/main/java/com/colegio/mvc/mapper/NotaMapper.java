package com.colegio.mvc.mapper;

import com.colegio.mvc.dto.NotaDTO;
import com.colegio.mvc.model.Alumno;
import com.colegio.mvc.model.Materia;
import com.colegio.mvc.model.Nota;

public class NotaMapper {

    public static NotaDTO toDTO(Nota nota) {
        NotaDTO dto = new NotaDTO();
        dto.setId(nota.getId());
        dto.setAlumnoId(nota.getAlumno().getId());
        dto.setAlumnoNombreCompleto(nota.getAlumno().getNombre() + " " + nota.getAlumno().getApellido());
        dto.setMateriaId(nota.getMateria().getId());
        dto.setMateriaNombre(nota.getMateria().getNombre());
        dto.setValor(nota.getValor());
        dto.setFecha(nota.getFecha());
        dto.setPeriodo(nota.getPeriodo());
        return dto;
    }

    public static void copyToEntity(NotaDTO dto, Nota nota, Alumno alumno, Materia materia) {
        nota.setAlumno(alumno);
        nota.setMateria(materia);
        nota.setValor(dto.getValor());
        nota.setFecha(dto.getFecha());
        nota.setPeriodo(dto.getPeriodo());
    }
}
