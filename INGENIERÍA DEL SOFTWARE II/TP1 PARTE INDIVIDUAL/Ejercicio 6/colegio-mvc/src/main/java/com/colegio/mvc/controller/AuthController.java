package com.colegio.mvc.controller;

import com.colegio.mvc.dto.CambioPasswordDTO;
import com.colegio.mvc.dto.DocenteRegistroDTO;
import com.colegio.mvc.repository.DepartamentoRepository;
import com.colegio.mvc.service.DocenteService;
import jakarta.validation.Valid;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

/**
 * Controller (capa MVC) para: pantalla de login, registro de docentes y
 * cambio de contrasena. Nunca contiene logica de negocio: delega todo en
 * DocenteService y solo se encarga de mapear peticion HTTP <-> vista Thymeleaf.
 */
@Controller
public class AuthController {

    private final DocenteService docenteService;
    private final DepartamentoRepository departamentoRepository;

    public AuthController(DocenteService docenteService, DepartamentoRepository departamentoRepository) {
        this.docenteService = docenteService;
        this.departamentoRepository = departamentoRepository;
    }

    @GetMapping("/login")
    public String login() {
        return "login"; // templates/login.html
    }

    @GetMapping("/registro")
    public String formularioRegistro(Model model) {
        model.addAttribute("docenteRegistroDTO", new DocenteRegistroDTO());
        model.addAttribute("departamentos", departamentoRepository.findAll());
        return "docentes/registro";
    }

    @PostMapping("/registro")
    public String procesarRegistro(@Valid @ModelAttribute DocenteRegistroDTO docenteRegistroDTO,
                                    BindingResult bindingResult,
                                    Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("departamentos", departamentoRepository.findAll());
            return "docentes/registro";
        }
        try {
            docenteService.registrar(docenteRegistroDTO);
        } catch (IllegalArgumentException ex) {
            model.addAttribute("errorNegocio", ex.getMessage());
            model.addAttribute("departamentos", departamentoRepository.findAll());
            return "docentes/registro";
        }
        return "redirect:/login?registroExitoso";
    }

    @GetMapping("/cambiar-password")
    public String formularioCambiarPassword(Model model) {
        model.addAttribute("cambioPasswordDTO", new CambioPasswordDTO());
        return "docentes/cambiar-password";
    }

    @PostMapping("/cambiar-password")
    public String procesarCambioPassword(@Valid @ModelAttribute CambioPasswordDTO cambioPasswordDTO,
                                          BindingResult bindingResult,
                                          Authentication authentication,
                                          Model model) {
        if (bindingResult.hasErrors()) {
            return "docentes/cambiar-password";
        }
        try {
            // authentication.getName() es el email del docente logueado (username en Spring Security)
            docenteService.cambiarPassword(authentication.getName(), cambioPasswordDTO);
            model.addAttribute("exito", "Contrasena actualizada correctamente");
        } catch (IllegalArgumentException ex) {
            model.addAttribute("errorNegocio", ex.getMessage());
        }
        return "docentes/cambiar-password";
    }
}
