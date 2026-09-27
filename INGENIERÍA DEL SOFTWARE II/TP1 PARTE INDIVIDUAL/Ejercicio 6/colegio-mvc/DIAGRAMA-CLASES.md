# Diagrama de Clases de Diseño (actualizado con login de docentes)

```mermaid
classDiagram
    class Persona {
        <<abstract>>
        -Long id
        -String nombre
        -String apellido
        -Sexo sexo
        -LocalDate fechaNacimiento
    }

    class Alumno {
        +List~Nota~ notas
        +List~Club~ clubes
    }

    class Docente {
        -String email
        -String password
        +List~Materia~ materiasQueDicta
        +getUsername() String
        +getAuthorities() Collection
    }

    class Colegio {
        -Long id
        -String nombre
        -String direccion
    }

    class Departamento {
        -Long id
        -String nombre
    }

    class Aula {
        -Long id
        -String nombre
        -Integer capacidad
    }

    class Grado {
        -Long id
        -String nombre
        -Integer anioLectivo
    }

    class Materia {
        -Long id
        -String nombre
        -Integer cargaHorariaSemanal
    }

    class Nota {
        -Long id
        -Double valor
        -LocalDate fecha
        -String periodo
    }

    class Club {
        -Long id
        -String nombre
        -String descripcion
    }

    Persona <|-- Alumno : Herencia
    Persona <|-- Docente : Herencia

    Colegio "1" *-- "0..*" Aula : Composicion
    Colegio "1" *-- "0..*" Departamento : Composicion
    Departamento "1" o-- "0..*" Docente : Agregacion
    Aula "1" --> "0..*" Grado : Asociacion
    Grado "1" o-- "0..*" Alumno : Agregacion
    Docente "1" --> "0..*" Materia : Asociacion
    Alumno "1" *-- "0..*" Nota : Composicion
    Materia "1" *-- "0..*" Nota : Composicion
    Alumno "0..*" -- "0..*" Club : Asociacion
```

## Justificación de cada relación UML pedida

| Relación | Dónde aparece | Por qué es esa y no otra |
|---|---|---|
| **Herencia** | `Persona` → `Alumno`, `Docente` | Alumno y Docente comparten atributos (nombre, apellido, sexo, fecha de nacimiento) pero tienen comportamiento y datos propios (Docente además tiene login). |
| **Composición** | `Colegio` *-- `Aula`, `Colegio` *-- `Departamento`, `Alumno`/`Materia` *-- `Nota` | La parte no tiene sentido ni ciclo de vida propio sin el todo: un aula no existe sin su colegio, una nota no existe sin su alumno y su materia. |
| **Agregación** | `Departamento` o-- `Docente`, `Grado` o-- `Alumno` | El todo agrupa a la parte, pero la parte sobrevive y tiene sentido por sí sola aunque se elimine el todo o cambie de "contenedor" (un docente puede cambiar de departamento, un alumno de grado). |
| **Asociación** | `Aula` → `Grado`, `Docente` → `Materia`, `Alumno` -- `Club` | Ambas clases existen de forma completamente independiente; solo se referencian entre sí. |

**Nuevas funcionalidades agregadas al problema original** (requisito de la parte *a*): `Colegio`, `Departamento` y `Club` (actividades extracurriculares). Estas entidades no estaban en el enunciado original y se incorporan específicamente para poder mostrar las 4 relaciones UML pedidas de forma clara y con sentido de negocio real.

**Login de docentes** (requisito de la parte *i*): se agregó a `Docente` los atributos `email` (usado como *username*) y `password` (hash BCrypt), y la entidad implementa `UserDetails` de Spring Security. Esto no rompe el diagrama original: solo extiende la clase `Docente` ya existente.
