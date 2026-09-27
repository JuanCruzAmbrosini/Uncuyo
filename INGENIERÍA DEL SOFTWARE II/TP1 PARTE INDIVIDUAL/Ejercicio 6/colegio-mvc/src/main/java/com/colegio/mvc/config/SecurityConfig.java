package com.colegio.mvc.config;

import com.colegio.mvc.security.DocenteUserDetailsService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

/**
 * Configuracion de seguridad de la aplicacion.
 *
 * Modelo de autenticacion:
 *  - El "usuario" es el DOCENTE, identificado por su correo personal (email = username).
 *  - La contrasena se guarda hasheada con BCrypt (nunca en texto plano).
 *  - DocenteUserDetailsService (capa "security") busca al docente por email
 *    a traves de DocenteRepository y lo adapta a la interfaz UserDetails que
 *    Spring Security entiende.
 *
 * Rutas publicas: login, registro de docentes, recursos estaticos.
 * Todo lo demas (gestion de alumnos, materias, notas, grados, aulas, cambio de
 * contrasena) requiere estar autenticado.
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider(UserDetailsService userDetailsService,
                                                              PasswordEncoder passwordEncoder) {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(userDetailsService);
        provider.setPasswordEncoder(passwordEncoder);
        return provider;
    }

    @Bean
    public UserDetailsService userDetailsService(DocenteUserDetailsService docenteUserDetailsService) {
        return docenteUserDetailsService;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests(auth -> auth
                .requestMatchers(
                        "/login", "/registro", "/registro/**",
                        "/css/**", "/js/**", "/webjars/**", "/img/**"
                ).permitAll()
                .anyRequest().authenticated()
            )
            .formLogin(form -> form
                .loginPage("/login")
                .usernameParameter("email")
                .defaultSuccessUrl("/alumnos", true)
                .permitAll()
            )
            .logout(logout -> logout
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login?logout")
                .permitAll()
            );
        return http.build();
    }
}
