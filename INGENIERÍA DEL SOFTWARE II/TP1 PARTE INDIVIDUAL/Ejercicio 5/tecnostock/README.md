# TecnoStock — TP Análisis y Diseño (MVC + IA)

Sistema de gestión de stock de productos de tecnología, reposición por
compras a proveedores mayoristas (órdenes de compra con detalle) y login
por usuario/contraseña.

## Arquitectura (MVC + ORM + DTO)

```
com.tecnostock
├── model/        -> Entidades JPA (ORM). Incluye las 2 jerarquías de Herencia
│                    (Usuario/Administrador/Empleado y Producto/ProductoFisico/
│                    ProductoDigital), la Agregación (Sucursal-Empleado), la
│                    Composición (OrdenCompra-DetalleOrdenCompra) y las
│                    Asociaciones simples (Categoria, Proveedor, etc).
├── dto/          -> Objetos planos que viajan entre Service <-> Controller <-> Vista.
├── mapper/       -> Traduce Entidad <-> DTO.
├── repository/   -> Interfaces Spring Data JPA (capa ORM contra MySQL).
├── service/      -> Lógica de negocio (AMB de productos) + UserDetailsService (login).
├── controller/   -> Capa MVC "C": recibe HTTP, valida, delega al Service, arma el Model.
└── config/       -> SecurityConfig (login) y carga de datos iniciales.
```

La Vista (capa "V") está en `src/main/resources/templates/` con Thymeleaf
sobre una base Bootstrap 5 (adaptada de un tema tipo ThemeWagon: sidebar +
topbar + tarjetas), reutilizando fragments (`fragments/layout.html`) para
no repetir el layout en cada pantalla.

## Flujo del AMB de productos (ver también el diagrama de secuencia)

1. `GET /productos` → `ProductoController.listar()` → `ProductoService.listarTodos()`
   → `ProductoRepository.findAll()` → Hibernate consulta MySQL.
2. **Alta**: `GET /productos/nuevo` (form vacío) → `POST /productos/guardar`
   (valida `ProductoRequestDTO` con `@Valid`) → `ProductoService.guardar()`.
3. **Modificación**: `GET /productos/editar/{id}` (form precargado) →
   `POST /productos/actualizar/{id}` → `ProductoService.actualizar()`.
4. **Baja**: `POST /productos/eliminar/{id}` → `ProductoService.eliminar()`.

Se usa el patrón **Post-Redirect-Get**: toda operación de escritura
redirige con `redirect:/productos` para evitar reenvíos duplicados del
formulario al refrescar el navegador.

## Seguridad (login usuario/contraseña)

`SecurityConfig` habilita un formulario de login propio (`/login`) y
protege el resto de las rutas. `UsuarioDetailsServiceImpl` resuelve el
usuario contra la tabla `usuario` (jerarquía `Administrador`/`Empleado`)
y traduce la subclase a un rol (`ROLE_ADMIN` / `ROLE_EMPLEADO`). Las
contraseñas se guardan siempre con hash BCrypt.

**Usuario sembrado al arrancar** (`DataInicialLoader`):
- usuario: `admin`
- contraseña: `admin123`

## Cómo ejecutarlo

1. Tener MySQL corriendo. Crear (o dejar que `createDatabaseIfNotExist=true`
   la cree) la base `tecnostock_db`. Ajustar usuario/clave en
   `src/main/resources/application.properties`.
2. `mvn spring-boot:run`
3. Abrir `http://localhost:8080/login` e ingresar con `admin` / `admin123`.

## Nota sobre el alcance del código entregado

Para mantener el ejemplo enfocado en lo pedido ("AMB de productos"), se
implementó el flujo Controller → Service → Repository → Vista **completo**
para `Producto`. El resto de las entidades del diagrama de clases
(`Proveedor`, `OrdenCompra`, `DetalleOrdenCompra`, `Sucursal`, `Usuario`)
ya están modeladas como entidades JPA y con su `Repository` listo: se
puede replicar exactamente el mismo patrón (DTO + Service + Controller +
vistas Thymeleaf) usado en `Producto` para completar el AMB de cada una.
