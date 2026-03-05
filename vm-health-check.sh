#!/bin/bash

# vm-health-check.sh

# Check if 'explain' parameter is provided.
if [ "$1" == "explain" ]; then
    echo "This script checks the health of the virtual machine.";
    exit 0;
fi

# Print current date and time in UTC format
echo "Current Date and Time (UTC - YYYY-MM-DD HH:MM:SS formatted): $(date -u +'%Y-%m-%d %H:%M:%S')"
# Print current user's login
echo "Current User's Login: $(whoami)"