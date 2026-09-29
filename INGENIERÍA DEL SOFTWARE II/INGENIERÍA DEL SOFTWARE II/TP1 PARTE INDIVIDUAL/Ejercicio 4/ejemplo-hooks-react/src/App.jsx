import { useState, useEffect } from 'react';

export default function ContadorConTitulo() {
  // 1. useState: Creamos la memoria del componente
  // 'clics' es el valor actual, 'setClics' es la función para actualizarlo.
  const [clics, setClics] = useState(0);

  // 2. useEffect: Creamos un efecto secundario
  useEffect(() => {
    // Este código se ejecuta cuando el componente aparece por primera vez
    // Y también CADA VEZ que la variable 'clics' cambia.
    document.title = `Hiciste clic ${clics} veces`;
    
  }, [clics]); // <-- "Array de dependencias": le dice a React cuándo ejecutar el efecto.

  return (
    <div style={{ padding: '20px', textAlign: 'center', fontFamily: 'sans-serif' }}>
      <h2>Contador y Título</h2>
      <p>Mira la pestaña de arriba en tu navegador. Llevas {clics} clics.</p>
      
      {/* Al hacer clic, actualizamos el estado, lo que dispara el useEffect */}
      <button 
        onClick={() => setClics(clics + 1)}
        style={{ padding: '10px 20px', cursor: 'pointer' }}
      >
        Sumar clic
      </button>
    </div>
  );
}