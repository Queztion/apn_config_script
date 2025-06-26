#! /bin/bash

#!/bin/bash

# Script to calculate the CRC32 checksum of 
# /sys/class/dmi/id/sys_vendor
# /sys/class/dmi/id/product_name
# sys/class/dmi/id/product_sku


#set -x # Enable debugging: Prints each command before execution

OUTPUT_FILE="sys_vendor_crc32.txt"
SYS_VENDOR=/sys/class/dmi/id/sys_vendor
PRODUCT_NAME=/sys/class/dmi/id/product_name
PRODUCT_SKU=/sys/class/dmi/id/product_sku


echo "$SYS_VENDOR:" | tee $OUTPUT_FILE
cat $SYS_VENDOR | tee -a $OUTPUT_FILE
echo "CRC32 checksum value for SYS_VENDOR:" | tee -a $OUTPUT_FILE
crc32 $SYS_VENDOR | tee -a $OUTPUT_FILE

echo ""

echo "$PRODUCT_NAME:" | tee -a $OUTPUT_FILE
cat $PRODUCT_NAME | tee -a $OUTPUT_FILE
echo "CRC32 checksum value for PRODUCT_NAME:" | tee -a $OUTPUT_FILE
crc32 $PRODUCT_NAME | tee -a $OUTPUT_FILE


echo ""

echo "$PRODUCT_SKU:" | tee -a $OUTPUT_FILE
cat $PRODUCT_SKU | tee -a $OUTPUT_FILE
echo "CRC32 checksum value for PRODUCT_SKU:" | tee -a $OUTPUT_FILE
crc32 $PRODUCT_SKU | tee -a $OUTPUT_FILE


