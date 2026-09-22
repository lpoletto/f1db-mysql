#!/bin/sh
set -e

F1DB_VERSION="2026.14.0"
DOWNLOAD_URL="https://github.com/f1db/f1db/releases/download/v${F1DB_VERSION}/f1db-sql-mysql.zip"

echo "=========================================="
echo " F1DB Downloader"
echo " Version: ${F1DB_VERSION}"
echo "=========================================="

apk add --no-cache curl unzip

if [ ! -f /data/f1db-sql-mysql.sql ]; then

    echo "Downloading F1DB..."

    curl -L "$DOWNLOAD_URL" \
        -o /data/f1db.zip

    echo "Extracting F1DB..."

    unzip -o /data/f1db.zip -d /data

    echo "F1DB downloaded and extracted successfully."

else

    echo "F1DB SQL already exists."
fi

echo "=========================================="
echo " F1DB download completed!"
echo "=========================================="