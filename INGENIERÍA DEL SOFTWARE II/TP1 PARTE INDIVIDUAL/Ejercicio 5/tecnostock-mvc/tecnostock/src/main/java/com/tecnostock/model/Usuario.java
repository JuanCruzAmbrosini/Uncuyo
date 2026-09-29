package com.tecnostock.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * MODELO (capa M de MVC) - Entidad JPA.
 *
 * Usuario es la clase BASE de una jerarquia de HERENCIA:
 *      Usuario  <|--  Administrador
 *      Usuario  <|--  Empleado
 *
 * Se usa para resolver el requerimiento de login (usuario y contraseña) y para
 * distinguir permisos: un Administrador gestiona el sistema completo, un Empleado
 * opera el dia a dia (AMB de productos, ordenes de compra, etc).
 *
 * Estrategia de herencia elegida: JOINED
 *   -> Se crea una tabla "usuario" con los campos comunes, y una tabla por cada
 *      subclase (administrador / empleado) con sus campos especificos, enlazadas
 *      por clave foranea (id compartido). Es la estrategia mas normalizada
 *      (evita columnas nulas) y la mas usada academicamente para representar
 *      herencia en un modelo relacional.
 */
@Entity
@Table(name = "usuario")
@Inheritance(strategy = InheritanceType.JOINED)
@Getter
@Setter
@NoArgsConstructor
public abstract class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idUsuario;

    @Column(nullable = false, unique = true, length = 60)
    private String username;

    /**
     * Nunca se persiste la contraseña en texto plano: se guarda el hash
     * generado por BCryptPasswordEncoder (ver SecurityConfig).
     */
    @Column(nullable = false, length = 100)
    private String passwordHash;

    @Column(nullable = false, length = 100)
    private String email;

    @Column(nullable = false)
    private boolean activo = true;

    public void desactivar() {
        this.activo = false;
    }
}
