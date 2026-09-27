package com.colegio.mvc.service.impl;

import com.colegio.mvc.dto.CambioPasswordDTO;
import com.colegio.mvc.dto.DocenteDTO;
import com.colegio.mvc.dto.DocenteRegistroDTO;
import com.colegio.mvc.mapper.DocenteMapper;
import com.colegio.mvc.model.Docente;
import com.colegio.mvc.repository.DepartamentoRepository;
import com.colegio.mvc.repository.DocenteRepository;
import com.colegio.mvc.service.EmailService;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Logica de negocio del registro/autenticacion de docentes.
 *
 * Flujo de registro (POST /registro):
 *   1) Validar el DTO (Bean Validation, ver DocenteRegistroDTO) en el Controller.
 *   2) Verificar que el email no este ya registrado.
 *   3) Hashear la contrasena con BCrypt (PasswordEncoder) ANTES de persistir.
 *   4) Guardar el Docente (dispara auditoria: fechaCreacion/creadoPor).
 *   5) Enviar el correo de bienvenida (EmailService), requisito explicito del enunciado.
 *
 * Flujo de cambio de contrasena:
 *   1) Verificar que "passwordActual" matchee con la almacenada (encoder.matches).
 *   2) Verificar que "passwordNueva" == "passwordConfirmacion".
 *   3) Hashear y guardar la nueva contrasena.
 */
@Service
@Transactional
public class DocenteServiceImpl implements com.colegio.mvc.service.DocenteService {

    private final DocenteRepository docenteRepository;
    private final DepartamentoRepository departamentoRepository;
    private final PasswordEncoder passwordEncoder;
    private final EmailService emailService;

    public DocenteServiceImpl(DocenteRepository docenteRepository,
                               DepartamentoRepository departamentoRepository,
                               PasswordEncoder passwordEncoder,
                               EmailService emailService) {
        this.docenteRepository = docenteRepository;
        this.departamentoRepository = departamentoRepository;
        this.passwordEncoder = passwordEncoder;
        this.emailService = emailService;
    }

    @Override
    @Transactional(readOnly = true)
    public List<DocenteDTO> listarTodos() {
        return docenteRepository.findAll().stream().map(DocenteMapper::toDTO).toList();
    }

    @Override
    public DocenteDTO registrar(DocenteRegistroDTO dto) {
        if (docenteRepository.existsByEmail(dto.getEmail())) {
            throw new IllegalArgumentException("Ya existe un docente registrado con ese correo");
        }

        Docente docente = new Docente();
        docente.setNombre(dto.getNombre());
        docente.setApellido(dto.getApellido());
        docente.setSexo(dto.getSexo());
        docente.setFechaNacimiento(dto.getFechaNacimiento());
        docente.setEmail(dto.getEmail());
        docente.setPassword(passwordEncoder.encode(dto.getPassword())); // NUNCA texto plano

        if (dto.getDepartamentoId() != null) {
            docente.setDepartamento(departamentoRepository.findById(dto.getDepartamentoId()).orElse(null));
        }

        Docente guardado = docenteRepository.save(docente);

        // Requisito del enunciado: correo de bienvenida al registrarse
        emailService.enviarCorreoBienvenida(guardado.getEmail(), guardado.getNombre() + " " + guardado.getApellido());

        return DocenteMapper.toDTO(guardado);
    }

    @Override
    public void cambiarPassword(String emailDocenteLogueado, CambioPasswordDTO dto) {
        Docente docente = docenteRepository.findByEmail(emailDocenteLogueado)
                .orElseThrow(() -> new EntityNotFoundException("Docente no encontrado"));

        if (!passwordEncoder.matches(dto.getPasswordActual(), docente.getPassword())) {
            throw new IllegalArgumentException("La contrasena actual es incorrecta");
        }
        if (!dto.getPasswordNueva().equals(dto.getPasswordConfirmacion())) {
            throw new IllegalArgumentException("La confirmacion no coincide con la nueva contrasena");
        }

        docente.setPassword(passwordEncoder.encode(dto.getPasswordNueva()));
        docenteRepository.save(docente);
    }
}
