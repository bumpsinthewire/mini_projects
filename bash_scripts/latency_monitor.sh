#!/bin/bash
# latency_monitor.sh - Monitor latency of a given URL and send an alert if it exceeds a threshold.

# Host to ping
HOST=${1:-"google.com"} # Default to google.com if no argument is provided
THRESHOLD=${2:-100} # Default threshold is 100ms if not provided

# Log file
LOGFILE="latency_log.txt"

# Ping and extract average latency (RTT avg from "min/avg/max")
PING_OUTPUT=$(ping -c 10 "$HOST" 2>/dev/null)
if [ $? -ne 0 ]; then
	echo "$(date): Ping to $HOST failed." >> "$LOGFILE"
	exit 1
fi

LATENCY=$(echo "$PING_OUTPUT" | grep "min/avg/max" | awk -F '/' '{print $5}')
if [ -z "$LATENCY" ]; then
	echo "$(date): Failed to extract latency from ping output." >> "$LOGFILE"
	exit 1
fi

# Compare to threshold (convert to integer for comparison)
if echo "$LATENCY > $THRESHOLD" | bc -l | grep -q 1; then
	echo "$(date): Latency to $HOST is $LATENCY ms - ABOVE $THRESHOLD ms!" >> "$LOGFILE"
else
	echo "$(date): Latency to $HOST is $LATENCY ms - all good" >> "$LOGFILE"
fi

echo "Latency check done. See $LOGFILE."