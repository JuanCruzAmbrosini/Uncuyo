package com.colegio.mvc.controller;

import com.colegio.mvc.dto.AulaDTO;
import com.colegio.mvc.repository.ColegioRepository;
import com.colegio.mvc.service.AulaService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/aulas")
public class AulaController {

    private final AulaService aulaService;
    private final ColegioRepository colegioRepository;

    public AulaController(AulaService aulaService, ColegioRepository colegioRepository) {
        this.aulaService = aulaService;
        this.colegioRepository = colegioRepository;
    }

    @GetMapping
    public String listar(Model model) {
        model.addAttribute("aulas", aulaService.listarTodas());
        return "aulas/lista";
    }

    @GetMapping("/nuevo")
    public String nuevo(Model model) {
        model.addAttribute("aulaDTO", new AulaDTO());
        model.addAttribute("colegios", colegioRepository.findAll());
        return "aulas/formulario";
    }

    @PostMapping("/guardar")
    public String guardar(@Valid @ModelAttribute AulaDTO aulaDTO, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("colegios", colegioRepository.findAll());
            return "aulas/formulario";
        }
        aulaService.guardar(aulaDTO);
        return "redirect:/aulas";
    }

    @PostMapping("/{id}/eliminar")
    public String eliminar(@PathVariable Long id) {
        aulaService.eliminar(id);
        return "redirect:/aulas";
    }
}
