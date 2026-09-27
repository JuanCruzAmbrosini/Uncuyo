package com.colegio.mvc.controller;

import com.colegio.mvc.dto.MateriaDTO;
import com.colegio.mvc.repository.DocenteRepository;
import com.colegio.mvc.service.MateriaService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/materias")
public class MateriaController {

    private final MateriaService materiaService;
    private final DocenteRepository docenteRepository;

    public MateriaController(MateriaService materiaService, DocenteRepository docenteRepository) {
        this.materiaService = materiaService;
        this.docenteRepository = docenteRepository;
    }

    @GetMapping
    public String listar(Model model) {
        model.addAttribute("materias", materiaService.listarTodas());
        return "materias/lista";
    }

    @GetMapping("/nuevo")
    public String nuevo(Model model) {
        model.addAttribute("materiaDTO", new MateriaDTO());
        model.addAttribute("docentes", docenteRepository.findAll());
        return "materias/formulario";
    }

    @GetMapping("/{id}/editar")
    public String editar(@PathVariable Long id, Model model) {
        model.addAttribute("materiaDTO", materiaService.buscarPorId(id));
        model.addAttribute("docentes", docenteRepository.findAll());
        return "materias/formulario";
    }

    @PostMapping("/guardar")
    public String guardar(@Valid @ModelAttribute MateriaDTO materiaDTO, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("docentes", docenteRepository.findAll());
            return "materias/formulario";
        }
        materiaService.guardar(materiaDTO);
        return "redirect:/materias";
    }

    @PostMapping("/{id}/eliminar")
    public String eliminar(@PathVariable Long id) {
        materiaService.eliminar(id);
        return "redirect:/materias";
    }
}
