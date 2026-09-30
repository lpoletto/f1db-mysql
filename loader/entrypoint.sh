#!/bin/sh
set -e

F1DB_DUMP_URL="${F1DB_DUMP_URL:-https://github.com/lpoletto/f1db-mysql/raw/main/data/f1db.gz}"
F1DB_GZ="/data/f1db.gz"
F1DB_SQL="/data/f1db.sql"

echo "=========================================="
echo " F1DB Downloader"
echo " Source: ${F1DB_DUMP_URL}"
echo "=========================================="

apk add --no-cache curl gzip

# Clean up any stale directories/files
echo "Cleaning up stale files..."
rm -rf "$F1DB_GZ" "$F1DB_SQL" 2>/dev/null || true

# Download if not present
if [ -f "$F1DB_GZ" ]; then
    echo "f1db.gz already present at ${F1DB_GZ}."
else
    echo "Downloading f1db.gz from the project repository..."
    curl -fL "$F1DB_DUMP_URL" -o "$F1DB_GZ"
    echo "Download completed."
fi

# Extract to SQL
echo "Extracting f1db.gz to f1db.sql..."
gzip -dc "$F1DB_GZ" > "$F1DB_SQL"
echo "Extraction completed. File ready at /data/f1db.sql"

echo "=========================================="
echo " F1DB setup completed!"
echo "=========================================="
