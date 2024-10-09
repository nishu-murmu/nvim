#!/bin/bash
# Text formatting
BOLD='\033[1m'
UNDERLINE='\033[4m'

# Text colors
GREEN='\033[0;32m'
NC='\033[0m' # No Color

info() {
  echo -e "${GREEN}${BOLD}$1${NC}"
}

install_pacman_packages() {
  sudo pacman -S --needed "$1"
}

install_apt_packages() {
  if ! is_installed "$1"; then
    info "Installing $1"
    sudo apt-get install -y "$1"
  else
    info "ripgrep is already installed"
  fi
}

install_pip_packages() {
  if ! command -v "$1" >/dev/null 2>&1; then
    info "Installing $1"
    pip install --user "$1"
  else
    info "$1 is already installed"
  fi
}
