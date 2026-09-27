package com.colegio.mvc.service;

import com.colegio.mvc.dto.NotaDTO;
import java.util.List;

public interface NotaService {
    List<NotaDTO> listarTodas();
    NotaDTO buscarPorId(Long id);
    NotaDTO guardar(NotaDTO dto);
    void eliminar(Long id);
}
