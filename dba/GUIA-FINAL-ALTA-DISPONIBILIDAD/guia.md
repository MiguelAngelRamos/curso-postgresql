## Guía Completa para Configurar Alta Disponibilidad en PostgreSQL 16 con `repmgr` y `keepalived` en Fedora 40

### 1. **Instalación de PostgreSQL y `repmgr`**

Primero, instala PostgreSQL 16 y `repmgr` en ambos nodos (maestro y esclavo).

```bash
sudo dnf install -y postgresql-server postgresql-contrib
sudo dnf install -y repmgr_16
```

### 2. **Inicializar la Base de Datos en el Nodo Maestro**

Inicia PostgreSQL y configura la base de datos en el nodo maestro.

```bash
sudo /usr/pgsql-16/bin/postgresql-16-setup initdb
sudo systemctl enable postgresql-16
sudo systemctl start postgresql-16
```

### 3. **Crear la Base de Datos `repmgr` y Configurar Permisos**

Conéctate al nodo maestro como el usuario `postgres` para crear la base de datos `repmgr` y configurar los permisos:

1. **Accede a la consola de PostgreSQL**:

   ```bash
   sudo -u postgres psql
   ```

2. **Crea el usuario `repmgr` con permisos de superusuario**:

   ```sql
   CREATE USER repmgr WITH PASSWORD 'academy' SUPERUSER;
   ```

3. **Crea la base de datos `repmgr` con el usuario `repmgr` como propietario**:

   ```sql
   CREATE DATABASE repmgr WITH OWNER=repmgr;
   ```

4. **Sal de la consola de PostgreSQL**:

   ```sql
   \q
   ```

### 4. **Configurar `repmgr.conf` en Cada Nodo**

#### **Configuración en el Nodo Maestro**

1. **Edita el archivo `repmgr.conf` en el nodo maestro**:

   ```bash
   sudo nano /etc/repmgr/16/repmgr.conf
   ```

2. **Configura los siguientes parámetros en el nodo maestro**:

   ```plaintext
   node_id=1
   node_name='master'
   conninfo='host=192.168.160.137 user=repmgr dbname=repmgr password=academy'
   data_directory='/var/lib/pgsql/16/data'
   use_replication_slots=yes
   pg_bindir='/usr/pgsql-16/bin'
   promote_command='sudo -u postgres /usr/pgsql-16/bin/repmgr standby promote --force -f /etc/repmgr/16/repmgr.conf'
   follow_command='sudo -u postgres /usr/pgsql-16/bin/repmgr standby follow -f /etc/repmgr/16/repmgr.conf'
   ```

#### **Configuración en el Nodo Esclavo**

Antes de clonar el nodo esclavo desde el maestro, es recomendable configurar el archivo `repmgr.conf` en el nodo esclavo. Esto asegura que la configuración esté lista para ser utilizada una vez completada la clonación.

1. **Edita el archivo `repmgr.conf` en el nodo esclavo**:

   ```bash
   sudo nano /etc/repmgr/16/repmgr.conf
   ```

2. **Configura los siguientes parámetros en el nodo esclavo**:

   ```plaintext
   node_id=2
   node_name='standby'
   conninfo='host=192.168.160.137 user=repmgr dbname=repmgr password=academy'
   data_directory='/var/lib/pgsql/16/data'
   use_replication_slots=yes
   pg_bindir='/usr/pgsql-16/bin'
   promote_command='sudo -u postgres /usr/pgsql-16/bin/repmgr standby promote --force -f /etc/repmgr/16/repmgr.conf'
   follow_command='sudo -u postgres /usr/pgsql-16/bin/repmgr standby follow -f /etc/repmgr/16/repmgr.conf'
   ```

### 5. **Configurar `postgresql.conf` y `pg_hba.conf` en el Nodo Maestro**

Configura los archivos necesarios en el nodo maestro para habilitar la replicación y permitir conexiones desde el nodo esclavo.

#### **Configurar `postgresql.conf`**

1. **Edita el archivo `postgresql.conf`**:

   ```bash
   sudo nano /var/lib/pgsql/16/data/postgresql.conf
   ```

2. **Asegúrate de configurar los siguientes parámetros**:

   ```plaintext
   listen_addresses = '*'
   wal_level = replica
   max_wal_senders = 10
   wal_keep_size = 512MB
   archive_mode = on
   archive_command = 'cp %p /var/lib/pgsql/16/wal_archive/%f'
   ```

#### **Configurar `pg_hba.conf`**

1. **Edita el archivo `pg_hba.conf`**:

   ```bash
   sudo nano /var/lib/pgsql/16/data/pg_hba.conf
   ```

2. **Añade las siguientes líneas para permitir conexiones desde el nodo esclavo**:

   ```plaintext
   host    replication     repmgr          192.168.160.136/32      md5
   host    repmgr          repmgr          192.168.160.136/32      md5
   ```

3. **Reinicia PostgreSQL para aplicar los cambios**:

   ```bash
   sudo systemctl restart postgresql-16
   ```

#### **Configurar los Permisos para el Almacenamiento de WALs**

1. **Crea el directorio para almacenar los archivos WAL (si no existe)**:

   ```bash
   sudo mkdir -p /var/lib/pgsql/16/wal_archive
   ```

2. **Asigna los permisos adecuados al directorio de WALs**:

   ```bash
   sudo chown postgres:postgres /var/lib/pgsql/16/wal_archive
   sudo chmod 700 /var/lib/pgsql/16/wal_archive
   ```

   **Nota**: Esto asegura que solo el usuario `postgres` tiene acceso de lectura y escritura a este directorio, lo que es crucial para la seguridad y operación del sistema.

### 6. **Registrar el Nodo Maestro con `repmgr`**

Registra el nodo maestro en el clúster de alta disponibilidad:

```bash
sudo -u postgres /usr/pgsql-16/bin/repmgr -f /etc/repmgr/16/repmgr.conf primary register
```

### 7. **Clonar y Configurar el Nodo Esclavo**

#### **Detener PostgreSQL en el Nodo Esclavo**

1. **Detén PostgreSQL en el nodo esclavo**:

   ```bash
   sudo systemctl stop postgresql-16
   ```

#### **Clonar el Nodo Esclavo desde el Maestro**

1. **Clona la base de datos del nodo maestro en el nodo esclavo**:

   ```bash
   sudo -u postgres /usr/pgsql-16/bin/repmgr -h 192.168.160.137 -U repmgr -d repmgr -f /etc/repmgr/16/repmgr.conf standby clone --force
   ```

#### **Iniciar PostgreSQL en el Nodo Esclavo**

1. **Inicia PostgreSQL en el nodo esclavo**:

   ```bash
   sudo systemctl start postgresql-16
   ```

#### **Registrar el Nodo Esclavo**

1. **Registra el nodo esclavo en el clúster**:

   ```bash
   sudo -u postgres /usr/pgsql-16/bin/repmgr -f /etc/repmgr/16/repmgr.conf standby register --force
   ```

### 8. **Verificar la Replicación y el Estado del Clúster**

#### **Verificar la Replicación en el Nodo Maestro**

1. **Ejecuta el siguiente comando para verificar la replicación en el nodo maestro**:

   ```bash
   sudo -u postgres psql -c "SELECT * FROM pg_stat_replication;"
   ```

   **Nota**: Este comando muestra las conexiones activas de replicación desde el nodo esclavo.

#### **Verificar el Estado del Receptor WAL en el Nodo Esclavo**

1. **Ejecuta el siguiente comando para verificar el estado del receptor WAL en el nodo esclavo**:

   ```bash
   sudo -u postgres psql -c "SELECT * FROM pg_stat_wal_receiver;"
   ```

   **Nota**: Este comando muestra el estado del proceso de recepción de WAL (Write-Ahead Logs) en el nodo esclavo.

#### **Verificar el Estado del Clúster**

1. **Verifica el estado del clúster completo**:

   ```bash
   sudo -u postgres /usr/pgsql-16/bin/repmgr -f /etc/repmgr/16/repmgr.conf cluster show
   ```

   **Nota**: Este comando muestra una vista general del clúster, incluyendo el estado de cada nodo y su rol (maestro o esclavo).

### 9. **Configurar y Verificar `keepalived` para la IP Virtual**

`keepalived` se utiliza para gestionar la IP virtual, que se asigna al nodo maestro y, en caso de failover, se mueve al nodo esclavo.

#### **Configuración en el Nodo Maestro**

1. **Instala `keepal

ived`**:

   ```bash
   sudo dnf install -y keepalived
   ```

2. **Edita el archivo de configuración `keepalived.conf`**:

   ```bash
   sudo nano /etc/keepalived/keepalived.conf
   ```

3. **Configura `keepalived.conf` en el nodo maestro**:

   ```plaintext
   vrrp_instance VI_1 {
       state MASTER
       interface ens160
       virtual_router_id 51
       priority 101
       advert_int 1
       authentication {
           auth_type PASS
           auth_pass password123
       }
       virtual_ipaddress {
           192.168.160.140
       }
       track_script {
           chk_postgresql
       }
   }
   ```

#### **Configuración en el Nodo Esclavo**

1. **Instala `keepalived` en el nodo esclavo**:

   ```bash
   sudo dnf install -y keepalived
   ```

2. **Edita el archivo de configuración `keepalived.conf` en el nodo esclavo**:

   ```bash
   sudo nano /etc/keepalived/keepalived.conf
   ```

3. **Configura `keepalived.conf` en el nodo esclavo**:

   ```plaintext
   vrrp_instance VI_1 {
       state BACKUP
       interface ens160
       virtual_router_id 51
       priority 100
       advert_int 1
       authentication {
           auth_type PASS
           auth_pass password123
       }
       virtual_ipaddress {
           192.168.160.140
       }
       track_script {
           chk_postgresql
       }
   }
   ```

#### **Configurar el Script de Monitoreo `chk_postgresql` en Ambos Nodos**

1. **Crea el script `chk_postgresql.sh` en ambos nodos**:

   ```bash
   sudo nano /etc/keepalived/chk_postgresql.sh
   ```

2. **Añade el siguiente contenido al script**:

   ```bash
   #!/bin/bash
   if sudo -u postgres /usr/pgsql-16/bin/pg_isready > /dev/null 2>&1
   then
       exit 0
   else
       exit 1
   fi
   ```

3. **Haz que el script sea ejecutable**:

   ```bash
   sudo chmod +x /etc/keepalived/chk_postgresql.sh
   ```

4. **Reinicia `keepalived` en ambos nodos para aplicar los cambios**:

   ```bash
   sudo systemctl restart keepalived
   ```

#### **Verificar la Asignación de la IP Virtual**

1. **Verifica que la IP virtual esté asignada al nodo maestro**:

   ```bash
   ip addr show ens160 | grep 192.168.160.140
   ```

### 10. **Comandos Útiles para Monitoreo y Diagnóstico**

1. **Acceder a la Consola de PostgreSQL**:

   ```bash
   sudo -u postgres psql
   ```

2. **Monitorear los Logs de PostgreSQL en Tiempo Real**:

   ```bash
   sudo tail -f /var/lib/pgsql/data/log/postgresql-Wed.log
   ```

3. **Verificar el Estado del Clúster**:

   ```bash
   sudo -u postgres /usr/pgsql-16/bin/repmgr -f /etc/repmgr/16/repmgr.conf cluster show
   ```

Con todos los pasos anteriores, tu clúster PostgreSQL debería estar completamente configurado y operando en un entorno de alta disponibilidad. Monitorea regularmente el estado del clúster para asegurarte de que los nodos maestro y esclavo están en sincronía y listos para manejar failovers si es necesario.
