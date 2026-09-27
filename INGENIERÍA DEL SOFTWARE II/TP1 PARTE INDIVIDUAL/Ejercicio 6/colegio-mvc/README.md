# Sistema de Gestión Escolar — colegio-mvc

Proyecto Spring Boot (Java 17) que resuelve el ejercicio **i)** del TP:
arquitectura MVC con Thymeleaf, ORM/JPA sobre MySQL, DTOs entre capas,
auditoría de entidades y seguridad (login de docentes por correo + contraseña,
cambio de contraseña, correo de bienvenida al registrarse).

## Arquitectura (capas)

```
Vista (Thymeleaf/Bootstrap5)
        │
   Controller  ── recibe HTTP, valida (Bean Validation), delega en el Service
        │
     Service   ── logica de negocio (hash de password, envio de mail, reglas)
        │
   Repository  ── Spring Data JPA (interfaces, sin implementacion manual)
        │
      MySQL
```

Entre Controller y Vista/Service viajan siempre **DTOs** (`dto/`), nunca las
entidades JPA (`model/`). La conversión Entity↔DTO la hacen las clases de
`mapper/` (mappers manuales, explícitos a propósito para fines didácticos).

## Paquetes

- `model/` — entidades JPA. `Persona` (herencia), `Alumno`, `Docente`
  (implementa `UserDetails`), `Colegio`, `Departamento`, `Aula`, `Grado`,
  `Materia`, `Nota` (clase de asociación Alumno–Materia), `Club`.
- `model/audit/Auditable.java` — superclase con los 4 campos de auditoría.
- `dto/` — objetos de transferencia entre capas.
- `mapper/` — conversión Entity ↔ DTO.
- `repository/` — interfaces `JpaRepository`.
- `service/` — interfaces y `service/impl/` — lógica de negocio.
- `security/` — `DocenteUserDetailsService` (integra Docente con Spring Security).
- `config/` — `SecurityConfig`, auditoría JPA (`JpaAuditingConfig`, `AuditorAwareImpl`), inicializador de datos (`DataInitializer`).
- `controller/` — controladores MVC (uno por entidad + `AuthController`).
- `resources/templates/` — vistas Thymeleaf con Bootstrap 5 (CDN).

## Cómo correrlo

1. Tener MySQL corriendo localmente (o ajustar `application.properties`).
   La base `colegio_db` se crea sola (`createDatabaseIfNotExist=true`).
2. (Opcional) Completar `spring.mail.username` / `spring.mail.password` en
   `application.properties` con una cuenta y contraseña de aplicación de Gmail.
   Si no se configuran, la aplicación capturará la advertencia y continuará funcionando normalmente.
3. Iniciar la aplicación (`mvn spring-boot:run` o ejecutando `ColegioMvcApplication`).
   Al iniciar, `DataInitializer` creará automáticamente datos iniciales si la base de datos está vacía.
4. Ir a `http://localhost:8080/login` para ingresar.

### Credenciales de prueba precargadas
- **Email:** `docente@colegio.com` | **Contraseña:** `admin123`
- **Email:** `profesora@colegio.com` | **Contraseña:** `admin123`
- **Email:** `admin@colegio.com` | **Contraseña:** `admin123`

También podés registrar nuevos docentes desde `http://localhost:8080/registro`.

## Alcance de esta entrega

Para mantener el foco en los conceptos pedidos (MVC, DTO, ORM, auditoría,
seguridad), tienen **CRUD completo por interfaz web**: Alumnos, Materias,
Notas, Grados y Aulas. `Colegio` y `Departamento` tienen entidad, repositorio
y quedan expuestos como listas desplegables en los formularios (y vienen precargados por `DataInitializer`).

## Diagrama de clases

Ver `DIAGRAMA-CLASES.md` (diagrama Mermaid) con la justificación de cada
relación UML (Herencia, Composición, Agregación, Asociación).
