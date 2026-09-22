# F1DB MySQL Lab

Local MySQL environment using Docker Compose
and the F1DB open-source Formula 1 database.

## Stack

- Docker
- Docker Compose
- MySQL 8.4
- F1DB
- DBeaver

## Architecture

F1DB → MySQL Docker → DBeaver

## Para que los contenedores puedan escribir en las carpetas montadas:

```bash
sudo chown -R $USER:$USER .
```

Y podemos asegurarnos de que tu usuario tenga permisos de escritura:

```bash
chmod -R u+rwX .
```

## Permisos al script

```bash
chmod +x loader/entrypoint.sh
```

## Start

```bash
docker compose up
```

## Descargar JARs

Crear la carpeta

```bash
mkdir -p spark_jars
cd spark_jars
```

Descargar los JARs necesarios para conectarse a las BD:

MySQL
```bash
wget -c https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.4.0/mysql-connector-j-8.4.0.jar
```

PostgreSQL

```bash
wget -c https://repo1.maven.org/maven2/org/postgresql/postgresql/42.5.2/postgresql-42.5.2.jar
```

Comprobar archivos descargados:
```bash
ls -lh mysql-connector-j-8.4.0.jar postgresql-42.5.2.jar
```
