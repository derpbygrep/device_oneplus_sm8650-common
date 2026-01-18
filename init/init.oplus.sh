#!/vendor/bin/sh
#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

for f in /sys/class/thermal/thermal_zone*; do
    type_file="$f/type"
    if [ -f "$type_file" ]; then
        read -r zone_type < "$type_file"
        if [ "$zone_type" = "oplus_thermal_ipa" ]; then
            zone_num="${f##*/thermal_zone}"
            setprop ro.vendor.oplus.ipa.thermalzone "$zone_num"
            exit 0
        fi
    fi
done

exit 0
