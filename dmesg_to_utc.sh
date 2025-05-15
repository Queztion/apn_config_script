#!/bin/bash

boot_time=$(awk '{print $1}' /proc/uptime)

while IFS= read -r line; do
  if [[ "$line" =~ ^\[[[:space:]]*([0-9]+\.[0-9]+)\] ]]; then
    timestamp_relative="${BASH_REMATCH[1]}"
    timestamp_epoch=$(echo "$(date +%s) - $boot_time + $timestamp_relative" | bc)
    timestamp_utc=$(date -u -d "@$timestamp_epoch" "+%Y-%m-%dT%H:%M:%SZ")
    echo "${line/[\[]*/[$timestamp_utc]}"
  else
    echo "$line"
  fi
done < dmesg.log
