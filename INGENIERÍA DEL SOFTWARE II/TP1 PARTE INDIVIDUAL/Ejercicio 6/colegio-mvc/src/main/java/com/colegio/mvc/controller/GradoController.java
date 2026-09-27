package com.colegio.mvc.controller;

import com.colegio.mvc.dto.GradoDTO;
import com.colegio.mvc.repository.AulaRepository;
import com.colegio.mvc.service.GradoService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/grados")
public class GradoController {

    private final GradoService gradoService;
    private final AulaRepository aulaRepository;

    public GradoController(GradoService gradoService, AulaRepository aulaRepository) {
        this.gradoService = gradoService;
        this.aulaRepository = aulaRepository;
    }

    @GetMapping
    public String listar(Model model) {
        model.addAttribute("grados", gradoService.listarTodos());
        return "grados/lista";
    }

    @GetMapping("/nuevo")
    public String nuevo(Model model) {
        model.addAttribute("gradoDTO", new GradoDTO());
        model.addAttribute("aulas", aulaRepository.findAll());
        return "grados/formulario";
    }

    @GetMapping("/{id}/editar")
    public String editar(@PathVariable Long id, Model model) {
        model.addAttribute("gradoDTO", gradoService.buscarPorId(id));
        model.addAttribute("aulas", aulaRepository.findAll());
        return "grados/formulario";
    }

    @PostMapping("/guardar")
    public String guardar(@Valid @ModelAttribute GradoDTO gradoDTO, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("aulas", aulaRepository.findAll());
            return "grados/formulario";
        }
        gradoService.guardar(gradoDTO);
        return "redirect:/grados";
    }

    @PostMapping("/{id}/eliminar")
    public String eliminar(@PathVariable Long id) {
        gradoService.eliminar(id);
        return "redirect:/grados";
    }
}
