package com.colegio.mvc.repository;

import com.colegio.mvc.model.Colegio;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ColegioRepository extends JpaRepository<Colegio, Long> {
}
