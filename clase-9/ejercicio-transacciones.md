```sql

create table habitaciones(
	id serial primary key,
	numero integer unique,
	tipo varchar(50),
	disponible boolean
);

create table reservas(
	id serial primary key,
	habitacion_id integer references habitaciones(id),
	cliente varchar(100),
	fecha_entrada DATE,
	fecha_salida DATE
);

insert into habitaciones(numero, tipo, disponible) values
(101,'Simple', true),
(102, 'Double', true),
(103, 'Suite', false); -- La habitación ya esta reservada

-- Una función en PL/pgSQL
create or replace function reservar_habitacion(
  p_habitacion_id integer,
	p_cliente varchar,
	p_fecha_entrada DATE,
	p_fecha_salida DATE
) returns void as $$
declare 
	v_disponible boolean;
begin
	-- Obtener la disponibilidad de la habitación
	select disponible into v_disponible from habitaciones where id = p_habitacion_id;

	-- Verificar si la habitación está disponible
	if v_disponible then
	   -- Actualizar la disponibilidad de la habitación
	    update habitaciones set disponible = false where id = p_habitacion_id;
	   -- Registrar la reserva en la tabla reservas
	   insert into reservas(habitacion_id, cliente ,fecha_entrada, fecha_salida) 
	   values (p_habitacion_id, p_cliente, p_fecha_entrada, p_fecha_salida);
	   raise notice 'Transacción completada exitosamente. Habitación reservada';
	else
	   raise exception 'Transacción revertida. La habitación no esta disponible';
	end  if;	
end;
$$ language plpgsql;

-- Realizar transacción
select reservar_habitacion(1, 'Sofia', '2024-07-01', '2024-07-05');
select reservar_habitacion(3, 'Catalina', '2024-07-01', '2024-07-05');

-- Verificación de resultados
select * from habitaciones;
select * from reservas;
```