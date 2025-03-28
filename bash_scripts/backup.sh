#!/bin/bash
# backup.sh - Automate directory backup with tar

# Source directory to back up (adjust as needed)
SOURCE="/home/bumpsinthewire/testdir"

# Backup destination directory
BACKUP_DIR="/backups"

# Log file
LOGFILE="backup_log.txt"

# Timestamp for unique filename
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

# Create the backup
tar -czf "$BACKUP_FILE" "$SOURCE" 2>/dev/null
if [ $? -eq 0 ]; then
	echo "$(date): Backup of $SOURCE to $BACKUP_FILE successful" >> "$LOGFILE"
else
	echo "$(date): Backup of $SOURCE failed!" >> "$LOGFILE"
	exit 1
fi

echo "Backup done. See $LOGFILE."