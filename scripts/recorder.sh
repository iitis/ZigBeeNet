#!/bin/bash

# Restart counter
restart_count=1

# Function that runs tshark
run_tshark() {
    echo "Starting tshark (attempt $restart_count)..."
    ((restart_count++))
    tshark -i cc2531 -b duration:3600 -w zigbee.pcap -I
}

# Function that handles the interrupt signal (Ctrl+C)
trap ctrl_c INT

# Function called when Ctrl+C is pressed
ctrl_c() {
    echo "Stopping script..."
    exit 0
}

# Main loop that restarts tshark in case of failure
while true
do
    run_tshark
    echo "tshark has stopped. Restarting..."
done
