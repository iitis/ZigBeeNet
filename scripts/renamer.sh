#!/bin/bash

# Iterate through all files in the format zigbee_00001_20240924040332.pcap
for file in zigbee_*.pcap; do
    # Extract the number and date parts using a regular expression
    if [[ "$file" =~ zigbee_([0-9]+)_([0-9]+)\.pcap ]]; then
        number="${BASH_REMATCH[1]}"
        date="${BASH_REMATCH[2]}"
        # New file name
        new_name="zigbee_${date}_${number}.pcap"
        # Rename the file
        echo "Renaming: $file -> $new_name"
        mv "$file" "$new_name"
    else
        echo "File $file does not match the expected pattern."
    fi
done
