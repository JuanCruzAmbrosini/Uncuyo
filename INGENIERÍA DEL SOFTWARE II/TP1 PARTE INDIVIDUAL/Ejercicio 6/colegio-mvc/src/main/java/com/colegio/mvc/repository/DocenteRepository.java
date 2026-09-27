package com.colegio.mvc.repository;

import com.colegio.mvc.model.Docente;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface DocenteRepository extends JpaRepository<Docente, Long> {
    /** Usado por Spring Security (DocenteUserDetailsService) para autenticar por email. */
    Optional<Docente> findByEmail(String email);

    boolean existsByEmail(String email);
}
