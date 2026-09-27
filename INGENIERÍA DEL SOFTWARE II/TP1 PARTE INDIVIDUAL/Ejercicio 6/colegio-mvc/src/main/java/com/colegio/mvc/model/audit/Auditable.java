package com.colegio.mvc.model.audit;

import jakarta.persistence.EntityListeners;
import jakarta.persistence.MappedSuperclass;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;

/**
 * Superclase de AUDITORIA. Toda entidad de negocio (Colegio, Departamento, Aula,
 * Grado, Materia, Nota, Club y, transitivamente via Persona, Alumno y Docente)
 * extiende de esta clase para heredar 4 columnas de trazabilidad:
 *
 *   - fechaCreacion / fechaModificacion: completadas por Spring Data JPA (@CreatedDate/@LastModifiedDate).
 *   - creadoPor / modificadoPor: completadas usando el AuditorAware (ver config/AuditorAwareImpl),
 *     que toma el email del docente autenticado desde el contexto de Spring Security.
 *
 * @MappedSuperclass: NO genera tabla propia, sus columnas se agregan a la tabla de cada subclase.
 * @EntityListeners(AuditingEntityListener.class): engancha el listener de Spring que dispara
 * el llenado automatico en los eventos JPA de prePersist/preUpdate.
 */
@Getter
@Setter
@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public abstract class Auditable {

    @CreatedDate
    private LocalDateTime fechaCreacion;

    @LastModifiedDate
    private LocalDateTime fechaModificacion;

    @CreatedBy
    private String creadoPor;

    @LastModifiedBy
    private String modificadoPor;
}
