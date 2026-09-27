package com.colegio.mvc.mapper;

import com.colegio.mvc.dto.AlumnoDTO;
import com.colegio.mvc.model.Alumno;
import com.colegio.mvc.model.Grado;

/**
 * Mapper manual Entity <-> DTO. Se opta por mappers manuales (en vez de
 * MapStruct/ModelMapper) para que quede explicito, a fines didacticos del TP,
 * exactamente que campos cruzan de una capa a otra.
 */
public class AlumnoMapper {

    public static AlumnoDTO toDTO(Alumno alumno) {
        AlumnoDTO dto = new AlumnoDTO();
        dto.setId(alumno.getId());
        dto.setNombre(alumno.getNombre());
        dto.setApellido(alumno.getApellido());
        dto.setSexo(alumno.getSexo());
        dto.setFechaNacimiento(alumno.getFechaNacimiento());
        if (alumno.getGrado() != null) {
            dto.setGradoId(alumno.getGrado().getId());
            dto.setGradoNombre(alumno.getGrado().getNombre());
        }
        return dto;
    }

    /** Vuelca los datos del DTO sobre una entidad (nueva o existente). El grado se resuelve aparte en el Service. */
    public static void copyToEntity(AlumnoDTO dto, Alumno alumno, Grado grado) {
        alumno.setNombre(dto.getNombre());
        alumno.setApellido(dto.getApellido());
        alumno.setSexo(dto.getSexo());
        alumno.setFechaNacimiento(dto.getFechaNacimiento());
        alumno.setGrado(grado);
    }
}
