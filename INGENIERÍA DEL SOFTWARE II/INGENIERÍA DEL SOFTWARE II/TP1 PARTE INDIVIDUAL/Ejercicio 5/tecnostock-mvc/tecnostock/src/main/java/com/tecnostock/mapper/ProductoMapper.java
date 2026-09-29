package com.tecnostock.mapper;

import com.tecnostock.dto.ProductoDTO;
import com.tecnostock.model.Producto;
import com.tecnostock.model.ProductoDigital;
import com.tecnostock.model.ProductoFisico;
import org.springframework.stereotype.Component;

/**
 * Mapper: traduce entre el MODELO (entidad JPA, con relaciones y
 * herencia) y el DTO (estructura plana pensada para la Vista).
 *
 * Se implementa a mano (en lugar de MapStruct/ModelMapper) para que
 * quede explicito, con fines didacticos, como se "aplanan" los campos
 * de las subclases ProductoFisico/ProductoDigital en un unico ProductoDTO.
 */
@Component
public class ProductoMapper {

    public ProductoDTO toDTO(Producto producto) {
        ProductoDTO dto = new ProductoDTO();
        dto.setIdProducto(producto.getIdProducto());
        dto.setNombre(producto.getNombre());
        dto.setDescripcion(producto.getDescripcion());
        dto.setPrecio(producto.getPrecio());
        dto.setStock(producto.getStock());
        dto.setStockMinimo(producto.getStockMinimo());
        dto.setNombreCategoria(producto.getCategoria().getNombre());
        dto.setStockBajoMinimo(producto.estaEnStockBajoMinimo());
        dto.setTipoProducto(producto instanceof ProductoFisico ? "FISICO" : "DIGITAL");
        return dto;
    }
}
