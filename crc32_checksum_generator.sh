#!/bin/bash

# Script to calculate the CRC32 checksum of 
# /sys/class/dmi/id/sys_vendor
# /sys/class/dmi/id/product_name
# sys/class/dmi/id/product_sku

# if crc32 is not found, install using:
# sudo apt install libarchive-zip-perl


#set -x # Enable debugging: Prints each command before execution

OUTPUT_FILE="sys_vendor_crc32.txt"
SYS_VENDOR=$(cat /sys/class/dmi/id/sys_vendor)
PRODUCT_NAME=$(cat /sys/class/dmi/id/product_name)
PRODUCT_SKU=$(cat /sys/class/dmi/id/product_sku)

# Can do it as one line 
# echo -n $(cat /sys/class/dmi/id/sys_vendor) | crc32 /dev/stdin
# but we prefer accessing the variables separately for clarity
SYS_VENDOR_CRC32=$(echo -n $SYS_VENDOR | crc32 /dev/stdin) 
# echo -n $(cat /sys/class/dmi/id/product_name) | crc32 /dev/stdin
PRODUCT_NAME_CRC32=$(echo -n $PRODUCT_NAME | crc32 /dev/stdin)
# echo -n $(cat /sys/class/dmi/id/product_sku) | crc32 /dev/stdin
PRODUCT_SKU_CRC32=$(echo -n $PRODUCT_SKU | crc32 /dev/stdin)


echo "SYS_VENDOR String Value: $SYS_VENDOR:" | tee $OUTPUT_FILE
echo "CRC32 checksum value for SYS_VENDOR:" | tee -a $OUTPUT_FILE
echo $SYS_VENDOR_CRC32 | tee -a $OUTPUT_FILE

echo "" | tee -a $OUTPUT_FILE

echo "PRODUCT_NAME String Value: $PRODUCT_NAME:" | tee -a $OUTPUT_FILE
echo "CRC32 checksum value for PRODUCT_NAME:" | tee -a $OUTPUT_FILE
echo $PRODUCT_NAME_CRC32 | tee -a $OUTPUT_FILE


echo "" | tee -a $OUTPUT_FILE

echo "PRODUCT_SKU String Value: $PRODUCT_SKU:" | tee -a $OUTPUT_FILE
echo "CRC32 checksum value for PRODUCT_SKU:" | tee -a $OUTPUT_FILE
echo $PRODUCT_SKU_CRC32 | tee -a $OUTPUT_FILE

echo "" | tee -a $OUTPUT_FILE

echo "Your ISH file name will be: ish_lnlm_"$SYS_VENDOR_CRC32"_"$PRODUCT_NAME_CRC32"_"$PRODUCT_SKU_CRC32".bin" | tee -a $OUTPUT_FILE
