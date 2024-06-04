```sql
select * from users;

-- Obtengo todos los registros de la ultima conexion con la ip 221.x.x.x

select 
	first_name, 
	last_name, 
	last_connection 
from 
	users 
where 
	last_connection like '221.%.%.%';
	
-- Obtener el nombre, apellido y cantidad de seguidores que esten entre mayor o igual a 4600 y menor igual a 4700
select 
	first_name, 
	last_name, 
	followers
from users
where
	followers >= 4600 and followers <= 4700
order by
	followers asc;

-- desc es de mayor a menor
-- asc de menor a mayor

select 
	first_name, 
	last_name, 
	followers
from users
where
	followers between 4600 and 4700
order by
	followers asc;

-- Cuantos registros tiene la tabla

select count(*) as total_users from users;

-- Cual es minimo de seguidores que tiene un usuario
select 
	count(*) as total_users,
	min(followers) as min_followers
from users;

-- Cual es el maximo de seguidores que tiene un usuario

select 
	count(*) as total_users,
	max(followers) as max_followers
from users;

-- Cual es el maximo de seguidores que tiene un usuario y quien es ese usuario

select 
	first_name, 
	last_name, 
	followers
from users
where
     followers = (select max(followers) from users);
```