import React, { createContext, useContext, useState } from 'react';

// 1. CREACIÓN DEL CONTEXTO (El sistema de altavoces)
// Creamos la "tubería" por donde viajará la información.
const TemaContext = createContext();

// --- COMPONENTE RAÍZ (El Gerente) ---
export default function App() {
  const [tema, setTema] = useState('oscuro');

  return (
    // 2. EL PROVEEDOR (Provider)
    // Envuelve a los componentes y "transmite" el valor actual del tema al aire.
    <TemaContext.Provider value={tema}>
      <div style={{ padding: '20px', fontFamily: 'sans-serif' }}>
        <h1>Ejemplo de Contexto vs Props</h1>
        
        <button onClick={() => setTema(tema === 'claro' ? 'oscuro' : 'claro')}>
          Cambiar Tema Global
        </button>

        {/* Llamamos al hijo. ¡OJO! NO le estamos pasando ninguna prop (ej: tema={tema}) */}
        <ComponenteIntermedio />
      </div>
    </TemaContext.Provider>
  );
}

// --- COMPONENTE INTERMEDIO (El Secretario) ---
// Este componente está en el medio, pero NO le importa el tema.
function ComponenteIntermedio() {
  return (
    <div style={{ border: '2px dashed gray', padding: '20px', marginTop: '20px' }}>
      <h2>Soy el Componente Intermedio</h2>
      <p>No recibí ninguna "prop" sobre el tema, solo estoy haciendo de puente.</p>
      
      {/* Llama al componente final */}
      <ComponenteFinal />
    </div>
  );
}

// --- COMPONENTE FINAL (El de Mantenimiento en el sótano) ---
function ComponenteFinal() {
  // 3. EL CONSUMIDOR (useContext)
  // Se conecta directamente al contexto y extrae el valor ignorando a los intermediarios.
  const temaActual = useContext(TemaContext);

  // Aplicamos estilos dependiendo de lo que escuchamos en el contexto
  const estilos = {
    backgroundColor: temaActual === 'oscuro' ? '#333' : '#FFF',
    color: temaActual === 'oscuro' ? '#FFF' : '#333',
    padding: '20px',
    borderRadius: '8px',
    marginTop: '20px',
    transition: 'all 0.3s ease'
  };

  return (
    <div style={estilos}>
      <h3>Soy el Componente Final</h3>
      <p>Escuché directamente por el altavoz que el tema es: <strong>{temaActual}</strong></p>
    </div>
  );
}