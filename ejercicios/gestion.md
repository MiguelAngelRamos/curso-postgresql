## Gestión de Pedidos en una Tienda en Línea con Transacciones

Objetivo: Implementar una serie de operaciones en una base de datos PostgreSQL utilizando transacciones con COMMIT y ROLLBACK para asegurar la consistencia de los datos. Las tablas deben estar normalizadas.
Descripción: Se te proporcionan dos tablas normalizadas: productos y pedidos. Tu tarea es gestionar el pedido de un producto en una transacción. Si alguna operación falla, debes revertir todos los cambios realizados durante la transacción.

Tablas:
1.	Productos
  - id (serial, primary key)
  - nombre (varchar(100), unique)
  -	precio (numeric)
  -	stock (integer)
2.	pedidos
  -	id (serial, primary key)
  -	producto_id (integer, foreign key referencia a productos(id))
  -	cliente (varchar(100))
  -	cantidad (integer)
  -	fecha_pedido (date)

Instrucciones:
1.	Crea las tablas productos y pedidos.
2.	Inserta algunos datos de prueba en la tabla productos.
3.	Implementa una función que gestione el pedido de un producto y actualice su stock dentro de una transacción.
4.	Asegúrate de utilizar COMMIT y ROLLBACK adecuadamente dentro de la función.
5.	Comprueba los resultados de la transacción.

Requisitos:
  •	La transacción debe registrar el pedido y actualizar el stock del producto solo si ambas operaciones son exitosas.
  •	En caso de error (por ejemplo, si no hay suficiente stock), la transacción debe revertirse completamente.
  
Ejemplo de ejecución:
1.	Crear tablas y datos de prueba.
2.	Ejecutar la función para realizar la transacción.
3.	Verificar los cambios en las tablas.

