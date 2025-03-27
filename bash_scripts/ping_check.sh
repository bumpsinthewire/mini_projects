#!/bin/bash
# ping_check.sh - Ping hosts and log failures

# Check if hosts are provided
if [ -z "$1" ]; then
	echo "Usage: $0 <host1> <host2> ..."
	exit 1
fi

# Log file
LOGFILE="ping_log.txt"

# Loop through hosts and ping
for HOST in "$@"; do
	ping -c 4 "$HOST" > /dev/null 2>&1
	if [ $? -ne 0 ]; then
		echo "$(date): $HOST failed to respond" >> "$LOGFILE"
	else
		echo "$(date): $HOST is up" >> "$LOGFILE"
	fi
done

echo "Ping check complete. Results logged to $LOGFILE."