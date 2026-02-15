#!/usr/bin/env bash

# --- CPU Temperature ---
# Fetches "Package id 0" core temperature from lm-sensors.
# Adjust the `grep` pattern if "Package id 0" isn't the correct label for your CPU package temperature.
# Some systems might use 'Core 0', 'Tdie', etc.
CPU_TEMP=$(sensors | grep 'Package id' | awk '{print $4}' | sed 's/[^0-9.]//g')

# Fallback if no temperature is found
if [ -z "$CPU_TEMP" ]; then
    CPU_TEMP="N/A"
fi

# --- CPU Usage (%) ---
# This method calculates usage over a 1-second interval by reading /proc/stat.
# It's more accurate for a dynamic display than a single snapshot.

# Get initial CPU stats
prev_idle=$(grep 'cpu ' /proc/stat | awk '{print $5}')
prev_total=$(grep 'cpu ' /proc/stat | awk '{print $2+$3+$4+$5+$6+$7+$8+$9+$10}')

# Wait for a short moment
sleep 0.2 # Reduced sleep to make it faster without too much overhead

# Get current CPU stats
current_idle=$(grep 'cpu ' /proc/stat | awk '{print $5}')
current_total=$(grep 'cpu ' /proc/stat | awk '{print $2+$3+$4+$5+$6+$7+$8+$9+$10}')

# Calculate usage
if [ -n "$prev_total" ] && [ -n "$current_total" ] && [ "$current_total" -ne "$prev_total" ]; then
    CPU_DATA=$(awk "BEGIN {print ($current_total-$prev_total-$current_idle+$prev_idle)*100/($current_total-$prev_total)}")
    CPU_USAGE=$(printf "%.0f" "$CPU_DATA")
else
    CPU_USAGE="0" # Default to 0 if initial calculations are invalid
fi

# Ensure usage is within reasonable bounds (0-100)
if (( $(echo "$CPU_USAGE < 0" | bc -l) )); then
    CPU_USAGE="0"
elif (( $(echo "$CPU_USAGE > 100" | bc -l) )); then
    CPU_USAGE="100"
fi

echo -n "  ${CPU_USAGE}%  ${CPU_TEMP}°C"
