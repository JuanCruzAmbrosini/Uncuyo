package com.colegio.mvc.service;

import com.colegio.mvc.dto.CambioPasswordDTO;
import com.colegio.mvc.dto.DocenteDTO;
import com.colegio.mvc.dto.DocenteRegistroDTO;
import java.util.List;

public interface DocenteService {
    List<DocenteDTO> listarTodos();
    DocenteDTO registrar(DocenteRegistroDTO dto);
    void cambiarPassword(String emailDocenteLogueado, CambioPasswordDTO dto);
}
