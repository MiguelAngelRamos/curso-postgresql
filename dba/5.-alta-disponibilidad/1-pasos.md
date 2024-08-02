## Crear la carpeta para el respaldo que vamos a replicar

```sh
sudo mkdir /var/lib/pgsql/backup_master
```
```sh
sudo chown -R postgres:postgres /var/lib/pgsql/backup_master
sudo chmod -R 700 /var/lib/pgsql/backup_master
```




## Crear un usuario con permisos de replicador

```sh
sudo su - postgres
```

```sh
psql
```

```sql
create user replicador with replication password 'academy';
```

## Parametros 

1. wal_level
2. max_wal_senders
3. hot_standby

```sql
postgres=# SHOW wal_level;
 wal_level
-----------
 replica
(1 fila)

postgres=# SHOW hot_standby;
 hot_standby
-------------
 on
(1 fila)
```
