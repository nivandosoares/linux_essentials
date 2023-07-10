#!/bin/bash

# Create the archive directory in the user's home directory
mkdir -p ~/archive

# Create the backup directory in the user's home directory
mkdir -p ~/backup

# Archive files in /var/log ending with .log and save as log.tar in the archive directory
tar -cvf ~/archive/log.tar /var/log/*.log

# Remove path names from the archived files
tar -vf ~/archive/log.tar --transform='s#.*/##' --show-new-names

# List the contents of the archive without extracting
tar -tvf ~/archive/log.tar

# Extract the files to the backup directory
tar -xvf ~/archive/log.tar -C ~/backup
