#!/bin/bash

# Usage: ./vm-health-check.sh [--explain]  

EXPLAIN=false

if [[ "$1" == "--explain" ]]; then  
    EXPLAIN=true  
fi

check_cpu() {
    local cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\\([0-9.]*\)%* id.*/\
\1/" | awk '{print 100 - $1}')
    echo "CPU Usage: $cpu_usage%"
    if $EXPLAIN; then
        echo "This measures how much CPU is currently being used by processes."
    fi
}

check_memory() {
    local mem_info=$(free -m)
    local total_mem=$(echo "$mem_info" | awk 'NR==2{print $2}')
    local used_mem=$(echo "$mem_info" | awk 'NR==2{print $3}')
    echo "Memory Usage: $used_mem MB / $total_mem MB"
    if $EXPLAIN; then
        echo "This shows the current memory usage in megabytes."
    fi
}

check_disk() {
    local disk_usage=$(df -h / | grep / | awk '{ print $5 }')
    echo "Disk Usage: $disk_usage"
    if $EXPLAIN; then
        echo "This indicates the disk space usage for the root partition."
    fi
}

# Call the check functions
check_cpu
check_memory
check_disk