package com.tecnostock.service;

import com.tecnostock.dto.ProductoDTO;
import com.tecnostock.dto.ProductoRequestDTO;

import java.util.List;

/**
 * Contrato de la capa de SERVICIO (logica de negocio del AMB de productos).
 * El Controller solo conoce esta interfaz, nunca la implementacion
 * concreta ni el Repository: esto permite cambiar la implementacion
 * (por ejemplo, agregar cache) sin tocar la capa web.
 */
public interface ProductoService {

    List<ProductoDTO> listarTodos();

    ProductoDTO buscarPorId(Long id);

    ProductoDTO guardar(ProductoRequestDTO request);

    ProductoDTO actualizar(Long id, ProductoRequestDTO request);

    void eliminar(Long id);
}
