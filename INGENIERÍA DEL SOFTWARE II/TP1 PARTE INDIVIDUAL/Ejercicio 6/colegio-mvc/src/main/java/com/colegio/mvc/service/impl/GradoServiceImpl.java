package com.colegio.mvc.service.impl;

import com.colegio.mvc.dto.GradoDTO;
import com.colegio.mvc.mapper.GradoMapper;
import com.colegio.mvc.model.Aula;
import com.colegio.mvc.model.Grado;
import com.colegio.mvc.repository.AulaRepository;
import com.colegio.mvc.repository.GradoRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class GradoServiceImpl implements com.colegio.mvc.service.GradoService {

    private final GradoRepository gradoRepository;
    private final AulaRepository aulaRepository;

    public GradoServiceImpl(GradoRepository gradoRepository, AulaRepository aulaRepository) {
        this.gradoRepository = gradoRepository;
        this.aulaRepository = aulaRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public List<GradoDTO> listarTodos() {
        return gradoRepository.findAll().stream().map(GradoMapper::toDTO).toList();
    }

    @Override
    @Transactional(readOnly = true)
    public GradoDTO buscarPorId(Long id) {
        Grado grado = gradoRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Grado no encontrado: " + id));
        return GradoMapper.toDTO(grado);
    }

    @Override
    public GradoDTO guardar(GradoDTO dto) {
        Grado grado = (dto.getId() != null)
                ? gradoRepository.findById(dto.getId()).orElse(new Grado())
                : new Grado();

        Aula aula = (dto.getAulaId() != null) ? aulaRepository.findById(dto.getAulaId()).orElse(null) : null;

        GradoMapper.copyToEntity(dto, grado, aula);
        return GradoMapper.toDTO(gradoRepository.save(grado));
    }

    @Override
    public void eliminar(Long id) {
        gradoRepository.deleteById(id);
    }
}
