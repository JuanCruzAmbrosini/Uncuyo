package com.colegio.mvc.config;

import com.colegio.mvc.enums.Sexo;
import com.colegio.mvc.model.*;
import com.colegio.mvc.repository.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;

/**
 * Componente para inicializar datos de prueba en la base de datos al arrancar la aplicacion.
 *
 * Carga de forma ordenada:
 *  1. Colegios
 *  2. Departamentos y Aulas (componen al Colegio)
 *  3. Grados (asociados a las Aulas)
 *  4. Docentes (con password hasheada y asignados a Departamentos)
 *  5. Materias (dictadas por los Docentes)
 *  6. Alumnos (pertenecientes a los Grados)
 *  7. Notas (asocian Alumno y Materia)
 */
@Configuration
public class DataInitializer implements CommandLineRunner {

    private static final Logger log = LoggerFactory.getLogger(DataInitializer.class);

    private final ColegioRepository colegioRepository;
    private final DepartamentoRepository departamentoRepository;
    private final AulaRepository aulaRepository;
    private final GradoRepository gradoRepository;
    private final DocenteRepository docenteRepository;
    private final MateriaRepository materiaRepository;
    private final AlumnoRepository alumnoRepository;
    private final NotaRepository notaRepository;
    private final PasswordEncoder passwordEncoder;

    public DataInitializer(ColegioRepository colegioRepository,
                           DepartamentoRepository departamentoRepository,
                           AulaRepository aulaRepository,
                           GradoRepository gradoRepository,
                           DocenteRepository docenteRepository,
                           MateriaRepository materiaRepository,
                           AlumnoRepository alumnoRepository,
                           NotaRepository notaRepository,
                           PasswordEncoder passwordEncoder) {
        this.colegioRepository = colegioRepository;
        this.departamentoRepository = departamentoRepository;
        this.aulaRepository = aulaRepository;
        this.gradoRepository = gradoRepository;
        this.docenteRepository = docenteRepository;
        this.materiaRepository = materiaRepository;
        this.alumnoRepository = alumnoRepository;
        this.notaRepository = notaRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    @Transactional
    public void run(String... args) {
        if (colegioRepository.count() > 0 || docenteRepository.count() > 0) {
            log.info("La base de datos ya contiene registros. Se omite la inicialización de datos de prueba.");
            return;
        }

        log.info("Iniciando carga de datos iniciales en la base de datos...");

        // 1. Colegio
        Colegio colegio = new Colegio();
        colegio.setNombre("Colegio Universitario Central");
        colegio.setDireccion("Av. San Martín 1234, Mendoza, Argentina");
        colegio = colegioRepository.save(colegio);

        // 2. Departamentos
        Departamento deptoExactas = new Departamento();
        deptoExactas.setNombre("Departamento de Ciencias Exactas y Naturales");
        deptoExactas.setColegio(colegio);
        deptoExactas = departamentoRepository.save(deptoExactas);

        Departamento deptoHumanidades = new Departamento();
        deptoHumanidades.setNombre("Departamento de Lengua y Humanidades");
        deptoHumanidades.setColegio(colegio);
        deptoHumanidades = departamentoRepository.save(deptoHumanidades);

        Departamento deptoInformatica = new Departamento();
        deptoInformatica.setNombre("Departamento de Informática y Tecnología");
        deptoInformatica.setColegio(colegio);
        deptoInformatica = departamentoRepository.save(deptoInformatica);

        // 3. Aulas
        Aula aula101 = new Aula();
        aula101.setNombre("Aula 101 - Pabellón A");
        aula101.setCapacidad(35);
        aula101.setColegio(colegio);
        aula101 = aulaRepository.save(aula101);

        Aula aula102 = new Aula();
        aula102.setNombre("Aula 102 - Pabellón A");
        aula102.setCapacidad(30);
        aula102.setColegio(colegio);
        aula102 = aulaRepository.save(aula102);

        Aula labInfo = new Aula();
        labInfo.setNombre("Laboratorio de Computación");
        labInfo.setCapacidad(25);
        labInfo.setColegio(colegio);
        labInfo = aulaRepository.save(labInfo);

        // 4. Grados
        Grado grado1A = new Grado();
        grado1A.setNombre("1° Año - División A");
        grado1A.setAnioLectivo(2026);
        grado1A.setAula(aula101);
        grado1A = gradoRepository.save(grado1A);

        Grado grado2A = new Grado();
        grado2A.setNombre("2° Año - División A");
        grado2A.setAnioLectivo(2026);
        grado2A.setAula(aula102);
        grado2A = gradoRepository.save(grado2A);

        Grado grado3A = new Grado();
        grado3A.setNombre("3° Año - División A");
        grado3A.setAnioLectivo(2026);
        grado3A.setAula(aula101);
        grado3A = gradoRepository.save(grado3A);

        // 5. Docentes
        Docente docente1 = new Docente();
        docente1.setNombre("Juan Carlos");
        docente1.setApellido("Pérez");
        docente1.setEmail("docente@colegio.com");
        docente1.setPassword(passwordEncoder.encode("admin123"));
        docente1.setSexo(Sexo.MASCULINO);
        docente1.setFechaNacimiento(LocalDate.of(1982, 5, 14));
        docente1.setDepartamento(deptoExactas);
        docente1 = docenteRepository.save(docente1);

        Docente docente2 = new Docente();
        docente2.setNombre("María Elena");
        docente2.setApellido("González");
        docente2.setEmail("profesora@colegio.com");
        docente2.setPassword(passwordEncoder.encode("admin123"));
        docente2.setSexo(Sexo.FEMENINO);
        docente2.setFechaNacimiento(LocalDate.of(1988, 8, 22));
        docente2.setDepartamento(deptoHumanidades);
        docente2 = docenteRepository.save(docente2);

        Docente docente3 = new Docente();
        docente3.setNombre("Carlos Alberto");
        docente3.setApellido("Gómez");
        docente3.setEmail("admin@colegio.com");
        docente3.setPassword(passwordEncoder.encode("admin123"));
        docente3.setSexo(Sexo.MASCULINO);
        docente3.setFechaNacimiento(LocalDate.of(1979, 3, 10));
        docente3.setDepartamento(deptoInformatica);
        docente3 = docenteRepository.save(docente3);

        // 6. Materias
        Materia mat1 = new Materia();
        mat1.setNombre("Matemática I");
        mat1.setCargaHorariaSemanal(5);
        mat1.setDocente(docente1);
        mat1 = materiaRepository.save(mat1);

        Materia mat2 = new Materia();
        mat2.setNombre("Lengua y Literatura");
        mat2.setCargaHorariaSemanal(4);
        mat2.setDocente(docente2);
        mat2 = materiaRepository.save(mat2);

        Materia mat3 = new Materia();
        mat3.setNombre("Programación y Algoritmos");
        mat3.setCargaHorariaSemanal(6);
        mat3.setDocente(docente3);
        mat3 = materiaRepository.save(mat3);

        Materia mat4 = new Materia();
        mat4.setNombre("Física General");
        mat4.setCargaHorariaSemanal(4);
        mat4.setDocente(docente1);
        mat4 = materiaRepository.save(mat4);

        // 7. Alumnos
        Alumno alumno1 = new Alumno();
        alumno1.setNombre("Martín");
        alumno1.setApellido("Rodríguez");
        alumno1.setSexo(Sexo.MASCULINO);
        alumno1.setFechaNacimiento(LocalDate.of(2010, 4, 12));
        alumno1.setGrado(grado1A);
        alumno1 = alumnoRepository.save(alumno1);

        Alumno alumno2 = new Alumno();
        alumno2.setNombre("Sofía");
        alumno2.setApellido("Martínez");
        alumno2.setSexo(Sexo.FEMENINO);
        alumno2.setFechaNacimiento(LocalDate.of(2010, 9, 25));
        alumno2.setGrado(grado1A);
        alumno2 = alumnoRepository.save(alumno2);

        Alumno alumno3 = new Alumno();
        alumno3.setNombre("Lucas");
        alumno3.setApellido("Fernández");
        alumno3.setSexo(Sexo.MASCULINO);
        alumno3.setFechaNacimiento(LocalDate.of(2009, 2, 18));
        alumno3.setGrado(grado2A);
        alumno3 = alumnoRepository.save(alumno3);

        Alumno alumno4 = new Alumno();
        alumno4.setNombre("Valentina");
        alumno4.setApellido("López");
        alumno4.setSexo(Sexo.FEMENINO);
        alumno4.setFechaNacimiento(LocalDate.of(2009, 11, 3));
        alumno4.setGrado(grado2A);
        alumno4 = alumnoRepository.save(alumno4);

        // 8. Notas
        Nota nota1 = new Nota();
        nota1.setAlumno(alumno1);
        nota1.setMateria(mat1);
        nota1.setValor(8.5);
        nota1.setFecha(LocalDate.of(2026, 4, 15));
        nota1.setPeriodo("1er Trimestre");
        notaRepository.save(nota1);

        Nota nota2 = new Nota();
        nota2.setAlumno(alumno1);
        nota2.setMateria(mat2);
        nota2.setValor(9.0);
        nota2.setFecha(LocalDate.of(2026, 4, 20));
        nota2.setPeriodo("1er Trimestre");
        notaRepository.save(nota2);

        Nota nota3 = new Nota();
        nota3.setAlumno(alumno2);
        nota3.setMateria(mat1);
        nota3.setValor(7.5);
        nota3.setFecha(LocalDate.of(2026, 4, 15));
        nota3.setPeriodo("1er Trimestre");
        notaRepository.save(nota3);

        Nota nota4 = new Nota();
        nota4.setAlumno(alumno3);
        nota4.setMateria(mat3);
        nota4.setValor(10.0);
        nota4.setFecha(LocalDate.of(2026, 4, 18));
        nota4.setPeriodo("1er Trimestre");
        notaRepository.save(nota4);

        log.info("Carga de datos iniciales completada con éxito.");
    }
}
