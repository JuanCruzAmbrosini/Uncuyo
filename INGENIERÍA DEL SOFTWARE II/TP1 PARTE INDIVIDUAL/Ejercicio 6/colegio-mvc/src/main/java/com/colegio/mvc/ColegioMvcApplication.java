package com.colegio.mvc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Punto de entrada de la aplicacion Spring Boot.
 * Arranca el contenedor embebido (Tomcat), el contexto de Spring con las 4 capas
 * de la arquitectura MVC ampliada que usamos en este TP:
 *
 *   Vista (Thymeleaf)  <->  Controller  <->  Service (logica de negocio)  <->  Repository (JPA)  <->  MySQL
 *                                |                  |
 *                              DTO (entrada/salida)  Mapper (Entity <-> DTO)
 *
 * Los DTO evitan exponer las entidades JPA directamente a la vista o a la API,
 * lo cual protege el modelo de dominio de cambios en la capa de presentacion
 * y evita problemas de serializacion por relaciones lazy de Hibernate.
 */
@SpringBootApplication
public class ColegioMvcApplication {
    public static void main(String[] args) {
        SpringApplication.run(ColegioMvcApplication.class, args);
    }
}
