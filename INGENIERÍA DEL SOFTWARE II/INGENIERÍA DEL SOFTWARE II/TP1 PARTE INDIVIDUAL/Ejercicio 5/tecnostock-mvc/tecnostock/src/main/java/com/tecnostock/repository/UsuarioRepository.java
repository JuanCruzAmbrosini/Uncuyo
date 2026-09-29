package com.tecnostock.repository;

import com.tecnostock.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

/**
 * Repositorio base de la jerarquia Usuario/Administrador/Empleado.
 * findByUsername(...) es usado por UsuarioDetailsServiceImpl para
 * resolver el login de Spring Security.
 */
public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
    Optional<Usuario> findByUsername(String username);
}
