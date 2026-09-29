import React, { useState } from 'react';

function PerfilUsuario() {
  // 1. Lógica de JavaScript (Estado y variables)
  const [likes, setLikes] = useState(0);
  
  const usuario = {
    nombre: "Ana",
    rol: "Desarrolladora"
  };

  const manejarClick = () => {
    setLikes(likes + 1);
  };

  // 2. Estructura visual usando JSX
  return (
    <div className="tarjeta-perfil">
      
      {/* Incrustación de variables */}
      <h2>Perfil de {usuario.nombre}</h2>
      
      {/* Etiqueta de auto-cierre y uso de className */}
      <img src="avatar.jpg" alt="Avatar del usuario" className="avatar-img" />
      
      {/* Expresión lógica (operador condicional) dentro de JSX */}
      <p>Rol: {usuario.rol === "Desarrolladora" ? "💻 Dev" : "👤 Invitado"}</p>
      
      {/* Evento en camelCase */}
      <button onClick={manejarClick} className="btn-like">
        Dar Me gusta ({likes})
      </button>

    </div>
  );
}

export default PerfilUsuario;