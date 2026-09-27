package com.colegio.mvc.service.impl;

import com.colegio.mvc.dto.AlumnoDTO;
import com.colegio.mvc.mapper.AlumnoMapper;
import com.colegio.mvc.model.Alumno;
import com.colegio.mvc.model.Grado;
import com.colegio.mvc.repository.AlumnoRepository;
import com.colegio.mvc.repository.GradoRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Capa de SERVICIO: aca vive la logica de negocio, orquestando repositorios
 * y mappers. El Controller nunca habla directo con el Repository ni con las
 * entidades JPA: solo intercambia DTOs con el Service.
 */
@Service
@Transactional
public class AlumnoServiceImpl implements com.colegio.mvc.service.AlumnoService {

    private final AlumnoRepository alumnoRepository;
    private final GradoRepository gradoRepository;

    public AlumnoServiceImpl(AlumnoRepository alumnoRepository, GradoRepository gradoRepository) {
        this.alumnoRepository = alumnoRepository;
        this.gradoRepository = gradoRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public List<AlumnoDTO> listarTodos() {
        return alumnoRepository.findAll().stream().map(AlumnoMapper::toDTO).toList();
    }

    @Override
    @Transactional(readOnly = true)
    public AlumnoDTO buscarPorId(Long id) {
        Alumno alumno = alumnoRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Alumno no encontrado: " + id));
        return AlumnoMapper.toDTO(alumno);
    }

    @Override
    public AlumnoDTO guardar(AlumnoDTO dto) {
        Alumno alumno = (dto.getId() != null)
                ? alumnoRepository.findById(dto.getId()).orElse(new Alumno())
                : new Alumno();

        Grado grado = (dto.getGradoId() != null)
                ? gradoRepository.findById(dto.getGradoId()).orElse(null)
                : null;

        AlumnoMapper.copyToEntity(dto, alumno, grado);
        return AlumnoMapper.toDTO(alumnoRepository.save(alumno));
    }

    @Override
    public void eliminar(Long id) {
        alumnoRepository.deleteById(id);
    }
}
