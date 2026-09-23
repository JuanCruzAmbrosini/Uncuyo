package com.tecnostock.repository;

import com.tecnostock.model.Producto;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Repositorio ORM (Spring Data JPA).
 *
 * Al extender JpaRepository<Producto, Long> obtenemos automaticamente,
 * sin escribir SQL, los metodos: findAll(), findById(id), save(entity),
 * deleteById(id), existsById(id), count(), etc. Hibernate traduce estas
 * llamadas a SQL contra MySQL usando el mapeo de anotaciones @Entity
 * definido en Producto/ProductoFisico/ProductoDigital.
 *
 * Al ser Producto una jerarquia SINGLE_TABLE, findAll() devuelve
 * instancias reales de ProductoFisico o ProductoDigital segun la
 * columna discriminadora "tipo_producto".
 */
public interface ProductoRepository extends JpaRepository<Producto, Long> {
}
