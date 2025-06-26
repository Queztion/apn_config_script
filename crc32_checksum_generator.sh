#! /bin/bash

SYS_VENDOR_VALUE=$(cat /sys/class/dmi/id/sys_vendor)
echo -n "$SYS_VENDOR_VALUE" | crc32
