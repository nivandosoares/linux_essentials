#!/bin/bash

# Function to check if a group exists
group_exists() {
  grep -q "^$1:" /etc/group
}

# Function to check if a user exists
user_exists() {
  id -u "$1" >/dev/null 2>&1
}

# Function to create a new group
create_group() {
  if group_exists "$1"; then
    echo "Error: Group '$1' already exists."
    exit 1
  fi

  groupadd "$1"
  echo "Group '$1' created successfully."
}

# Function to create a new user
create_user() {
  if user_exists "$1"; then
    echo "Error: User '$1' already exists."
    exit 1
  fi

  useradd -m -s /bin/bash -g "$2" "$1"
  echo "User '$1' created successfully."

  read -sp "Enter password for '$1': " password
  echo
  echo "$1:$password" | chpasswd
  echo "Password set for '$1'."
}

# Function to create a directory for the user
create_user_directory() {
  mkdir "/$1"
  chown "$1:$2" "/$1"
  chmod 700 "/$1"
  echo "Directory '/$1' created successfully."
}

# Main script

# Prompt for group name
read -p "Enter a unique group name: " group_name
create_group "$group_name"

# Prompt for user name
read -p "Enter a unique username: " user_name
create_user "$user_name" "$group_name"

# Create directory for the user
create_user_directory "$user_name" "$group_name"

# Make the script executable
chmod +x "$0"
