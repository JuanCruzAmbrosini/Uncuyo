package com.colegio.mvc.controller;

import com.colegio.mvc.dto.NotaDTO;
import com.colegio.mvc.repository.AlumnoRepository;
import com.colegio.mvc.repository.MateriaRepository;
import com.colegio.mvc.service.NotaService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

/** Controller central del requisito "notas por materias de los alumnos". */
@Controller
@RequestMapping("/notas")
public class NotaController {

    private final NotaService notaService;
    private final AlumnoRepository alumnoRepository;
    private final MateriaRepository materiaRepository;

    public NotaController(NotaService notaService, AlumnoRepository alumnoRepository,
                           MateriaRepository materiaRepository) {
        this.notaService = notaService;
        this.alumnoRepository = alumnoRepository;
        this.materiaRepository = materiaRepository;
    }

    @GetMapping
    public String listar(Model model) {
        model.addAttribute("notas", notaService.listarTodas());
        return "notas/lista";
    }

    @GetMapping("/nuevo")
    public String nuevo(Model model) {
        model.addAttribute("notaDTO", new NotaDTO());
        cargarDatosDeApoyo(model);
        return "notas/formulario";
    }

    @GetMapping("/{id}/editar")
    public String editar(@PathVariable Long id, Model model) {
        model.addAttribute("notaDTO", notaService.buscarPorId(id));
        cargarDatosDeApoyo(model);
        return "notas/formulario";
    }

    @PostMapping("/guardar")
    public String guardar(@Valid @ModelAttribute NotaDTO notaDTO, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            cargarDatosDeApoyo(model);
            return "notas/formulario";
        }
        notaService.guardar(notaDTO);
        return "redirect:/notas";
    }

    @PostMapping("/{id}/eliminar")
    public String eliminar(@PathVariable Long id) {
        notaService.eliminar(id);
        return "redirect:/notas";
    }

    private void cargarDatosDeApoyo(Model model) {
        model.addAttribute("alumnos", alumnoRepository.findAll());
        model.addAttribute("materias", materiaRepository.findAll());
    }
}
