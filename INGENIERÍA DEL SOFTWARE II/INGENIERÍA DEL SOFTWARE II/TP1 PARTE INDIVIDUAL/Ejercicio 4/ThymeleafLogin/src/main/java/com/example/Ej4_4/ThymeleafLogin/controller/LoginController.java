package com.example.Ej4_4.ThymeleafLogin.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {

    //Base de datos lógica inventada
    private Map<String, String> usuarios = new HashMap<>();

    public LoginController() {
        usuarios.put("Juan Cruz", "1234");
        usuarios.put("Mateo", "java");
        usuarios.put("Pedro", "python");
        usuarios.put("Messi", "Goat");
    }

    //Login
    @GetMapping("/login")
    public String mostrarLogin(String username, String password) {
        return  "login";
    }

    //Inicio de sesión
    @PostMapping("/login")
    public String procesarLogin (@RequestParam String nombreUsuario,
                                 @RequestParam String password,
                                 HttpSession session,
                                 Model model) {
        //Validar que el usuario exista
        if (usuarios.containsKey(nombreUsuario)) {
            //Validar la contraseña
            String contrasnia = usuarios.get(nombreUsuario);
            if (contrasnia.equals(password)) {
                session.setAttribute("usuarioLogueado", nombreUsuario);
                return "redirect:/bienvenida";
            }
        }

        //Si no existe el usuario o si falla la contraseña
        model.addAttribute("Error", "Usuario o contraseña incorrectos");
        return "login";
    }

    //Página de bienvenida
    @GetMapping("/bienvenida")
    public String mostrarBienvenida(HttpSession session) {
        String usuario = (String) session.getAttribute("usuarioLogueado");

        if (usuario == null) {
            return "redirect:/login";
        }
        return "bienvenida";
    }

    //Cerrar sesión
    @GetMapping("/logout")
    public String cerrarSesion(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
