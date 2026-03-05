#!/bin/bash

# Function to display VM status
show_status() {
    # Dummy check for demo purposes
    local status="Healthy"
    echo "$status"
}

# Function to show detailed metrics
show_details() {
    # Dummy metrics for demo purposes
    echo "CPU Usage: 75%"
    echo "Memory Usage: 60%"
}

# Check for the explain parameter
if [[ "$1" == "explain" ]]; then
    show_details
else
    show_status
fi
