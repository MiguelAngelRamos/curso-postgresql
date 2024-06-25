```sql
-- Tabla de usuarios
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de auditoría
CREATE TABLE audit_log (
    id SERIAL PRIMARY KEY,
    action VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de correos (simulación)
CREATE TABLE emails (
    id SERIAL PRIMARY KEY,
    recipient VARCHAR(100) NOT NULL,
    subject VARCHAR(100) NOT NULL,
    body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

 va llamar create_user va recibir por parametro "p_username" y el p_email

create or replace function create_user(p_username VARCHAR, p_email VARCHAR)
returns void as $$
begin 
	-- insertar el usuario en tabla users
	insert into users(username, email) values(p_username, p_email);	
	-- Resgistrar la acción en a la tabla audit_log
	insert into audit_log(action, username) values ('User created', p_username);


	-- Simular el envio de un correo
	
	insert into emails(recipient, suject, body) 
	values (p_email, 'Welcolme', 'Welcome to user service', '|| p_username || '!' )
end



```
