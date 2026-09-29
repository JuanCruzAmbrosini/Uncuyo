import { useState } from 'react';

// 1. Aquí está el componente que creamos
function InterruptorInteligente() {
  // Usamos useState para manejar el estado del interruptor y el contador de clics
  // UseState devuelve un array con dos elementos: el valor actual del estado y una función para actualizarlo
  const [encendido, setEncendido] = useState(false);
  const [clics, setClics] = useState(0);

  // Función para manejar el clic del interruptor
  const manejarClic = () => {
    setEncendido(!encendido);
    setClics(clics + 1);
  };

  // Renderizamos el estado actual del interruptor y el número de clics
  return (
    <div style={{ 
      padding: '20px', 
      backgroundColor: encendido ? '#fffacd' : '#e0e0e0',
      borderRadius: '8px',
      textAlign: 'center',
      marginTop: '20px'
    }}>
      <h2 style = {{
        color: 'black'
      }} >{encendido ? '💡 La luz está ENCENDIDA' : '🌑 La luz está APAGADA'}</h2>
      <p>Has tocado el interruptor <strong>{clics}</strong> veces.</p>
      <button onClick={manejarClic} style={{ padding: '10px' }}>
        {encendido ? 'Apagar' : 'Encender'}
      </button>
    </div>
  );
}

// 2. El componente App es el punto de entrada que muestra el interruptor
export default function App() {
  return (
    <div style={{ padding: '40px', fontFamily: 'sans-serif' }}>
      <h1>Probando los estados en React</h1>
      {/* Llamamos a nuestro componente aquí */}
      <InterruptorInteligente />
    </div>
  );
}