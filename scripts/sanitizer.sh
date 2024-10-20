#!/bin/bash

# Iterate through all .pcap files in the current directory, sorted by oldest first
for file in $(ls -tr *.pcap); do
    # Check if the file exists
    if [[ -f "$file" ]]; then
        # Temporary file name with a prefix, e.g., "temp_"
        temp_file="temp_$file"

        echo "Repairing file: $file"

        # Call editcap with output saved to the temporary file
        editcap "$file" "$temp_file"

        # Check if the operation was successful
        if [[ $? -eq 0 ]]; then
            echo "File $file has been repaired."

            # Remove the original file
            rm "$file"

            # Rename the temporary file to the original file name
            mv "$temp_file" "$file"

            echo "Final file name: $file"
        else
            echo "Error repairing file $file."
            # Remove the temporary file if the repair failed
            rm "$temp_file"
        fi
    else
        echo "No .pcap files in the folder."
    fi
done
