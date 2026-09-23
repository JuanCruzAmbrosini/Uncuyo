package com.tecnostock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Sirve la vista de login personalizada (templates/login.html).
 *
 * Es necesario declarar este mapeo explicitamente: al configurar
 * formLogin().loginPage("/login") en SecurityConfig, Spring Security
 * DESACTIVA la pagina de login autogenerada por defecto y espera que
 * la aplicacion provea su propia vista para GET /login. Sin este
 * Controller, la ruta /login queda sin ningun @GetMapping que la
 * resuelva (aunque la seguridad la deje pasar con permitAll()).
 */
@Controller
public class LoginController {

    @GetMapping("/login")
    public String mostrarLogin() {
        return "login"; // resuelve a templates/login.html
    }
}
