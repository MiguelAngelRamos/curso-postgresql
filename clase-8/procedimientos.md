```sql
create table users (
	id serial primary key, 
	username varchar(50) not null,
	email varchar(100) not null,
	create_at timestamp default current_timestamp
);

create or replace function create_user(p_username varchar, p_email varchar)
returns void as $$
begin
	insert into users(username, email) values (p_username, p_email);
end;
$$ language plpgsql;

-- Para ejecutar el procedimiento almacenado
select create_user('sofia', 'sofia@correo.com');

select * from users;

-- Tabla de productos
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    stock INT NOT NULL,
    price NUMERIC(10, 2) NOT NULL
);

-- Tabla de ventas
CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Tabla de auditoría de inventario
CREATE TABLE inventory_audit (
    id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    quantity_change INT NOT NULL,
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

create or replace function record_sale(p_product_id INT, p_quantity int)
returns void as $$
begin
	-- Verifica si hay suficiente stock
	if(select stock from products where id = p_product_id) < p_quantity then 
	   raise exception 'No hay stock suficiente para este producto ID %', p_product_id;
	end if;

    -- Registrar la venta en tabla sales
    insert into sales(product_id, quantity) values (p_product_id, p_quantity);
   
    -- Actualizar la cantidad de stock en la tabla products
   update products set stock = stock - p_quantity
   where id = p_product_id;
  
   -- Registramos el movimiento en la tabla inventory audit
   
   insert into inventory_audit(product_id, quantity_change, description)
   values (p_product_id, -p_quantity, 'Sale transaction');
end;
$$ language plpgsql;


-- Implementación

insert into products(name, stock, price) values ('Laptop', 10, 999.99);


-- Vamos a registrar una venta de 2 unidades de este producto
select record_sale(1,2);

-- Verificar 
-- Deberiamos ver que el stock del producto disminuye en 2 unidades
select * from products where id = 1;

-- Verificar la Auditoria del inventario
select * from inventory_audit where product_id = 1;

```