#!/bin/bash

# Set variables
LOG_DIR="/var/log/"
ARCHIVE_DIR="/var/log/archive/"
HTML_DIR="/var/www/html/"
LOG_TYPE="httpd-logs"

# Check if inventory file exists
if [ ! -f "${HTML_DIR}inventory.html" ]; then
    # Create inventory file with header row
    echo -e "Log Type\tDate Created\tType\tSize" > "${HTML_DIR}inventory.html"
fi

# Get metadata of archived logs
LOG_FILE="${LOG_TYPE}-$(date +%d%m%Y-%H%M%S).tar"
ARCHIVE_FILE="${ARCHIVE_DIR}${LOG_FILE}"
ARCHIVE_SIZE=$(du -h "${ARCHIVE_FILE}" | cut -f1)

# Append metadata to inventory file
echo -e "${LOG_TYPE}\t$(date)\ttar\t${ARCHIVE_SIZE}" >> "${HTML_DIR}inventory.html"

# Create cron job file if not exists
if [ ! -f "/etc/cron.d/automation" ]; then
    # Create cron job file to run automation.sh every day at midnight
    echo -e "0 0 * * * root /root/Automation_Project/automation.sh" > "/etc/cron.d/automation"
fi
