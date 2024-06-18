```sql
CREATE TABLE ceos (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL
);

CREATE TABLE enrollments (
    id SERIAL PRIMARY KEY,
    ceo_id INT,
    course_id INT,
    FOREIGN KEY (ceo_id) REFERENCES ceos (id),
    FOREIGN KEY (course_id) REFERENCES courses (id)
);

-- Insertando datos en la tabla ceos
INSERT INTO ceos (name, email) VALUES
('Sundar Pichai', 'sundar.pichai@example.com'),
('Tim Cook', 'tim.cook@example.com'),
('Satya Nadella', 'satya.nadella@example.com');

-- Insertando datos en la tabla courses
INSERT INTO courses (course_name) VALUES
('Strategic Leadership'),
('Innovation Management'),
('Business Strategy');

-- Insertando datos en la tabla enrollments
INSERT INTO enrollments (ceo_id, course_id) VALUES
(1, 1), -- Sundar Pichai en Strategic Leadership
(1, 2), -- Sundar Pichai en Innovation Management
(2, 3), -- Tim Cook en Business Strategy
(3, 1), -- Satya Nadella en Strategic Leadership
(3, 3); -- Satya Nadella en Business Strategy


--  Consulta con inner join
--  Necesitamos obtener del ceo (name, email) y del curso (name), el curso que esta tomando el CEO
--    name                 email                course
-- Sundar Pichai | sundar.pichai@example.com |Strategic Leadership
 
-- Jorge
select
	A.name,
	A.email,
	B.course_name
from
	ceos A
inner join enrollments C on
	A.id = C.ceo_id
inner join courses B on
	B.id = C.course_id

-- Lucas

select
	c."name" ,
	c.email ,
	c2.course_name
from
	ceos c
inner join enrollments e on
	c.id = e.ceo_id
inner join courses c2 on
	c2.id = e.course_id
```