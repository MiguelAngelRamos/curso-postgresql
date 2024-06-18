```sql
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers (id)
);
```

### Inserción de Datos

```sql
-- Insertando datos en la tabla customers
INSERT INTO customers (name, email) VALUES
('Sofia', 'sofia@correo.com'),
('Catalina', 'catalina@correo.com'),
('Roberto', 'roberto@correo.com');

-- Insertando datos en la tabla orders
INSERT INTO orders (order_date, amount, customer_id) VALUES
('2024-01-15', 150.50, 1),
('2024-02-20', 200.75, 2),
('2024-03-05', 350.00, 3),
('2024-04-10', 125.25, 1),
('2024-05-25', 300.60, 2);

```

## Consulta con INNER JOIN

Para obtener una lista de pedidos junto con los nombres y correos electronicos de los clientes 