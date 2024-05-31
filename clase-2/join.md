### Creación de las Tablas con Llaves Primarias y Foráneas

```sql

    -- Creación de la tabla Instructores
    CREATE TABLE Instructores (
        id SERIAL PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        email VARCHAR(100) UNIQUE NOT NULL
    );

    -- Creación de la tabla Cursos
    CREATE TABLE Cursos (
        id SERIAL PRIMARY KEY,
        titulo VARCHAR(100) NOT NULL,
        descripcion TEXT,
        instructor_id INT,
        CONSTRAINT fk_instructor
            FOREIGN KEY (instructor_id) 
            REFERENCES Instructores (id)
    );

```

### Inserción de Datos y Relaciones

```sql

    -- Inserción de datos en la tabla Instructores
    INSERT INTO Instructores (nombre, email) VALUES
    ('Juan Pérez', 'juan.perez@example.com'),
    ('María López', 'maria.lopez@example.com');

    -- Inserción de datos en la tabla Cursos
    INSERT INTO Cursos (titulo, descripcion, instructor_id) VALUES
    ('Curso de Python', 'Aprende Python desde cero', 1),
    ('Curso de PostgreSQL', 'Bases de datos con PostgreSQL', 2),
    ('Curso de JavaScript', 'Desarrollo web con JavaScript', 1);


```