#!/bin/bash

# This script monitors system memory and restarts a critical process if available memory drops below a defined threshold.

# Directory where the process control script is located
PROC_DIR="/opt/app/bin"

# Log file path
LOG_FILE="/var/log/process_monitor.log"

# Get available memory percentage
MEM_AVAILABLE=$(free | awk '/Mem:/ { printf "%.0f", ($7 / $2) * 100 }')

# Current timestamp
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Log current memory status
echo "$TIMESTAMP - Available memory: ${MEM_AVAILABLE}%" >> "$LOG_FILE"

# Threshold (in percentage)
THRESHOLD=5

# If available memory is below threshold, restart the process
if [ "$MEM_AVAILABLE" -le "$THRESHOLD" ]; then
    echo "$TIMESTAMP - Low memory detected. Restarting process..." >> "$LOG_FILE"

    cd "$PROC_DIR" || exit 1

    ./process_manager stop >> "$LOG_FILE" 2>&1
    ./process_manager start >> "$LOG_FILE" 2>&1

    echo "$TIMESTAMP - Process restart completed" >> "$LOG_FILE"
fi