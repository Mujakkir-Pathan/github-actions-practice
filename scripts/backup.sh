#!/bin/bash

SOURCE="$1"
DEST="$2"

if [ -d "$SOURCE" ] && [ -d "$DEST" ]
then
    echo "Both directories exist"
else
    echo "Error: Source or Destination directory does not exist"
    exit 1
fi

TIMESTAMP=$(date +%Y-%m-%d)

tar -czf "$DEST/backup-$TIMESTAMP.tar.gz" "$SOURCE"

STATUS=$?

if [ $STATUS -eq 0 ]
then
    echo "Backup successful"
    echo "Backup created: backup-$TIMESTAMP.tar.gz"
    du -h "$DEST/backup-$TIMESTAMP.tar.gz"
else
    echo "Backup failed"
    exit 1
fi

find "$DEST" -name "backup-*.tar.gz" -mtime +14 -delete