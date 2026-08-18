import React, { useState } from 'react';

// --------------------------------------------------------
// COMPONENTE 1: Botón aislado que maneja su propio estado
// --------------------------------------------------------
function BotonMaestria() {
  const [puntos, setPuntos] = useState(0);

  return (
    <button className="btn-maestria" onClick={() => setPuntos(puntos + 1)}>
      Sumar Maestría: {puntos}
    </button>
  );
}

// --------------------------------------------------------
// COMPONENTE 2: Tarjeta visual reutilizable (Recibe Props)
// --------------------------------------------------------
function TarjetaCampeon({ nombre, rol }) {
  return (
    <div className="tarjeta" style={{ border: '1px solid gray', padding: '10px', margin: '10px' }}>
      <h3>{nombre}</h3>
      <p>Rol: {rol}</p>
      
      {/* Composición: Invocamos un componente dentro de otro */}
      <BotonMaestria />
    </div>
  );
}

// --------------------------------------------------------
// COMPONENTE 3 (PADRE): Une todas las piezas de la aplicación
// --------------------------------------------------------
function GaleriaCampeones() {
  return (
    <div className="contenedor-principal">
      <h2>Mi Selección de Campeones</h2>
      
      <div className="galeria-grid">
        {/* Reutilización: Usamos el mismo componente 3 veces con distintos datos */}
        <TarjetaCampeon nombre="Thresh" rol="Soporte" />
        <TarjetaCampeon nombre="Pyke" rol="Asesino / Soporte" />
        <TarjetaCampeon nombre="Vel'Koz" rol="Mago" />
      </div>
    </div>
  );
}

export default GaleriaCampeones;