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

## Start

```bash
docker compose up
```