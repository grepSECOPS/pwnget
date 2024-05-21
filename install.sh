#!/bin/bash

# Function to update and install packages
update_and_install() {
    echo "Updating package list..."
    sudo apt-get update

    echo "Upgrading installed packages..."
    sudo apt-get upgrade -y

    echo "Installing specified software packages..."
    SOFTWARE_PACKAGES=(
        git
        curl
        vim
        htop
        # Add any other packages you want to install here
    )

    for package in "${SOFTWARE_PACKAGES[@]}"; do
        sudo apt-get install -y "$package"
    done

    echo "Cleaning up unnecessary packages..."
    sudo apt-get autoremove -y
    sudo apt-get clean

    echo "System update and software installation completed successfully!"
}

# Check the current shell
if [[ "$SHELL" == */bash ]]; then
    echo "Running in bash shell"
    update_and_install
elif [[ "$SHELL" == */zsh ]]; then
    echo "Running in zsh shell"
    update_and_install
else
    echo "Unsupported shell: $SHELL"
    exit 1
fi

