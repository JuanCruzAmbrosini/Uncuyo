package com.tecnostock;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Clase de arranque de la aplicacion.
 *
 * @SpringBootApplication es una anotacion "combo" que agrupa:
 *   - @Configuration      -> esta clase puede definir Beans de configuracion
 *   - @EnableAutoConfiguration -> Spring Boot configura automaticamente Tomcat, Hibernate,
 *                                 Thymeleaf, Security, etc. en base a las dependencias del pom.xml
 *   - @ComponentScan      -> escanea el paquete com.tecnostock y subpaquetes (model, dto,
 *                             repository, service, controller, config) buscando componentes
 *                             anotados (@Controller, @Service, @Repository, @Configuration...)
 */
@SpringBootApplication
public class TecnoStockApplication {

    public static void main(String[] args) {
        SpringApplication.run(TecnoStockApplication.class, args);
    }
}
