import React from 'react';

// --------------------------------------------------------
// COMPONENTE HIJO: Recibe las props y las muestra
// --------------------------------------------------------
// Usamos "desestructuración" ({ nombre, precio, enStock }) para no tener 
// que escribir "props.nombre", "props.precio" todo el tiempo.
function TarjetaProducto({ nombre, precio, enStock }) {
  return (
    <div className="tarjeta-producto" style={{ border: '1px solid #ccc', padding: '15px', margin: '10px' }}>
      <h3>{nombre}</h3>
      <p>Precio: ${precio}</p>
      
      {/* Usamos un booleano recibido por props para cambiar la interfaz */}
      {enStock ? (
        <span style={{ color: 'green' }}> Disponible</span>
      ) : (
        <span style={{ color: 'red' }}> Agotado</span>
      )}
    </div>
  );
}

// --------------------------------------------------------
// COMPONENTE PADRE: Define la información y se la pasa al hijo
// --------------------------------------------------------
function Catalogo() {
  return (
    <div>
      <h2>Catálogo de Productos</h2>
      
      <div style={{ display: 'flex' }}>
        {/* Invocamos al componente hijo pasándole las props personalizadas */}
        <TarjetaProducto 
          nombre="Teclado Mecánico" 
          precio={120} 
          enStock={true} 
        />
        
        <TarjetaProducto 
          nombre="Mouse Inalámbrico" 
          precio={45} 
          enStock={true} 
        />
        
        <TarjetaProducto 
          nombre="Monitor 24 pulgadas" 
          precio={250} 
          enStock={false} 
        />
      </div>
    </div>
  );
}

export default Catalogo;