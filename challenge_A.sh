#!/bin/bash

# Create directories for each department
mkdir /Engineering
mkdir /Sales
mkdir /IS

# Create groups for each department
groupadd Engineering
groupadd Sales
groupadd IS

# Create administrative users for each department
useradd -m -s /bin/bash -g Engineering admin_engineering
useradd -m -s /bin/bash -g Sales admin_sales
useradd -m -s /bin/bash -g IS admin_is

# Create additional users for each department
useradd -m -s /bin/bash -g Engineering user1_engineering
useradd -m -s /bin/bash -g Engineering user2_engineering
useradd -m -s /bin/bash -g Sales user1_sales
useradd -m -s /bin/bash -g Sales user2_sales
useradd -m -s /bin/bash -g IS user1_is
useradd -m -s /bin/bash -g IS user2_is

# Set permissions for department directories
chown admin_engineering:Engineering /Engineering
chown admin_sales:Sales /Sales
chown admin_is:IS /IS

# Set permissions for department documents
touch /Engineering/document.txt
touch /Sales/document.txt
touch /IS/document.txt

chown admin_engineering:Engineering /Engineering/document.txt
chown admin_sales:Sales /Sales/document.txt
chown admin_is:IS /IS/document.txt

echo "This file contains confidential information for the department." > /Engineering/document.txt
echo "This file contains confidential information for the department." > /Sales/document.txt
echo "This file contains confidential information for the department." > /IS/document.txt

chmod 700 /Engineering/document.txt
chmod 700 /Sales/document.txt
chmod 700 /IS/document.txt
