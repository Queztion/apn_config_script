#!/bin/bash
<<<<<<< HEAD

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

echo "" | tee -a $OUTPUT_FILE

echo "$PRODUCT_NAME:" | tee -a $OUTPUT_FILE
cat $PRODUCT_NAME | tee -a $OUTPUT_FILE
echo "CRC32 checksum value for PRODUCT_NAME:" | tee -a $OUTPUT_FILE
crc32 $PRODUCT_NAME | tee -a $OUTPUT_FILE


echo "" | tee -a $OUTPUT_FILE

echo "$PRODUCT_SKU:" | tee -a $OUTPUT_FILE
cat $PRODUCT_SKU | tee -a $OUTPUT_FILE
echo "CRC32 checksum value for PRODUCT_SKU:" | tee -a $OUTPUT_FILE
crc32 $PRODUCT_SKU | tee -a $OUTPUT_FILE

=======

# Script to calculate the CRC32 checksum of 
# /sys/class/dmi/id/sys_vendor
# /sys/class/dmi/id/product_name
# sys/class/dmi/id/product_sku


#set -x # Enable debugging: Prints each command before execution

OUTPUT_FILE="sys_vendor_crc32.txt"
SYS_VENDOR=/sys/class/dmi/id/sys_vendor
PRODUCT_NAME=/sys/class/dmi/id/product_name
PRODUCT_SKU=/sys/class/dmi/id/product_sku

SYS_VENDOR_CRC32=""
PRODUCT_NAME_CRC32=""
PRODUCT_SKU_CRC32=""


echo "$SYS_VENDOR:" | tee $OUTPUT_FILE
cat $SYS_VENDOR | tee -a $OUTPUT_FILE
echo "CRC32 checksum value for SYS_VENDOR:" | tee -a $OUTPUT_FILE
SYS_VENDOR_CRC32=$(crc32 $SYS_VENDOR) 
echo $SYS_VENDOR_CRC32 | tee -a $OUTPUT_FILE

echo "" | tee -a $OUTPUT_FILE

echo "$PRODUCT_NAME:" | tee -a $OUTPUT_FILE
cat $PRODUCT_NAME | tee -a $OUTPUT_FILE
echo "CRC32 checksum value for PRODUCT_NAME:" | tee -a $OUTPUT_FILE
PRODUCT_NAME_CRC32=$(crc32 $PRODUCT_NAME) 
echo $PRODUCT_NAME_CRC32 | tee -a $OUTPUT_FILE


echo "" | tee -a $OUTPUT_FILE

echo "$PRODUCT_SKU:" | tee -a $OUTPUT_FILE
cat $PRODUCT_SKU | tee -a $OUTPUT_FILE
echo "CRC32 checksum value for PRODUCT_SKU:" | tee -a $OUTPUT_FILE
PRODUCT_SKU_CRC32=$(crc32 $PRODUCT_SKU) 
echo $PRODUCT_SKU_CRC32 | tee -a $OUTPUT_FILE

echo "" | tee -a $OUTPUT_FILE

echo "Your ISH file name will be: ish_lnlm_"$SYS_VENDOR_CRC32"_"$PRODUCT_NAME_CRC32"_"$PRODUCT_SKU_CRC32".bin" | tee -a $OUTPUT_FILE
>>>>>>> fa831bb ( On branch main)
