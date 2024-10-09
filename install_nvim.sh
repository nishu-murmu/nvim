#!/bin/bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/utilities/common.sh"

## If already in .config folder move to root folder and then start the process
cd ~/.config/nvim
if [[ $? == 1 ]]; then
  cd ..
  mv nvim ~
fi

has_nvim=$(which nvim)
if [[ $? == 0 ]]; then
  echo "Neovim already installed in the system"
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
  sudo pacman -S
  packman_packages=("git" "base-devel" "cmake" "unzip" "ninja" "tree-sitter" "curl" "neovim")
  for cmd in "${packman_packages[@]}"; do
    install_pacman_packages "$cmd"
  done
else
  info "Installing Cargo"
  has_cargo=$(which cargo)
  if [[ $? == 0 ]]; then
    echo "Cargo already installed"
  else
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  fi
  source $HOME/.cargo/env
fi

info "Installing Tree-sitter and language servers"
# Check and install cargo packages
if ! command -v tree-sitter >/dev/null 2>&1; then
  info "Installing tree-sitter-cli"
  cargo install tree-sitter-cli
else
  info "tree-sitter-cli is already installed"
fi

if ! command -v stylua >/dev/null 2>&1; then
  info "Installing stylua"
  cargo install stylua
else
  info "stylua is already installed"
fi

# Check and install npm packages
if ! command -v npm >/dev/null 2>&1; then
  info "npm is not installed. Please install Node.js and npm first."
  exit 1
fi

declare -A npm_packages
npm_packages=(
  ["eslint_d"]="eslint_d"
  ["prettier"]="prettier"
  ["tailwindcss-language-server"]="@tailwindcss/language-server"
  ["cssmodules-language-server"]="cssmodules-language-server"
)

for cmd in "${!npm_packages[@]}"; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    info "Installing ${npm_packages[$cmd]}"
    npm install -g "${npm_packages[$cmd]}"
  else
    info "${npm_packages[$cmd]} is already installed"
  fi
done

# Check if pip is installed
if ! command -v pip >/dev/null 2>&1; then
  info "pip is not installed, installing pip"
  wget https://bootstrap.pypa.io/get-pip.py -O get-pip.py
  python3 get-pip.py --user
  rm get-pip.py
else
  info "pip is already installed"
fi

pip_packages=("tree-sitter-cli"
  "flake8"
  "pynvim")

for cmd in "${pip_packages[@]}"; do
  install_pip_packages "$cmd"
done

sudo cp ~/.local/bin/* /usr/local/bin/
export PATH="$PATH:/usr/lib/python3/dist-packages/"

sh "$SCRIPT_DIR/utilities/packages.sh"
sh "$SCRIPT_DIR/utilities/fonts.sh"

sleep 2
# Only move the nvim folder to .config if it doesn't already exist
if [[ ! -d ~/.config/nvim ]]; then
  info "Moving nvim folder to ~/.config"
  mkdir -p ~/.config/nvim
  mv nvim/ ~/.config/
else
  info "nvim folder already exists in ~/.config, skipping move."
fi

nvim -c "so $MYVIMRC"
