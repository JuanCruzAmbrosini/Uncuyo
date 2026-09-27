package com.colegio.mvc.service;

import com.colegio.mvc.dto.MateriaDTO;
import java.util.List;

public interface MateriaService {
    List<MateriaDTO> listarTodas();
    MateriaDTO buscarPorId(Long id);
    MateriaDTO guardar(MateriaDTO dto);
    void eliminar(Long id);
}
