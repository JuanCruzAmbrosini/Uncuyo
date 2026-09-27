package com.colegio.mvc.security;

import com.colegio.mvc.repository.DocenteRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * Puente entre Spring Security y nuestro modelo de dominio: cuando alguien
 * intenta loguearse, Spring Security llama a loadUserByUsername(email) y
 * este servicio busca al Docente en la base (via DocenteRepository) y lo
 * devuelve tal cual, ya que la entidad Docente implementa UserDetails.
 */
@Service
public class DocenteUserDetailsService implements UserDetailsService {

    private final DocenteRepository docenteRepository;

    public DocenteUserDetailsService(DocenteRepository docenteRepository) {
        this.docenteRepository = docenteRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        return docenteRepository.findByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException("No existe un docente con el correo: " + email));
    }
}
