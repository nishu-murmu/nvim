#!/bin/bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common.sh"

info "Installing utilities packages"

if [[ $(uname -r) == *"arch" ]]; then
  is_installed() {
    pacman -Qi "$1" &>/dev/null
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
  is_installed() {
    dpkg -l "$1" &>/dev/null
  }

  # Update package list
  sudo apt-get update
  packages=("fd" "ripgrep" "unzip" "black" "flake8")

  for package in "${packages[@]}"; do
    if ! is_installed "$package"; then
      info "Installing $package"
      install_apt_packages "$package"
    else
      info "$package is already installed"
    fi
  done
  sudo ln -s "$(which fdfind)" /usr/local/bin/fd

  # Install black using pip3
  if ! command -v black &>/dev/null; then
    info "Installing black"
    sudo pip3 install black
  else
    info "black is already installed"
  fi

  # Install flake8 using pip3
  if ! command -v flake8 &>/dev/null; then
    info "Installing flake8"
    sudo pip3 install flake8
  else
    info "flake8 is already installed"
  fi
fi
