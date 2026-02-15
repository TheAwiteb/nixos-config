#!/usr/bin/env bash

# --- GPU Temperature ---
GPU_TEMP="N/A"

if command -v nvidia-smi &> /dev/null; then
    GPU_TEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)
    # Check if we got a valid temperature
    if [[ "$GPU_TEMP" =~ ^[0-9]+$ ]]; then
        echo -n "  ${GPU_TEMP}°C"
        exit 0
    fi
fi

# If no GPU info found
echo -n "  ${GPU_TEMP}"
