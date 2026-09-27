package com.colegio.mvc.mapper;

import com.colegio.mvc.dto.AulaDTO;
import com.colegio.mvc.model.Aula;
import com.colegio.mvc.model.Colegio;

public class AulaMapper {

    public static AulaDTO toDTO(Aula aula) {
        return new AulaDTO(aula.getId(), aula.getNombre(), aula.getCapacidad(),
                aula.getColegio() != null ? aula.getColegio().getId() : null);
    }

    public static void copyToEntity(AulaDTO dto, Aula aula, Colegio colegio) {
        aula.setNombre(dto.getNombre());
        aula.setCapacidad(dto.getCapacidad());
        aula.setColegio(colegio);
    }
}
