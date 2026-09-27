package com.colegio.mvc.service;

import com.colegio.mvc.dto.GradoDTO;
import java.util.List;

public interface GradoService {
    List<GradoDTO> listarTodos();
    GradoDTO buscarPorId(Long id);
    GradoDTO guardar(GradoDTO dto);
    void eliminar(Long id);
}
