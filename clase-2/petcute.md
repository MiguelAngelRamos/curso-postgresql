```sh
create table pacientes(
	id_paciente SERIAL primary key,
	nombre varchar(100) not null,
	especie varchar(50) not null,
	raza varchar(50),
	edad int check (edad >= 0),
	dueño varchar(100) not null,
	telefono varchar(15) not null
);

create table servicios(
	id_servicio SERIAL primary key,
	descripcion text not null,
	costo DECIMAL(10,2) not null check (costo >= 0)
)

create table consultas (
	id_consulta SERIAL primary key,
	id_paciente INT not null, -- 'id_paciente' es una clave foránea que hace referencia a tabla pacientes
	id_servicio INT not null, -- 'id_servicio' es una clave foránea que hace referencia a tabla servicios
	fecha DATE not null, -- DATE almacena fechas
	diagnostico text not null, -- text permite largas descripciones
	tratamiento text not null,
	constraint fk_paciente foreign KEY(id_paciente) references pacientes(id_paciente),
	constraint fk_servicio foreign key(id_servicio) references servicios(id_servicio)
)

-- INSERTAR DATOS
insert into pacientes(nombre, especie, raza, edad, "dueño", telefono) values 
('rocky', 'perro', 'ladrador', 5, 'sofia menares', '474747481')

insert into pacientes(nombre, especie, raza, edad, "dueño", telefono) values 
('polo', 'gato', 'siames', 5, 'richard gonzalez', '434347481')

select * from pacientes;

```