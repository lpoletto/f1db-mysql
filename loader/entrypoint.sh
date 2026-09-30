#!/bin/sh
set -e

# Dump comprimido versionado en este repositorio (no el .sql).
F1DB_DUMP_URL="${F1DB_DUMP_URL:-https://github.com/lpoletto/f1db-mysql/raw/main/data/f1db.gz}"
F1DB_GZ="/data/f1db.gz"
F1DB_SQL="/data/f1db.sql"

echo "=========================================="
echo " F1DB Downloader"
echo " Source: ${F1DB_DUMP_URL}"
echo "=========================================="

apk add --no-cache curl

if [ -f "$F1DB_SQL" ]; then
    echo "F1DB SQL already exists at ${F1DB_SQL}."
else
    if [ ! -f "$F1DB_GZ" ]; then
        echo "Downloading f1db.gz from the project repository..."
        curl -fL "$F1DB_DUMP_URL" -o "$F1DB_GZ"
        echo "Download completed."
    else
        echo "Using existing ${F1DB_GZ}."
    fi

    echo "Extracting f1db.gz to ${F1DB_SQL}..."
    gzip -dc "$F1DB_GZ" > "$F1DB_SQL"
    echo "F1DB extracted successfully."
fi

echo "=========================================="
echo " F1DB download completed!"
echo "=========================================="
