import React, { useState } from 'react';
// 1. Importamos las herramientas específicas de React DOM
import { createRoot } from 'react-dom/client';
import { createPortal } from 'react-dom';

// --- COMPONENTE MODAL (Uso de Portales) ---
function Modal({ children, onClose }) {
  // Buscamos el contenedor secundario en el DOM real del navegador
  const nodoDestino = document.getElementById('modal-root');

  // React DOM toma este JSX y lo "teletransporta" al nodoDestino, 
  // fuera de la jerarquía principal de la aplicación.
  return createPortal(
    <div style={{
      position: 'fixed', top: '50px', left: '50px', 
      background: 'lightgray', padding: '20px', border: '1px solid black'
    }}>
      {children}
      {/* Evento sintético de React DOM */}
      <button onClick={onClose}>Cerrar</button>
    </div>,
    nodoDestino
  );
}

// --- COMPONENTE PRINCIPAL ---
function App() {
  const [mostrarModal, setMostrarModal] = useState(false);

  return (
    <div style={{ padding: '20px', border: '2px solid blue' }}>
      <h1>Ejemplo de React DOM</h1>
      <p>Esta caja azul está dentro del contenedor #root.</p>
      
      {/* Evento sintético onClick. React DOM lo gestiona de forma eficiente */}
      <button onClick={() => setMostrarModal(true)}>
        Abrir Ventana Modal
      </button>

      {/* Aunque el Modal está escrito "dentro" de App en React, 
          físicamente se dibujará fuera gracias al Portal */}
      {mostrarModal && (
        <Modal onClose={() => setMostrarModal(false)}>
          <h2>¡Hola desde el Portal!</h2>
          <p>Yo no estoy dentro de la caja azul en el HTML real.</p>
        </Modal>
      )}
    </div>
  );
}

// --- PUNTO DE ENTRADA DE REACT DOM (El Montaje) ---
// 1. Capturamos el contenedor principal
const contenedorPrincipal = document.getElementById('root');

// 2. Creamos la raíz con React DOM
const root = createRoot(contenedorPrincipal);

// 3. Traducimos nuestro componente <App /> al DOM real
root.render(<App />);