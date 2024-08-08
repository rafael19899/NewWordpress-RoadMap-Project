#!/bin/bash

# Create backup directory if it doesn't exist

# Load environment variables from .env file
export $(grep -v '^#' .env | xargs)

DATE=$(date +"%Y%m%d%H%M")

# Set default file permissions
umask 177

# Create backup directory if it doesn't exist
mkdir -p ${BACKUP_DIR}

# Backup command
mysqldump --user=${DB_USER} --password=${DB_PASSWORD} --host=${DB_HOST} ${DB_NAME} > ${BACKUP_DIR}/${DB_NAME}_${DATE}.sql

# Optional: Remove backups older than 7 days
# find $BACKUP_DIR/* -mtime +7 -exec rm {} \;

# Print completion message
echo "Backup completed successfully!"
