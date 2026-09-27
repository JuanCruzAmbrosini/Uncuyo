package com.colegio.mvc.config;

import org.springframework.data.domain.AuditorAware;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.Optional;

/**
 * Le responde a Spring Data JPA la pregunta "quien esta haciendo este cambio?"
 * para completar los campos @CreatedBy / @LastModifiedBy de las entidades auditadas.
 *
 * Se apoya en el SecurityContext de Spring Security: si hay un docente logueado,
 * se audita con su email (su "username"). Si no hay sesion (por ejemplo, un
 * proceso interno o el arranque inicial de datos), se audita como "sistema".
 */
public class AuditorAwareImpl implements AuditorAware<String> {

    @Override
    public Optional<String> getCurrentAuditor() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null
                || !authentication.isAuthenticated()
                || "anonymousUser".equals(authentication.getPrincipal())) {
            return Optional.of("sistema");
        }
        return Optional.of(authentication.getName());
    }
}
