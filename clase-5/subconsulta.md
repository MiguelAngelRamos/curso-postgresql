```sql


-- select aaa, bb, from xxxx where (select avg(xxx) from xxxx)

-- 1. Obtener los usuarios que tienen más seguidores que el promedio de seguidores.

select
	u1.id, u1.first_name, u1.last_name, u1.followers
from
	users u1
where
	u1.followers > (select avg(u2.followers) from users u2);
	
-- 2. Obtener los usuarios que siguen a más personas que el promedio de personas seguidas

select avg(following) from users; -- 10.081,0881782946

select
	u1.id,
	u1.first_name,
	u1.last_name,
	u1.following
from
	users u1
where
	u1.following > (
	select
		avg(u2.following)
	from
		users u2);
		
/*
 * 3. Obtener los nombres y apellidos de los usuarios que tienen una cantidad de seguidores (followers)
 *   igual al maximo numero de seguidores de los usuarios que siguen (following)
 *	 a más de 10000 personas
 * */
	
	select u1.first_name, u1.last_name from users u1 where u1.followers = (select max(u2.followers) from users u2 where u2.following > 10000);

```