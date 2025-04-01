#!/bin/bash
# Script to set up SSH key authentication for a user with a specified public key file and remote host

if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <username> <public_key_filename> <remote_host>"
    exit 1
fi

USER_NAME=$1
PUB_KEY_FILE=$2
REMOTE_HOST=$3

# Check if the specified public key file exists
if [ ! -f ~/.ssh/$PUB_KEY_FILE ]; then
    echo "Public key file '$PUB_KEY_FILE' not found in ~/.ssh/. Please provide a valid public key file."
    exit 1
fi

echo "Setting up SSH key for $USER_NAME using key file $PUB_KEY_FILE on $REMOTE_HOST..."

# Ensure .ssh directory exists on the remote host
ssh $USER_NAME@$REMOTE_HOST "mkdir -p /home/$USER_NAME/.ssh"

# Copy the public key to the user's authorized_keys file
ssh-copy-id -i ~/.ssh/$PUB_KEY_FILE $USER_NAME@$REMOTE_HOST

echo "SSH key setup completed for $USER_NAME using the key '$PUB_KEY_FILE' on $REMOTE_HOST."
