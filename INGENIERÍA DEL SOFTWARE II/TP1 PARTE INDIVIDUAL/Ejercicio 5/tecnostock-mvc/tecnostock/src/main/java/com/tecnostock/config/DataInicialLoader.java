package com.tecnostock.config;

import com.tecnostock.model.Administrador;
import com.tecnostock.model.Categoria;
import com.tecnostock.repository.CategoriaRepository;
import com.tecnostock.repository.UsuarioRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * CommandLineRunner: Spring Boot ejecuta el metodo run(...) de este Bean
 * una sola vez, apenas termina de levantar el contexto de la aplicacion.
 * Se usa aqui para sembrar (seed) un usuario Administrador inicial
 * (sin el cual nadie podria loguearse la primera vez) y categorias base.
 *
 * En un proyecto real esto se reemplazaria por un script data.sql o una
 * migracion Flyway/Liquibase; se deja como CommandLineRunner por
 * simplicidad didactica.
 */
@Configuration
public class DataInicialLoader {

    @Bean
    CommandLineRunner cargarDatosIniciales(UsuarioRepository usuarioRepository,
                                            CategoriaRepository categoriaRepository,
                                            PasswordEncoder passwordEncoder) {
        return args -> {
            if (usuarioRepository.count() == 0) {
                Administrador admin = new Administrador();
                admin.setUsername("admin");
                admin.setEmail("admin@tecnostock.com");
                // La contraseña en texto plano "admin123" NUNCA se persiste:
                // se guarda su hash BCrypt generado por el PasswordEncoder
                // configurado en SecurityConfig.
                admin.setPasswordHash(passwordEncoder.encode("admin123"));
                admin.setNivelAcceso(1);
                usuarioRepository.save(admin);
            }

            if (categoriaRepository.count() == 0) {
                categoriaRepository.save(crearCategoria("Notebooks", "Equipos portatiles"));
                categoriaRepository.save(crearCategoria("Perifericos", "Mouse, teclados, auriculares"));
                categoriaRepository.save(crearCategoria("Software", "Licencias y aplicaciones"));
            }
        };
    }

    private Categoria crearCategoria(String nombre, String descripcion) {
        Categoria c = new Categoria();
        c.setNombre(nombre);
        c.setDescripcion(descripcion);
        return c;
    }
}
