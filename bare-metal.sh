#!/bin/bash
set -e

# Variables
GITHUB_REPO_URL="https://github.com/lprior-repo/dotfiles.git"
DEST_PATH="$HOME/src/dotfiles"          # Use $HOME to ensure proper expansion
ANSIBLE_PLAYBOOK="$DEST_PATH/setup.yml"  # Path to your Ansible playbook

echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "Installing dependencies..."
sudo apt install -y git python3 python3-pip ansible

echo "Cloning or updating the repository..."
# Ensure the parent directory exists
mkdir -p "$(dirname "$DEST_PATH")"

# Clone or update the repository
if [ -d "$DEST_PATH/.git" ]; then
    echo "Repository already exists. Pulling latest changes..."
    git -C "$DEST_PATH" pull
else
    echo "Cloning repository..."
    git clone "$GITHUB_REPO_URL" "$DEST_PATH"
fi

echo "Files have been successfully pulled down to $DEST_PATH!"

echo "Running the Ansible playbook..."
ansible-playbook "$ANSIBLE_PLAYBOOK" --ask-become-pass

echo "Setup is complete!"
