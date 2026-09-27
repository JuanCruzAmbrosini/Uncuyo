package com.colegio.mvc.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

/**
 * Habilita la auditoria automatica de entidades de Spring Data JPA.
 * Con @EnableJpaAuditing, toda entidad que extienda de Auditable (ver model/audit/Auditable.java)
 * completa solita sus campos fechaCreacion / fechaModificacion / creadoPor / modificadoPor
 * en cada operacion de persistencia, sin que el desarrollador tenga que setearlos a mano.
 */
@Configuration
@EnableJpaAuditing(auditorAwareRef = "auditorProvider")
public class JpaAuditingConfig {

    @Bean
    public AuditorAware<String> auditorProvider() {
        return new AuditorAwareImpl();
    }
}
