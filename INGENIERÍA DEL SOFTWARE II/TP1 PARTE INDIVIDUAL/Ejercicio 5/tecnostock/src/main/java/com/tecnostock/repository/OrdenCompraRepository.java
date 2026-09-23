package com.tecnostock.repository;

import com.tecnostock.model.OrdenCompra;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Al guardar una OrdenCompra con save(), Hibernate persiste en cascada
 * (cascade = ALL definido en OrdenCompra.detalles) todos sus
 * DetalleOrdenCompra en una unica transaccion: esto materializa en
 * codigo la relacion de COMPOSICION del diagrama de clases.
 */
public interface OrdenCompraRepository extends JpaRepository<OrdenCompra, Long> {
}
