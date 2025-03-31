#!/bin/bash

# Run as root (check if script is run with sudo)
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root." 1>&2
    exit 1
fi

# Update apt and upgrade the system
echo "Updating apt and upgrading the system..."
apt update && apt upgrade -y

# Install Docker
echo "Installing Docker..."
apt install -y docker.io

# Install vim and curl
echo "Installing vim and curl..."
apt install -y vim curl

# Add user 'evan' with home directory
echo "Adding user 'evan'..."
useradd -m evan

# Add 'evan' to the sudoers file with NOPASSWD
echo "Making 'evan' a sudoer..."
echo "evan  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Add 'evan' to the docker group
echo "Adding 'evan' to the docker group..."
usermod -aG docker evan

echo "Script execution completed."
