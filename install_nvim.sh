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

## If already in .config folder move to root folder and then start the process
cd ~/.config/nvim
if [[ $? == 1 ]]; then
  cd ..
  mv nvim ~
fi

if [[ "$1" == "--win" ]]; then
    info "Installing neovim"
    winget install Neovim.Neovim
else
    info "Installing neovim"
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux64.tar.gz
    rm -rf nvim-linux64.tar.gz
    export PATH="$PATH:/opt/nvim-linux64/bin"
fi

# Arch Linux prerequisites
if [[ $(uname -r) == *"arch" ]]; then
  sudo pacman -S git base-devel cmake unzip ninja tree-sitter curl neovim
 else
	 info "Installing Cargo"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  if [[ "$1" == "--win" ]]; then
  else
    source $HOME/.cargo/env
  fi
fi

info "Installing Tree-sitter and language servers"
cargo install tree-sitter-cli stylua
npm i -g eslint_d prettier @tailwindcss/language-server cssmodules-language-server
wget https://bootstrap.pypa.io/get-pip.py
python3 ./get-pip.py
pip install flake8

# Only move the nvim folder to .config if it doesn't already exist
if [[ ! -d ~/.config/nvim ]]; then
  info "Moving nvim folder to ~/.config"
  mkdir -p ~/.config/nvim
  mv nvim/ ~/.config/
else
  info "nvim folder already exists in ~/.config, skipping move."
fi

nvim -c "so $MYVIMRC"
