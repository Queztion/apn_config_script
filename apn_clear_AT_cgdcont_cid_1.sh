#!/bin/bash

# Clear 5G apn leftover so 4G apn can be used properly.
#mmcli -m any --command='AT+cgdcont=4'


# ANSI escape code for light green
LIGHT_GREEN='\033[1;32m'


# Check currrent APN:
mmcli -m any --command='AT+cgdcont?'


# Prompt user for CID index number
read -p "Enter the CID index number to clear APN (e.g., 1): " cid

# Validate input (optional)
if ! [[ "$cid" =~ ^[0-9]+$ ]]; then
  echo "Invalid input. Please enter a numeric CID index."
  exit 1
fi

# Send AT command to clear APN for the given CID
echo "Sending command: AT+CGDCONT=$cid"

mmcli -m any --command="AT+CGDCONT=$cid"


NC='\033[0m' # No Color (reset)


#echo -e "AT+CGDCONT=$cid\r" > /dev/ttyUSB0

# Optional: Add delay or confirmation
#sleep 1
#echo "APN configuration for CID $cid cleared."





