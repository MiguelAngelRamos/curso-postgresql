El error "FATAL: la autentificación Peer falló para el usuario «sofiadevelopers»" indica que PostgreSQL está intentando usar el método de autenticación "peer" para autenticar al usuario `sofiadeveloper`. El método "peer" verifica que el nombre de usuario del sistema operativo coincida con el nombre de usuario de PostgreSQL.

Para solucionar este problema, puedes cambiar el método de autenticación en el archivo `pg_hba.conf` a "md5" o "password" para permitir la autenticación con contraseña.

### Pasos para Solucionar el Problema

1. **Editar el archivo `pg_hba.conf`**:

   Abre el archivo `pg_hba.conf`, que suele estar en el directorio de datos de PostgreSQL (por ejemplo, `/etc/postgresql/12/main/pg_hba.conf` en Debian/Ubuntu o `/var/lib/pgsql/data/pg_hba.conf` en Fedora/CentOS).

   ```sh
   sudo nano /var/lib/pgsql/data/pg_hba.conf
   ```

2. **Cambiar el método de autenticación para el usuario `sofiadevelopers`**:

   Busca la línea que contiene `local` y cambia el método de autenticación de `peer` a `md5` o `password`.

   Antes:

   ```
   local   all             all                                     peer
   ```

   Después (usando `md5`):

   ```
   local   all             all                                     md5
   ```

3. **Reiniciar el servidor PostgreSQL**:

   Después de hacer los cambios, reinicia el servidor PostgreSQL para que los cambios surtan efecto.

   ```sh
   sudo systemctl restart postgresql
   ```

4. **Verificar la Conexión**:

   Ahora, intenta conectarte nuevamente como el usuario `sofiadeveloper`.

   ```sh
   psql -U sofiadeveloper -d ejemplo_db
   ```

### Confirmar Permisos de `sofiadeveloper`

Una vez que hayas solucionado el problema de autenticación y te hayas conectado con éxito, puedes verificar los permisos siguiendo los pasos mencionados anteriormente. A continuación, un resumen de las consultas para verificar los permisos:

1. **Verificar permisos de selección, inserción, actualización y eliminación**:

   ```sql
   SELECT has_table_privilege('sofiadeveloper', 'esquema_genius.mi_tabla', 'SELECT');
   SELECT has_table_privilege('sofiadeveloper', 'esquema_genius.mi_tabla', 'INSERT');
   SELECT has_table_privilege('sofiadeveloper', 'esquema_genius.mi_tabla', 'UPDATE');
   SELECT has_table_privilege('sofiadeveloper', 'esquema_genius.mi_tabla', 'DELETE');
   ```

2. **Probar operaciones en la tabla**:

   ```sql
   INSERT INTO esquema_genius.mi_tabla (nombre) VALUES ('Test Nombre');
   SELECT * FROM esquema_genius.mi_tabla;
   UPDATE esquema_genius.mi_tabla SET nombre = 'Nuevo Nombre' WHERE id = 1;
   DELETE FROM esquema_genius.mi_tabla WHERE id = 1;
   ```
