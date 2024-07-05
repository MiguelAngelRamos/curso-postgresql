```sql
create table products (
	product_id serial primary key,
	product_name varchar(100) not null,
	quantity int not null,
	price decimal(10, 2) not null
);

create table operations (
	operation_id serial primary key,
	operation_name varchar(10) unique not null
);

create table inventory_history (
	history_id serial primary key,
	product_id int not null,
	operation_id int not null,
	operation_time timestamp default current_timestamp,
	old_quantity int,
	new_quantity int,
	old_price decimal(10,2),
	new_price decimal(10,2),
	foreign key (product_id) references products(product_id) on delete cascade,
	foreign key (operation_id) references operations(operation_id)
);

insert into operations (operation_name) values ('INSERT'), ('UPDATE'), ('DELETE');
select * from operations;

-- Procedimiento almacenado
create or replace procedure update_product_quantity(p_product_id INT, p_new_quantity INT, p_new_price DECIMAL)
language plpgsql
as $$
begin 
	update products
	set quantity = p_new_quantity,
		price = p_new_price
	where product_id = p_product_id;
end;
$$;

-- Triggers

-- trigger para registrar inserciones en el historial de inventario (inventory_history)

create or replace function log_inventory_insert() returns trigger 
language plpgsql
as $$
	begin 
		insert into inventory_history(product_id, operation_id, new_quantity, new price)
		values(new.product_id, (select operation_id from operations where operation_name = 'INSERT'), new.quantity, new.price);
	return new;
	end;
$$;


select operation_id from operations where operation_name = 'INSERT';

```