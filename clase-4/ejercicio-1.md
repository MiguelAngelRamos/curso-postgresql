```sql

-- 1. Obtener Cantidad de usuarios por país
-- [17:32] Andrea Dagach
select
	count(*) as user_count,
	country
from
	users
group by
	country
order by
	count(*) desc;
 
-- 2. Obtener el promedio de seguidores(followers) por País.
-- Lucas

select
	u.country,
	avg(u.followers) as avg_followers
from
	users u
group by
	u.country
order by
    avg_followers asc;
   
-- 3. Usuarios con más seguidores.
   
select
	first_name,
	last_name,
	username,
	followers
from
	users
order by
	followers desc
limit 10;

-- 4. Cuales son los usuarios que siguen (following) a mas personas.
-- Lucas
select
	u.first_name,
	u.last_name,
	u.username,
	u.following
from
	users as u
order by
	u.following desc
limit 10

-- 5. Usuarios por nombre de dominio  substring(email, position('@' in email) + 1)

select
	count(*) as user_count,
	substring(email,
	position('@' in email) + 1) as domain
from
	users
group by
	domain
order by
	user_count desc;

-- 6. Cantidad de usuarios registrados en cada pais con más de 1000 seguidores (followers)

select
	country,
	count(*) as user_count
from
	users
where
	followers > 1000
group by
	country
order by
	user_count desc;

-- 7. De qué países son los usuarios con cuentas de @google.com (distinct)
select
	distinct country
from
	users
where
	email like '%@google.com';
    
-- 8. Listar las direcciones IP de todos los usuarios de Chile
--  nombre, apellido, el pais, la ultima conexión, 

select first_name, last_name, country, last_connection from users where country = 'Chile';





```