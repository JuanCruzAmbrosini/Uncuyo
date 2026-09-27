package com.colegio.mvc.controller;

import com.colegio.mvc.dto.AlumnoDTO;
import com.colegio.mvc.enums.Sexo;
import com.colegio.mvc.repository.GradoRepository;
import com.colegio.mvc.service.AlumnoService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

/**
 * CRUD de Alumnos. Patron repetido en los demas controllers de este TP:
 *   GET  /alumnos            -> listado
 *   GET  /alumnos/nuevo      -> formulario alta
 *   GET  /alumnos/{id}/editar-> formulario edicion
 *   POST /alumnos/guardar    -> alta/edicion (mismo metodo, el id del DTO decide)
 *   POST /alumnos/{id}/eliminar -> baja
 */
@Controller
@RequestMapping("/alumnos")
public class AlumnoController {

    private final AlumnoService alumnoService;
    private final GradoRepository gradoRepository;

    public AlumnoController(AlumnoService alumnoService, GradoRepository gradoRepository) {
        this.alumnoService = alumnoService;
        this.gradoRepository = gradoRepository;
    }

    @GetMapping
    public String listar(Model model) {
        model.addAttribute("alumnos", alumnoService.listarTodos());
        return "alumnos/lista";
    }

    @GetMapping("/nuevo")
    public String nuevo(Model model) {
        model.addAttribute("alumnoDTO", new AlumnoDTO());
        cargarDatosDeApoyo(model);
        return "alumnos/formulario";
    }

    @GetMapping("/{id}/editar")
    public String editar(@PathVariable Long id, Model model) {
        model.addAttribute("alumnoDTO", alumnoService.buscarPorId(id));
        cargarDatosDeApoyo(model);
        return "alumnos/formulario";
    }

    @PostMapping("/guardar")
    public String guardar(@Valid @ModelAttribute AlumnoDTO alumnoDTO, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            cargarDatosDeApoyo(model);
            return "alumnos/formulario";
        }
        alumnoService.guardar(alumnoDTO);
        return "redirect:/alumnos";
    }

    @PostMapping("/{id}/eliminar")
    public String eliminar(@PathVariable Long id) {
        alumnoService.eliminar(id);
        return "redirect:/alumnos";
    }

    private void cargarDatosDeApoyo(Model model) {
        model.addAttribute("grados", gradoRepository.findAll());
        model.addAttribute("sexos", Sexo.values());
    }
}
