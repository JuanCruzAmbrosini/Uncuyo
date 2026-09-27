import React, { useState, useMemo } from 'react';

// 1. Simulamos una función que consume muchos recursos (ej. procesar miles de datos)
const calculoPesado = (numero) => {
  console.log('Procesando cálculo pesado...');
  for (let i = 0; i < 1000000000; i++) {} // Ciclo artificial para ralentizar la app
  return numero * 2;
};

export default function OptimizacionEjemplo() {
  // Estados independientes
  const [numero, setNumero] = useState(1);
  const [temaOscuro, setTemaOscuro] = useState(false);

  /* 
   * EL PROBLEMA (Sin useMemo):
   * Si usamos la línea de abajo, CADA VEZ que cambiemos el tema (temaOscuro),
   * React volverá a ejecutar 'calculoPesado', congelando la pantalla por un segundo.
   */
  // const resultado = calculoPesado(numero);

  /* 
   * LA SOLUCIÓN (Con useMemo):
   * React guarda el resultado en memoria. Solo volverá a ejecutar el ciclo 
   * destructivo de mil millones de vueltas si la variable 'numero' cambia.
   */
  const resultado = useMemo(() => {
    return calculoPesado(numero);
  }, [numero]); // <-- Arreglo de dependencias

  // Estilos dinámicos para el tema
  const estilosTema = {
    backgroundColor: temaOscuro ? '#333' : '#FFF',
    color: temaOscuro ? '#FFF' : '#333',
    padding: '20px',
    minHeight: '100vh'
  };

  return (
    <div style={estilosTema}>
      <h2>Ejemplo de useMemo</h2>
      
      {/* Acción rápida y ajena al cálculo */}
      <button onClick={() => setTemaOscuro(prev => !prev)}>
        Cambiar a Tema {temaOscuro ? 'Claro' : 'Oscuro'}
      </button>

      <div style={{ marginTop: '20px' }}>
        <label>Ingresa un número: </label>
        <input 
          type="number" 
          value={numero} 
          onChange={(e) => setNumero(parseInt(e.target.value) || 0)} 
        />
        <p>El resultado (procesado de forma pesada) es: <strong>{resultado}</strong></p>
      </div>
    </div>
  );
}