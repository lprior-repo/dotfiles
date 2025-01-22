#!/bin/bash
set -e

# Prompt for username
read -p "Enter the username to use: " USERNAME

# Variables
HOME_DIR="/home/$USERNAME"
GITHUB_REPO_URL="https://github.com/lprior-repo/dotfiles.git"
DEST_PATH="$HOME_DIR/src/dotfiles"          # Use provided username for path
ANSIBLE_PLAYBOOK="$DEST_PATH/setup.yml"    # Path to your Ansible playbook
BASHRC_PATH="$HOME_DIR/.bashrc"

# Ensure the user exists
if ! id "$USERNAME" &>/dev/null; then
    echo "Error: User $USERNAME does not exist."
    exit 1
fi

# Update system packages
echo "Updating system packages..."
if sudo apt update && sudo apt upgrade -y; then
    echo "System packages updated successfully."
else
    echo "Error: Failed to update system packages."
    exit 1
fi

# Install dependencies
echo "Installing dependencies..."
if sudo apt install -y git python3 python3-pip ansible build-essential; then
    echo "Dependencies installed successfully."
else
    echo "Error: Failed to install dependencies."
    exit 1
fi

# Install Homebrew
echo "Installing Homebrew..."
if ! command -v brew &>/dev/null; then
    su - "$USERNAME" -c '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
else
    echo "Homebrew is already installed."
fi

# Configure bashrc for Homebrew
echo "Setting up bashrc for $USERNAME..."
if ! grep -q 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' "$BASHRC_PATH"; then
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> "$BASHRC_PATH"
    su - "$USERNAME" -c 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
else
    echo "Homebrew environment is already configured in $BASHRC_PATH."
fi

# Clone or update the Git repository
echo "Cloning or updating the repository for $USERNAME..."
mkdir -p "$(dirname "$DEST_PATH")"  # Ensure the parent directory exists
if [ -d "$DEST_PATH/.git" ]; then
    echo "Repository already exists. Pulling latest changes..."
    su - "$USERNAME" -c "git -C \"$DEST_PATH\" pull"
else
    echo "Cloning repository..."
    su - "$USERNAME" -c "git clone \"$GITHUB_REPO_URL\" \"$DEST_PATH\""
fi

echo "Files have been successfully pulled down to $DEST_PATH!"

# Run the Ansible playbook
if [ -f "$ANSIBLE_PLAYBOOK" ]; then
    echo "Running the Ansible playbook as $USERNAME..."
    su - "$USERNAME" -c "ansible-playbook \"$ANSIBLE_PLAYBOOK\" --ask-become-pass"
else
    echo "Error: Ansible playbook not found at $ANSIBLE_PLAYBOOK"
    exit 1
fi

echo "Setup is complete!"
