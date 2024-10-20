#!/bin/bash

# Name of the output file
output_file="all_packets.pcap"

# Check if there are any .pcap files in the directory
if ls *.pcap 1> /dev/null 2>&1; then
    echo "Merging .pcap files into $output_file"
    # Use mergecap to combine all .pcap files and save the result into all_packets.pcap
    mergecap -a *.pcap -w "$output_file"

    # Check if the operation was successful
    if [[ $? -eq 0 ]]; then
        echo "Files successfully merged into $output_file."
    else
        echo "Error during file merging."
    fi
else
    echo "No .pcap files to merge."
fi
