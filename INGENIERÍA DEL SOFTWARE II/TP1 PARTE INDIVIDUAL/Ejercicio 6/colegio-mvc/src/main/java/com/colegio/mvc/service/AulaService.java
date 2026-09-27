package com.colegio.mvc.service;

import com.colegio.mvc.dto.AulaDTO;
import java.util.List;

public interface AulaService {
    List<AulaDTO> listarTodas();
    AulaDTO guardar(AulaDTO dto);
    void eliminar(Long id);
}
