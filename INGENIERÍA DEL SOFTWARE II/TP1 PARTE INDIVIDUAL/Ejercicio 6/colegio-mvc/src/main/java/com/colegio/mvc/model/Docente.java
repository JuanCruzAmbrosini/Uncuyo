package com.colegio.mvc.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Docente HEREDA de Persona (Herencia) e implementa UserDetails: es la entidad
 * que Spring Security usa para autenticar. El "username" es el correo personal
 * del docente (campo email, unico); la contrasena se guarda hasheada (BCrypt).
 *
 * Relaciones:
 *  - AGREGACION con Departamento: el docente pertenece a un departamento, pero
 *    puede existir sin uno asignado (recien contratado) y el departamento
 *    sigue existiendo si se le quitan todos sus docentes.
 *  - ASOCIACION con Materia: un docente dicta 0..N materias; Materia y Docente
 *    existen cada uno de forma independiente del otro.
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "docentes")
@PrimaryKeyJoinColumn(name = "persona_id")
public class Docente extends Persona implements UserDetails {

    @Column(nullable = false, unique = true, length = 150)
    private String email;

    @Column(nullable = false)
    private String password; // hash BCrypt, nunca texto plano

    // --- AGREGACION (Departamento agrupa Docentes) ---
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "departamento_id")
    private Departamento departamento;

    // --- ASOCIACION (Docente dicta Materias) ---
    @OneToMany(mappedBy = "docente")
    private List<Materia> materiasQueDicta = new ArrayList<>();

    // ---------- Metodos requeridos por UserDetails (integracion con Spring Security) ----------

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority("ROLE_DOCENTE"));
    }

    @Override
    public String getUsername() {
        return email; // el docente inicia sesion con su correo personal
    }

    @Override
    public boolean isAccountNonExpired() { return true; }

    @Override
    public boolean isAccountNonLocked() { return true; }

    @Override
    public boolean isCredentialsNonExpired() { return true; }

    @Override
    public boolean isEnabled() { return true; }
}
