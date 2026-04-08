#!/bin/bash
LOG_FILE="logs.txt"

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: $LOG_FILE not found."
    exit 1
fi

awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -rn | awk '{print $2}' | head -1
