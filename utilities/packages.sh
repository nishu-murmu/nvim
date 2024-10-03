#!/bin/bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common.sh"

info "Installing utilities packages"

if [[ $(uname -r) == *"arch" ]]; then
  # Function to check if a package is installed in Arch Linux
  is_installed() {
    pacman -Qi "$1" &> /dev/null
  }

  # Update package list
  sudo pacman -Sy

  packages=("fd" "ripgrep" "unzip" "black" "flake8")
  for package in "${packages[@]}"; do
    if ! is_installed "$package"; then
      info "Installing $package"
      sudo pacman -S --noconfirm "$package"
    else
      info "$package is already installed"
    fi
  done
else
  # Function to check if a package is installed in Debian/Ubuntu
  is_installed() {
    dpkg -l "$1" &> /dev/null
  }

  # Update package list
  sudo apt-get update

  # Install ripgrep
  if ! is_installed "ripgrep"; then
    info "Installing ripgrep"
    sudo apt-get install -y ripgrep
  else
    info "ripgrep is already installed"
  fi

  # Install unzip
  if ! is_installed "unzip"; then
    info "Installing unzip"
    sudo apt-get install -y unzip
  else
    info "unzip is already installed"
  fi

  # Install black using pip3
  if ! command -v black &> /dev/null; then
    info "Installing black"
    sudo pip3 install black
  else
    info "black is already installed"
  fi

  # Install flake8 using pip3
  if ! command -v flake8 &> /dev/null; then
    info "Installing flake8"
    sudo pip3 install flake8
  else
    info "flake8 is already installed"
  fi

  # Install fd-find and create alias to fd
  if ! command -v fdfind &> /dev/null; then
    info "Installing fd-find"
    sudo apt-get install -y fd-find
    # Create a symbolic link if fd doesn't exist
    if ! command -v fd &> /dev/null; then
      sudo ln -s "$(which fdfind)" /usr/local/bin/fd
      info "Created symbolic link for fd"
    fi
  else
    info "fd-find is already installed"
  fi
fi
