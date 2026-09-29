package com.tecnostock.service;

import com.tecnostock.model.Administrador;
import com.tecnostock.model.Usuario;
import com.tecnostock.repository.UsuarioRepository;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Implementacion de UserDetailsService, la interfaz que Spring Security
 * usa internamente para resolver el login por usuario y contraseña
 * (formulario de login.html -> POST /login, manejado automaticamente
 * por el filtro configurado en SecurityConfig).
 *
 * Aqui se traduce nuestra jerarquia de HERENCIA (Administrador/Empleado)
 * a un ROL de Spring Security ("ROLE_ADMIN" / "ROLE_EMPLEADO"), que luego
 * se usa en SecurityConfig y en las vistas (sec:authorize) para mostrar
 * u ocultar funcionalidades segun el tipo de usuario.
 */
@Service
public class UsuarioDetailsServiceImpl implements UserDetailsService {

    private final UsuarioRepository usuarioRepository;

    public UsuarioDetailsServiceImpl(UsuarioRepository usuarioRepository) {
        this.usuarioRepository = usuarioRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Usuario usuario = usuarioRepository.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("Usuario no encontrado: " + username));

        String rol = (usuario instanceof Administrador) ? "ROLE_ADMIN" : "ROLE_EMPLEADO";

        return new User(
                usuario.getUsername(),
                usuario.getPasswordHash(),
                usuario.isActivo(),          // enabled
                true, true, true,            // accountNonExpired, credentialsNonExpired, accountNonLocked
                List.of(new SimpleGrantedAuthority(rol))
        );
    }
}
