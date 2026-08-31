import { useState } from 'react';

export default function FormularioMensaje() {

  // Estado para almacenar el mensaje que el usuario está escribiendo
  const [mensaje, setMensaje] = useState('');
  const [mensajeEnviado, setMensajeEnviado] = useState('');

  // 1. Manejador para el evento de escritura (teclado)
  const manejarCambio = (e) => {
    // Leemos el valor exacto de lo que el usuario tipeó usando el objeto 'e'
    setMensaje(e.target.value);
  };

  // 2. Manejador para el evento de envío del formulario
  const manejarEnvio = (e) => {
    // ¡Crucial! Evita que el navegador recargue toda la página
    e.preventDefault(); 
    
    // Guardamos el mensaje final para mostrarlo en pantalla
    setMensajeEnviado(mensaje);
    
    // Limpiamos el campo de texto devolviéndolo a un texto vacío
    setMensaje(''); 
  };

  return (
    <div style={{ padding: '20px', fontFamily: 'sans-serif', border: '1px solid #ccc', borderRadius: '8px', maxWidth: '400px' }}>
      <h2>Enviar un mensaje</h2>
      
      {/* El evento onSubmit se asocia a la etiqueta <form> */}
      <form onSubmit={manejarEnvio}>
        <input
          type="text"
          value={mensaje}
          onChange={manejarCambio} // El evento onChange se asocia al <input>
          placeholder="Escribe aquí..."
          style={{ padding: '8px', marginRight: '10px', width: '60%' }}
        />
        <button type="submit" style={{ padding: '8px 16px', cursor: 'pointer' }}>
          Enviar
        </button>
      </form>

      {/* Solo mostramos este texto si hay un mensaje enviado */}
      {mensajeEnviado && (
        <p style={{ color: 'green', marginTop: '20px', backgroundColor: '#e6ffe6', padding: '10px', borderRadius: '4px' }}>
          ✅ Mensaje enviado: <strong>{mensajeEnviado}</strong>
        </p>
      )}
    </div>
  );
}