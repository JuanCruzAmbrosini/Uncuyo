import React, { useState } from 'react';

export default function Saludo() {
  const [nombre, setNombre] = useState('');
  const [mensaje, setMensaje] = useState('');
  const [error, setError] = useState(false);

  const handleSubmit = (e) => {
    e.preventDefault();
    if (!nombre.trim()) {
      setError(true);
      setMensaje('');
      return;
    }
    setError(false);
    setMensaje(`¡Hola, ${nombre.trim()}!`);
  };

  return (
    <form onSubmit={handleSubmit} style={{ padding: '20px', fontFamily: 'sans-serif' }}>
      <h2>Generador de Saludo</h2>

      <div>
        <label htmlFor="input-nombre">Tu Nombre:</label>
        <input
          id="input-nombre"
          type="text"
          placeholder="Ingresa tu nombre"
          value={nombre}
          onChange={(e) => setNombre(e.target.value)}
        />
      </div>

      <button type="submit" style={{ marginTop: '10px' }}>
        Saludar
      </button>

      {/* Mensajes condicionales */}
      {error && <p role="alert" style={{ color: 'red' }}>El nombre es obligatorio</p>}
      {mensaje && <p>{mensaje}</p>}
    </form>
  );
}