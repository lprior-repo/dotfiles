#!/bin/bash

# Update the system
sudo apt-get update

# Install required packages
sudo apt-get install -y software-properties-common build-essential curl unzip git apt-transport-https

# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Ansible
brew install ansible gcc

#Install Ansible Role for Brew Installs
ansible-galaxy collection install community.general

#call ansible playbook to do
