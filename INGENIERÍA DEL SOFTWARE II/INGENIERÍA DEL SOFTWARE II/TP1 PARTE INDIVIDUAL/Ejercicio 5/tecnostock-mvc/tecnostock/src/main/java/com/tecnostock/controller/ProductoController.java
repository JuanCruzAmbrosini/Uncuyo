package com.tecnostock.controller;

import com.tecnostock.dto.CategoriaDTO;
import com.tecnostock.dto.ProductoRequestDTO;
import com.tecnostock.repository.CategoriaRepository;
import com.tecnostock.service.ProductoService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * CONTROLLER (capa C de MVC).
 *
 * Responsabilidades EXCLUSIVAS de esta capa:
 *   1) Mapear rutas HTTP (@GetMapping/@PostMapping) a acciones del AMB.
 *   2) Validar la entrada (@Valid + BindingResult) antes de llamar al Service.
 *   3) Delegar TODA la logica de negocio al ProductoService (el Controller
 *      no accede a los Repository ni a las Entidades directamente).
 *   4) Cargar el Model con los datos que la Vista (Thymeleaf) necesita
 *      renderizar, y decidir a que plantilla ir (return "productos/list", etc.)
 *      o hacia donde redirigir (patron POST-Redirect-GET, evita reenvios
 *      duplicados del formulario al recargar la pagina).
 *
 * @Controller (no @RestController) porque devuelve VISTAS (HTML renderizado
 * por Thymeleaf), no JSON.
 */
@Controller
@RequestMapping("/productos")
public class ProductoController {

    private final ProductoService productoService;
    private final CategoriaRepository categoriaRepository;

    public ProductoController(ProductoService productoService, CategoriaRepository categoriaRepository) {
        this.productoService = productoService;
        this.categoriaRepository = categoriaRepository;
    }

    /** LISTAR (parte del diagrama de secuencia: GET /productos). */
    @GetMapping
    public String listar(Model model) {
        model.addAttribute("productos", productoService.listarTodos());
        return "productos/list"; // resuelve a templates/productos/list.html
    }

    /** Muestra el formulario vacio para ALTA. */
    @GetMapping("/nuevo")
    public String mostrarFormularioAlta(Model model) {
        model.addAttribute("productoRequest", new ProductoRequestDTO());
        cargarCategoriasEnModelo(model);
        return "productos/form";
    }

    /** ALTA: procesa el formulario de creacion. */
    @PostMapping("/guardar")
    public String guardar(@Valid @ModelAttribute("productoRequest") ProductoRequestDTO request,
                           BindingResult resultado,
                           Model model,
                           RedirectAttributes redirectAttributes) {
        if (resultado.hasErrors()) {
            cargarCategoriasEnModelo(model);
            return "productos/form"; // vuelve al formulario mostrando los errores de validacion
        }
        productoService.guardar(request);
        redirectAttributes.addFlashAttribute("mensajeExito", "Producto creado correctamente");
        return "redirect:/productos"; // Post-Redirect-Get
    }

    /** Muestra el formulario precargado para MODIFICACION. */
    @GetMapping("/editar/{id}")
    public String mostrarFormularioEdicion(@PathVariable Long id, Model model) {
        var productoDTO = productoService.buscarPorId(id);

        ProductoRequestDTO request = new ProductoRequestDTO();
        request.setIdProducto(productoDTO.getIdProducto());
        request.setNombre(productoDTO.getNombre());
        request.setDescripcion(productoDTO.getDescripcion());
        request.setPrecio(productoDTO.getPrecio());
        request.setStock(productoDTO.getStock());
        request.setStockMinimo(productoDTO.getStockMinimo());
        request.setTipoProducto(productoDTO.getTipoProducto());

        model.addAttribute("productoRequest", request);
        cargarCategoriasEnModelo(model);
        return "productos/form";
    }

    /** MODIFICACION: procesa el formulario de edicion. */
    @PostMapping("/actualizar/{id}")
    public String actualizar(@PathVariable Long id,
                              @Valid @ModelAttribute("productoRequest") ProductoRequestDTO request,
                              BindingResult resultado,
                              Model model,
                              RedirectAttributes redirectAttributes) {
        if (resultado.hasErrors()) {
            cargarCategoriasEnModelo(model);
            return "productos/form";
        }
        productoService.actualizar(id, request);
        redirectAttributes.addFlashAttribute("mensajeExito", "Producto actualizado correctamente");
        return "redirect:/productos";
    }

    /** BAJA. */
    @PostMapping("/eliminar/{id}")
    public String eliminar(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        productoService.eliminar(id);
        redirectAttributes.addFlashAttribute("mensajeExito", "Producto eliminado correctamente");
        return "redirect:/productos";
    }

    private void cargarCategoriasEnModelo(Model model) {
        var categorias = categoriaRepository.findAll().stream()
                .map(c -> new CategoriaDTO(c.getIdCategoria(), c.getNombre()))
                .toList();
        model.addAttribute("categorias", categorias);
    }
}
