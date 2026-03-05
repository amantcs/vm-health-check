#!/bin/bash

# Default output is health status
show_health() {
    local cpu_usage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$3)} END {print usage}')
    local mem_usage=$(free | awk '/Mem/{printf("%.2f", $3/$2 * 100.0)}')
    local disk_usage=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')

    if (( $(echo "$cpu_usage < 70" | bc -l )) && (( $(echo "$mem_usage < 70" | bc -l )) && (( $disk_usage < 70 )) )); then
        echo "Healthy"
    else
        echo "Not Healthy"
    fi
}

# Explain function
show_explain() {
    local cpu_usage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$3)} END {print usage}')
    local mem_usage=$(free | awk '/Mem/{printf("%.2f", $3/$2 * 100.0)}')
    local disk_usage=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')

    echo "Health Status:"
    echo "CPU Usage: $cpu_usage%"
    echo "Memory Usage: $mem_usage%"
    echo "Disk Usage: $disk_usage%"

    if (( $(echo "$cpu_usage < 70" | bc -l )) && (( $(echo "$mem_usage < 70" | bc -l )) && (( $disk_usage < 70 )) )); then
        echo "Overall Status: Healthy"
    else
        echo "Overall Status: Not Healthy"
    fi
}

# Parse command line arguments
if [[ "$1" == "explain" ]]; then
    show_explain
else
    show_health
fi
