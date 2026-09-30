# F1DB MySQL Lab

Entorno local de MySQL utilizando Docker Compose y la base de datos de código abierto de Fórmula 1 F1DB.

## Stack

- Docker
- Docker Compose
- MySQL 8.4
- F1DB
- Jupyter PySpark
- DBeaver

## Architecture

F1DB (`.gz`) → loader → MySQL Docker → DBeaver / Jupyter PySpark

## Permisos (WSL)

En WSL los bind mounts suelen quedar con dueño `root` y los contenedores no pueden escribir. Desde la raíz del repo:

```bash
sudo chown -R $USER:$USER .
chmod -R u+rwX .
chmod +x loader/entrypoint.sh
```

## Arranque

```bash
docker compose up -d
```

No hace falta `--build`: se usan imágenes públicas.

Orden:

1. El loader usa `data/f1db.gz` (o lo baja del repo) y genera `data/f1db.sql`
2. MySQL importa ese dump en la base `f1db`
3. Jupyter PySpark arranca cuando MySQL está healthy

## Acceso

| Servicio | URL / host | Credenciales |
|---|---|---|
| Jupyter Lab | [http://localhost:8888/lab?token=coder](http://localhost:8888/lab?token=coder) | token `coder` |
| MySQL / DBeaver | `localhost:3306` | base `f1db` · usuario `f1user` / `f1password` · root `root` / `root` |

Desde Spark, el host de MySQL es el servicio `mysql`.

Jupyter está limitado a **2 CPUs** y **4 GB** de RAM.

Notebooks en `notebooks/`. Ejemplo: `notebooks/ejemplo_drivers.ipynb`.

## JARs (Spark JDBC)

```bash
mkdir -p spark_jars
cd spark_jars
```

MySQL:

```bash
wget -c https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.4.0/mysql-connector-j-8.4.0.jar
```

PostgreSQL:

```bash
wget -c https://repo1.maven.org/maven2/org/postgresql/postgresql/42.5.2/postgresql-42.5.2.jar
```

Comprobar:

```bash
ls -lh mysql-connector-j-8.4.0.jar postgresql-42.5.2.jar
```

## Parar

```bash
docker compose down
```

Para borrar también los datos de MySQL: `docker compose down -v`.
