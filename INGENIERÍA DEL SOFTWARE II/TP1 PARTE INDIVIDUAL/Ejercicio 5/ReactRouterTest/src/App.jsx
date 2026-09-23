import React from 'react';
// 1. Importamos las herramientas de React Router
import { 
  BrowserRouter, Routes, Route, Link, Outlet, useParams, useNavigate 
} from 'react-router-dom';

// --- COMPONENTES DE VISTA (Páginas) ---

// Plantilla Maestra (Layout): Se encarga de mantener la navegación fija
function Plantilla() {
  return (
    <div style={{ padding: '20px', fontFamily: 'sans-serif' }}>
      <nav style={{ marginBottom: '20px', paddingBottom: '10px', borderBottom: '2px solid #ccc' }}>
        {/* Usamos <Link> en lugar de la etiqueta <a> de HTML para no recargar la página */}
        <Link to="/" style={{ marginRight: '15px' }}>Inicio</Link>
        <Link to="/productos">Ver Productos</Link>
      </nav>
      
      {/* <Outlet /> es el "hueco" donde React Router inyectará las demás páginas */}
      <main>
        <Outlet />
      </main>
    </div>
  );
}

function Inicio() {
  return <h2>Bienvenido a nuestra tienda virtual</h2>;
}

function ListaProductos() {
  return (
    <div>
      <h2>Nuestro Catálogo</h2>
      <ul>
        <li><Link to="/productos/123">Zapatillas Rojas (ID: 123)</Link></li>
        <li><Link to="/productos/456">Camiseta Azul (ID: 456)</Link></li>
      </ul>
    </div>
  );
}

// Ruta Dinámica: Muestra información basada en la URL
function DetalleProducto() {
  // useParams extrae las variables de la URL (en este caso, el "id")
  const { id } = useParams(); 
  
  // useNavigate nos permite cambiar de página mediante código (sin hacer clic en un Link)
  const navigate = useNavigate();

  return (
    <div style={{ background: '#f0f0f0', padding: '15px', borderRadius: '8px' }}>
      <h2>Viendo el Producto #{id}</h2>
      <p>Aquí haríamos una petición a la base de datos para buscar el producto {id}.</p>
      
      {/* Navegación programática */}
      <button onClick={() => navigate('/productos')}>
        ← Volver al catálogo
      </button>
    </div>
  );
}

function Pagina404() {
  return <h2 style={{ color: 'red' }}>Error 404: La página no existe</h2>;
}

// --- CONFIGURACIÓN DEL ENRUTADOR (Punto de entrada) ---

export default function App() {
  return (
    // BrowserRouter envuelve toda la aplicación para conectarse con la URL del navegador
    <BrowserRouter>
      <Routes>
        {/* Ruta Padre: Usa la Plantilla. Todas las rutas hijas se dibujarán dentro de su <Outlet /> */}
        <Route path="/" element={<Plantilla />}>
          
          {/* "index" significa que esta es la ruta por defecto cuando se visita "/" */}
          <Route index element={<Inicio />} />
          
          <Route path="productos" element={<ListaProductos />} />
          
          {/* El ":id" indica que es una variable dinámica. Puede ser cualquier texto/número */}
          <Route path="productos/:id" element={<DetalleProducto />} />
          
          {/* El comodín "*" atrapa cualquier URL que no coincida con las anteriores */}
          <Route path="*" element={<Pagina404 />} />
          
        </Route>
      </Routes>
    </BrowserRouter>
  );
}