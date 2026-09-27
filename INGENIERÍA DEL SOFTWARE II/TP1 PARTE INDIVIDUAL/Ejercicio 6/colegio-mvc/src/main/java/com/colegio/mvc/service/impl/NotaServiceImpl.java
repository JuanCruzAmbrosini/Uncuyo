package com.colegio.mvc.service.impl;

import com.colegio.mvc.dto.NotaDTO;
import com.colegio.mvc.mapper.NotaMapper;
import com.colegio.mvc.model.Alumno;
import com.colegio.mvc.model.Materia;
import com.colegio.mvc.model.Nota;
import com.colegio.mvc.repository.AlumnoRepository;
import com.colegio.mvc.repository.MateriaRepository;
import com.colegio.mvc.repository.NotaRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class NotaServiceImpl implements com.colegio.mvc.service.NotaService {

    private final NotaRepository notaRepository;
    private final AlumnoRepository alumnoRepository;
    private final MateriaRepository materiaRepository;

    public NotaServiceImpl(NotaRepository notaRepository, AlumnoRepository alumnoRepository,
                            MateriaRepository materiaRepository) {
        this.notaRepository = notaRepository;
        this.alumnoRepository = alumnoRepository;
        this.materiaRepository = materiaRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public List<NotaDTO> listarTodas() {
        return notaRepository.findAll().stream().map(NotaMapper::toDTO).toList();
    }

    @Override
    @Transactional(readOnly = true)
    public NotaDTO buscarPorId(Long id) {
        Nota nota = notaRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Nota no encontrada: " + id));
        return NotaMapper.toDTO(nota);
    }

    @Override
    public NotaDTO guardar(NotaDTO dto) {
        Nota nota = (dto.getId() != null)
                ? notaRepository.findById(dto.getId()).orElse(new Nota())
                : new Nota();

        Alumno alumno = alumnoRepository.findById(dto.getAlumnoId())
                .orElseThrow(() -> new EntityNotFoundException("Alumno no encontrado: " + dto.getAlumnoId()));
        Materia materia = materiaRepository.findById(dto.getMateriaId())
                .orElseThrow(() -> new EntityNotFoundException("Materia no encontrada: " + dto.getMateriaId()));

        NotaMapper.copyToEntity(dto, nota, alumno, materia);
        return NotaMapper.toDTO(notaRepository.save(nota));
    }

    @Override
    public void eliminar(Long id) {
        notaRepository.deleteById(id);
    }
}
