#!/usr/bin/env bash

DISK_INFO=$(df -h --output=pcent,size,used,avail "/" | tail -n 1)

# Read the values
read -r PERCENTAGE TOTAL_SIZE USED_SIZE AVAILABLE_SIZE <<< "$DISK_INFO"

# Extract just the number from percentage string
PERCENTAGE_NUM=$(echo "$PERCENTAGE" | sed 's/%//')

# --- Icons ---
DISK_ICON="" # nf-fa-hdd_o or nf-mdi-harddisk

echo -n "󰋊 ${PERCENTAGE_NUM}% (${USED_SIZE}/${TOTAL_SIZE})"
