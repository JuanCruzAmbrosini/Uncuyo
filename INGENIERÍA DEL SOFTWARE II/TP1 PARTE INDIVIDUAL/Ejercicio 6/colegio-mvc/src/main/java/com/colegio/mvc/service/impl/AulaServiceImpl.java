package com.colegio.mvc.service.impl;

import com.colegio.mvc.dto.AulaDTO;
import com.colegio.mvc.mapper.AulaMapper;
import com.colegio.mvc.model.Aula;
import com.colegio.mvc.model.Colegio;
import com.colegio.mvc.repository.AulaRepository;
import com.colegio.mvc.repository.ColegioRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AulaServiceImpl implements com.colegio.mvc.service.AulaService {

    private final AulaRepository aulaRepository;
    private final ColegioRepository colegioRepository;

    public AulaServiceImpl(AulaRepository aulaRepository, ColegioRepository colegioRepository) {
        this.aulaRepository = aulaRepository;
        this.colegioRepository = colegioRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public List<AulaDTO> listarTodas() {
        return aulaRepository.findAll().stream().map(AulaMapper::toDTO).toList();
    }

    @Override
    public AulaDTO guardar(AulaDTO dto) {
        Aula aula = (dto.getId() != null)
                ? aulaRepository.findById(dto.getId()).orElse(new Aula())
                : new Aula();

        Colegio colegio = colegioRepository.findById(dto.getColegioId())
                .orElseThrow(() -> new EntityNotFoundException("Colegio no encontrado: " + dto.getColegioId()));

        AulaMapper.copyToEntity(dto, aula, colegio);
        return AulaMapper.toDTO(aulaRepository.save(aula));
    }

    @Override
    public void eliminar(Long id) {
        aulaRepository.deleteById(id);
    }
}
