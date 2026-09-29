package com.tecnostock.service;

import com.tecnostock.dto.ProductoDTO;
import com.tecnostock.dto.ProductoRequestDTO;
import com.tecnostock.mapper.ProductoMapper;
import com.tecnostock.model.Categoria;
import com.tecnostock.model.Producto;
import com.tecnostock.model.ProductoDigital;
import com.tecnostock.model.ProductoFisico;
import com.tecnostock.repository.CategoriaRepository;
import com.tecnostock.repository.ProductoRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * SERVICE (capa de negocio). Implementa el AMB (Alta, Modificacion, Baja)
 * de productos pedido en el diagrama de secuencia.
 *
 * @Service        -> la registra como Bean gestionado por Spring, inyectable
 *                    en los Controllers (@Autowired / inyeccion por constructor).
 * @Transactional  -> cada metodo publico se ejecuta dentro de una transaccion
 *                    JPA: si algo falla a mitad de camino, Hibernate hace
 *                    rollback y no quedan datos a medio guardar.
 */
@Service
@Transactional
public class ProductoServiceImpl implements ProductoService {

    private final ProductoRepository productoRepository;
    private final CategoriaRepository categoriaRepository;
    private final ProductoMapper productoMapper;

    // Inyeccion de dependencias por constructor (buena practica: permite
    // que los campos sean "final" e inmutables, y facilita testear con mocks).
    public ProductoServiceImpl(ProductoRepository productoRepository,
                                CategoriaRepository categoriaRepository,
                                ProductoMapper productoMapper) {
        this.productoRepository = productoRepository;
        this.categoriaRepository = categoriaRepository;
        this.productoMapper = productoMapper;
    }

    @Override
    @Transactional(readOnly = true)
    public List<ProductoDTO> listarTodos() {
        return productoRepository.findAll()
                .stream()
                .map(productoMapper::toDTO)
                .toList();
    }

    @Override
    @Transactional(readOnly = true)
    public ProductoDTO buscarPorId(Long id) {
        Producto producto = obtenerEntidadOrThrow(id);
        return productoMapper.toDTO(producto);
    }

    /** ALTA. */
    @Override
    public ProductoDTO guardar(ProductoRequestDTO request) {
        Producto nuevoProducto = construirEntidadDesdeRequest(request, crearInstanciaSegunTipo(request.getTipoProducto()));
        Producto guardado = productoRepository.save(nuevoProducto);
        return productoMapper.toDTO(guardado);
    }

    /** MODIFICACION. */
    @Override
    public ProductoDTO actualizar(Long id, ProductoRequestDTO request) {
        Producto existente = obtenerEntidadOrThrow(id);
        // Nota: si el usuario cambia el "tipoProducto" en la edicion, se
        // recrea la instancia de la subclase correspondiente conservando el id.
        Producto actualizado = construirEntidadDesdeRequest(request, crearInstanciaSegunTipo(request.getTipoProducto()));
        actualizado.setIdProducto(existente.getIdProducto());
        Producto guardado = productoRepository.save(actualizado);
        return productoMapper.toDTO(guardado);
    }

    /** BAJA. */
    @Override
    public void eliminar(Long id) {
        if (!productoRepository.existsById(id)) {
            throw new EntityNotFoundException("No existe el producto con id " + id);
        }
        productoRepository.deleteById(id);
    }

    // ---------------------------------------------------------------
    // Metodos privados de apoyo
    // ---------------------------------------------------------------

    private Producto obtenerEntidadOrThrow(Long id) {
        return productoRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("No existe el producto con id " + id));
    }

    /** Decide, segun el discriminador elegido en el formulario, que subclase de Producto instanciar. */
    private Producto crearInstanciaSegunTipo(String tipoProducto) {
        return "DIGITAL".equalsIgnoreCase(tipoProducto) ? new ProductoDigital() : new ProductoFisico();
    }

    private Producto construirEntidadDesdeRequest(ProductoRequestDTO request, Producto producto) {
        Categoria categoria = categoriaRepository.findById(request.getIdCategoria())
                .orElseThrow(() -> new EntityNotFoundException("No existe la categoria con id " + request.getIdCategoria()));

        producto.setNombre(request.getNombre());
        producto.setDescripcion(request.getDescripcion());
        producto.setPrecio(request.getPrecio());
        producto.setStock(request.getStock());
        producto.setStockMinimo(request.getStockMinimo());
        producto.setCategoria(categoria);

        if (producto instanceof ProductoFisico fisico) {
            fisico.setPeso(request.getPeso() != null ? request.getPeso() : 0);
            fisico.setDimensiones(request.getDimensiones());
            fisico.setGarantiaMeses(request.getGarantiaMeses() != null ? request.getGarantiaMeses() : 0);
        } else if (producto instanceof ProductoDigital digital) {
            digital.setTipoLicencia(request.getTipoLicencia());
            digital.setUrlDescarga(request.getUrlDescarga());
            digital.setTamañoMB(request.getTamañoMB() != null ? request.getTamañoMB() : 0);
        }
        return producto;
    }
}
