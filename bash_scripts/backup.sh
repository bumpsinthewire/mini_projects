#!/bin/bash
# backup.sh - Automate directory backup with tar

# Source directory to back up (adjust as needed)
SOURCE="/home/bumpsinthewire/test_dir"

# Backup destination directory
BACKUP_DIR="/backups"

# Log file
LOGFILE="backup_log.txt"

# Timestamp for unique filename
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

# Debug: Show variables
echo "Source: $SOURCE"
echo "Backup file: $BACKUP_FILE"

# Check if source exists
if [ ! -d "$SOURCE" ]; then
	echo "$(date): Source $SOURCE doesn't exist!" >> "$LOGFILE"
	exit 1
fi

# Ensure backup directory exists
if ! mkdir -p "$BACKUP_DIR"; then
	echo "$(date): Failed to create $BACKUP_DIR!" >> "$LOGFILE"
	exit 1
fi

# Create the backup
if tar -czf "$BACKUP_FILE" "$SOURCE" 2>/dev/null; then
	echo "$(date): Backup of $SOURCE to $BACKUP_FILE successful" >> "$LOGFILE"
else
	echo "$(date): Backup of $SOURCE failed!" >> "$LOGFILE"
	cat tar_error.log >> "$LOGFILE"
	exit 1
fi

echo "Backup done. See $LOGFILE."