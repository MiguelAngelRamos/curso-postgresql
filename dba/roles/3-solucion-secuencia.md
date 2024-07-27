## Conexión como usuario Postgres en PostgreSQL

Para realizar ciertas acciones administrativas en PostgreSQL, es necesario conectarse como el usuario `postgres`, que tiene todos los permisos necesarios. Si actualmente estás logueado como el usuario `sofia` y conectado a la base de datos, sigue los siguientes pasos:

### Salir del usuario `sofia` y de la base de datos

1. Sal de la base de datos usando el comando `\q`:
    ```sh
    ejemplo_db=> \q
    ```
2. Cierra la sesión del usuario `sofia` usando `exit`:
    ```sh
    postgres@fedora:~$ exit
    cerrar sesión
    miguel@fedora:~$
    ```

### Conexión como usuario `postgres`

1. Inicia sesión como el usuario `postgres` y conéctate a la base de datos `ejemplo_db`:
    ```sh
    postgres@fedora:~$ psql -U postgres -d ejemplo_db
    ```
2. Una vez conectado, otorga todos los privilegios necesarios en la secuencia:
    ```sql
    GRANT ALL PRIVILEGES ON SEQUENCE esquema_genius.mi_tabla_id_seq TO sofiadeveloper;
    ```
3. Sal de la sesión del usuario `postgres`:
    ```sh
    ejemplo_db=> \q
    postgres@fedora:~$ exit
    cerrar sesión
    miguel@fedora:~$
    ```

### Volver a conectarse como usuario `sofiadeveloper`

1. Conéctate de nuevo como el usuario `sofiadeveloper` a la base de datos `ejemplo_db`:
    ```sh
    miguel@fedora:~$ psql -U sofiadeveloper -d ejemplo_db
    ```
2. Una vez conectado, inserta el nuevo registro en la tabla:
    ```sql
    INSERT INTO esquema_genius.mi_tabla (nombre) VALUES ('Test Nombre');
    ```

Con estos pasos, deberías poder realizar la inserción sin problemas de permisos.