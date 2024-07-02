```sql
create table "user" (
	id serial primary key,
	username varchar(50) unique not null,
	password text not null,
	last_login timestamp default current_timestamp
);


insert into "user" (username, password) values ('mramos', 'secreto');

select * from "user";

create extension pgcrypto;

insert
	into
	"user" (username,
	password)
values (
	'sofia', 
	crypt('secreto123',
gen_salt('bf'))
	);
	
-- Comprobación
select * from "user" where username='sofia' and password = crypt('secreto123', password);
select count(*) from "user" where username='sofia' and password = crypt('secreto123', password);


-- Table de registros

create table session_failed (
	id serial primary key,
	username varchar(50) not null,
	"when" timestamp
);

-- Procedimiento Almacenado

create or replace procedure user_login(user_name varchar, user_password varchar)
as $$
declare was_found boolean;
begin
	select count(*) into was_found from "user" where username=user_name and password = crypt(user_password, password);
	
 	if(was_found = false) then
 		insert into session_failed(username, "when") values (user_name, now());
 		commit;
 		raise exception 'Credenciales incorrecta';
 	end if;
 	
 	-- actualizar el campo last_login
 	update "user" set last_login = now() where username = user_name;
    raise notice 'User encontrado %', was_found;
end;
$$ language plpgsql;


-- TRIGGER (lo queremos ejecutar despues del update)
create or replace trigger create_session_trigger after update on "user"
for each row
when (old.last_login is distinct from new.last_login)
execute procedure create_session_log();



-- Función
create or replace function create_session_log()
returns trigger as $$
begin 
	insert into "session"(user_id, last_login) values (new.id, now());
	return new;
end
$$ language plpgsql;



create table session(
	id serial primary key,
	user_id int not null,
	last_login timestamp
);

call user_login('sofia', 'secreto123');
select * from "user";
select * from session_failed;
select * from session;

```