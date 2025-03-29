#!/bin/bash
# log_monitor.sh - Monitor a log file for specific patterns and send an alert if found.

# Log file to monitor
LOG="/var/log/syslog" # Or /var/log/messages, depending on your system

# Output log
OUTPUT="error_log.txt"

# Check last 100 lines for "error"
if tail -n 100 "$LOG" | grep -q "error"; then
	# If found, append to output log
	echo "$(date): Error found in $LOG" >> "$OUTPUT"
	echo "Error found and logged."
else
	echo "No errors found."
fi