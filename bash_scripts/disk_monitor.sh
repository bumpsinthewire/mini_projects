#!/bin/bash
# disk_monitor.sh - Check disk usage and log if over 80%

# Log file
LOGFILE="disk_log.txt"

# Get disk usage for root filesystem (%), skip header
USAGE=$(df -h / | tail -n 1 | awk '{print $5}' | tr -d '%')

# Check if usage exceeds 80%
if [ "$USAGE" -gt 80 ]; then
	echo "$(date): Disk usage at $USAGE% - OVER 80%!" >> "$LOGFILE"
else
	echo "$(date): Disk usage at $USAGE% - all good" >> "$LOGFILE"
fi

echo "Disk check done. See $LOGFILE."