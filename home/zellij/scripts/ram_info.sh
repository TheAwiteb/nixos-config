#!/usr/bin/env bash

# Ensure `free` command exists
if ! command -v free &> /dev/null; then
    echo -n ": N/A"
    exit 1
fi

RAM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
RAM_USED=$(free -m | awk '/Mem:/ {print $3}')

if [ -n "$RAM_TOTAL" ] && [ "$RAM_TOTAL" -ne 0 ]; then
    RAM_PERCENT=$(awk "BEGIN {printf \"%.0f\", ($RAM_USED / $RAM_TOTAL) * 100}")
else
    RAM_PERCENT="N/A"
fi

if [ -n "$RAM_USED" ] && [ -n "$RAM_TOTAL" ]; then
    echo -n ": ${RAM_USED}/${RAM_TOTAL} MB (${RAM_PERCENT}%)"
else
    echo -n ": N/A"
fi
