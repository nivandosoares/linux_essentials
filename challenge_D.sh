#!/bin/bash

# Extract service names from /etc/services, remove non-alphabetical lines and blanks, and sort
grep -E '^[A-Za-z]' /etc/services | awk '{print $1}' | sort -u > ~/services.txt

# Count the number of lines in services.txt
line_count=$(wc -l < ~/services.txt)

# Print the line count and the first few lines of services.txt
echo "$line_count services.txt"
echo "-------------------------"
head ~/services.txt

# Print the last few lines of services.txt
echo "..."
echo "-------------------------"
tail ~/services.txt
