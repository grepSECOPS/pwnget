#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Update the package list
echo "Updating package list..."
sudo apt-get update

# Upgrade all installed packages to their latest versions
echo "Upgrading installed packages..."
sudo apt dist-upgrade -y

# Install specified software packages
echo "Installing specified software packages..."
SOFTWARE_PACKAGES=(
    gh
    git
    curl
    nvim
    btop
    tldr
    thefuck
    w3m
    golang
    python3
    golang
    zsh

    # Add any other packages you want to install here
)

for package in "${SOFTWARE_PACKAGES[@]}"; do
    sudo apt-get install -y "$package"
done

# Clean up any unnecessary packages
echo "Cleaning up unnecessary packages..."
sudo apt-get autoremove -y
sudo apt-get clean

echo "System update and software installation completed successfully!"

