## Gestión de Reservas de Hotel con Transacciones

Objetivo: Implementar una serie de operaciones en una base de datos PostgreSQL utilizando transacciones con COMMIT y ROLLBACK para asegurar la consistencia de los datos. Las tablas deben estar normalizadas.
Descripción: Se te proporcionan dos tablas normalizadas: habitaciones y reservas. Tu tarea es gestionar la reserva de una habitación en una transacción. Si alguna operación falla, debes revertir todos los cambios realizados durante la transacción.

Tablas:
1.	habitaciones
  -	id (serial, primary key)
  -	numero (integer, unique)
  -	tipo (varchar(50))
  -	disponible (boolean)
2.	reservas
  -	id (serial, primary key)
  -	habitacion_id (integer, foreign key referencia a habitaciones(id))
  -	cliente (varchar(100))
  -	fecha_entrada (date)
  -	fecha_salida (date)

Instrucciones:
1.	Crea las tablas habitaciones y reservas.
2.	Inserta algunos datos de prueba en la tabla habitaciones.
3.	Implementa una transacción para reservar una habitación y actualizar su estado de disponibilidad.
4.	Asegúrate de utilizar COMMIT y ROLLBACK adecuadamente.
5.	Comprueba los resultados de la transacción.

Requisitos:
  •	La transacción debe reservar la habitación y actualizar su estado de disponibilidad solo si ambas operaciones son exitosas.
  •	En caso de error (por ejemplo, si la habitación ya está reservada), la transacción debe revertirse completamente.

Ejemplo de ejecución:
1.	Crear tablas y datos de prueba.
2.	Ejecutar la transacción.
3.	Verificar los cambios en las tablas.

