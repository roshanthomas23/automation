#!/bin/bash

# Initialize variables
s3_bucket="upgrad-roshan"
myname="Roshan"

# Perform package update
apt update -y

# Install apache2 package if not already installed
if ! dpkg -s apache2 > /dev/null 2>&1; then
  apt install apache2 -y
fi

# Ensure apache2 service is running and enabled
systemctl start apache2
systemctl enable apache2

# Create tar archive of apache2 access and error logs
timestamp=$(date '+%d%m%Y-%H%M%S')
tar -cvf /tmp/${myname}-httpd-logs-${timestamp}.tar /var/log/apache2/*.log

# Copy tar archive to S3 bucket
aws s3 cp /tmp/${myname}-httpd-logs-${timestamp}.tar s3://${s3_bucket}/${myname}-httpd-logs-${timestamp}.tar
