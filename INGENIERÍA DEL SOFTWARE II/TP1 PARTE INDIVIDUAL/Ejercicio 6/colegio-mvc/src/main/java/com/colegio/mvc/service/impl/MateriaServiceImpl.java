package com.colegio.mvc.service.impl;

import com.colegio.mvc.dto.MateriaDTO;
import com.colegio.mvc.mapper.MateriaMapper;
import com.colegio.mvc.model.Docente;
import com.colegio.mvc.model.Materia;
import com.colegio.mvc.repository.DocenteRepository;
import com.colegio.mvc.repository.MateriaRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MateriaServiceImpl implements com.colegio.mvc.service.MateriaService {

    private final MateriaRepository materiaRepository;
    private final DocenteRepository docenteRepository;

    public MateriaServiceImpl(MateriaRepository materiaRepository, DocenteRepository docenteRepository) {
        this.materiaRepository = materiaRepository;
        this.docenteRepository = docenteRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public List<MateriaDTO> listarTodas() {
        return materiaRepository.findAll().stream().map(MateriaMapper::toDTO).toList();
    }

    @Override
    @Transactional(readOnly = true)
    public MateriaDTO buscarPorId(Long id) {
        Materia materia = materiaRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Materia no encontrada: " + id));
        return MateriaMapper.toDTO(materia);
    }

    @Override
    public MateriaDTO guardar(MateriaDTO dto) {
        Materia materia = (dto.getId() != null)
                ? materiaRepository.findById(dto.getId()).orElse(new Materia())
                : new Materia();

        Docente docente = (dto.getDocenteId() != null)
                ? docenteRepository.findById(dto.getDocenteId()).orElse(null)
                : null;

        MateriaMapper.copyToEntity(dto, materia, docente);
        return MateriaMapper.toDTO(materiaRepository.save(materia));
    }

    @Override
    public void eliminar(Long id) {
        materiaRepository.deleteById(id);
    }
}
