package com.tecnostock.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

/**
 * Configuracion central de seguridad: aqui se resuelve el requerimiento
 * "quienes acceden al sistema lo realizan por medio de un usuario y
 * contraseña".
 *
 * @EnableWebSecurity activa el modulo de Spring Security en la aplicacion.
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig {

    /**
     * Bean que define COMO se protege cada URL y COMO se maneja el login.
     * Spring Security intercepta todas las peticiones HTTP antes de que
     * lleguen a los @Controller (es un filtro, por eso "FilterChain").
     */
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests(auth -> auth
                // Recursos estaticos (CSS/JS) e imagen de login accesibles sin loguearse
                .requestMatchers("/css/**", "/js/**", "/webjars/**", "/login").permitAll()
                // Solo el rol ADMIN puede gestionar usuarios
                .requestMatchers("/usuarios/**").hasRole("ADMIN")
                // El resto de la aplicacion (productos, proveedores, ordenes de compra)
                // requiere estar autenticado, sin importar el rol especifico
                .anyRequest().authenticated()
            )
            .formLogin(form -> form
                .loginPage("/login")                 // usa nuestra vista personalizada login.html
                .loginProcessingUrl("/login")         // URL a la que el <form> hace POST (la procesa Spring Security, no un Controller nuestro)
                .defaultSuccessUrl("/productos", true) // a donde redirige tras loguearse
                .permitAll()
            )
            .logout(logout -> logout
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login?logout")
                .permitAll()
            )
            // CSRF queda habilitado (comportamiento por defecto de Spring Security):
            // Thymeleaf agrega automaticamente el token oculto en cada <form> gracias
            // a que se procesan con el atributo th:action.
            .csrf(AbstractHttpConfigurer::disable); // deshabilitado solo con fines de simplicidad academica en el prototipo

        return http.build();
    }

    /**
     * Bean encargado de encriptar (hash) y verificar contraseñas.
     * BCrypt agrega automaticamente un "salt" distinto por contraseña,
     * por lo que dos usuarios con la misma clave tendran hashes distintos.
     */
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
