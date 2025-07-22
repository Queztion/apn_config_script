#!/usr/bin/env python3

import os
import re

# Mapping of HID sensor usage IDs to human-readable sensor types
sensor_type_map = {
    "200001": "Sensor Collection",
    "200073": "Accelerometer 3D",
    "200076": "Ambient Light Sensor",
    "200086": "Temperature Sensor",
    "20008a": "Humidity Sensor",
    "200083": "Magnetometer 3D",
    "20008e": "Pressure Sensor",
    "20008f": "Proximity Sensor",
    "2000b1": "Gyroscope 3D",
    "2000b4": "Gravity Sensor",
    "2000c1": "Linear Acceleration Sensor",
    "2000c2": "Rotation Vector Sensor",
    "2000e1": "Custom Sensor (Vendor-defined)",
    "INT-020b": "Vendor-specific/Internal Sensor"
}

def find_hid_sensors(base_path="/sys/devices"):
    sensor_info = []
    for root, dirs, files in os.walk(base_path):
        for dir_name in dirs:
            if "HID-SENSOR" in dir_name:
                usage_id_match = re.search(r"HID-SENSOR-([0-9a-fA-F]+|INT-\d+)", dir_name)
                if usage_id_match:
                    usage_id = usage_id_match.group(1)
                    sensor_type = sensor_type_map.get(usage_id, "Unknown Sensor Type")
                    full_path = os.path.join(root, dir_name)
                    sensor_info.append((full_path, usage_id, sensor_type))
    return sensor_info

def main():
    sensors = find_hid_sensors()
    if not sensors:
        print("No HID sensors found.")
    else:
        for path, usage_id, sensor_type in sensors:
            print("Path: {path}")
            print("  Usage ID: {usage_id}")
            print("  Sensor Type: {sensor_type}\n")

if __name__ == "__main__":
    main()
