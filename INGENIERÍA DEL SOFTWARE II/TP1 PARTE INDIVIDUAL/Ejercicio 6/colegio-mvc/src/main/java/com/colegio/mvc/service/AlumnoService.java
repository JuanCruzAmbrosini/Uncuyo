package com.colegio.mvc.service;

import com.colegio.mvc.dto.AlumnoDTO;
import java.util.List;

public interface AlumnoService {
    List<AlumnoDTO> listarTodos();
    AlumnoDTO buscarPorId(Long id);
    AlumnoDTO guardar(AlumnoDTO dto);
    void eliminar(Long id);
}
