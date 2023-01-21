#!/bin/bash

arch="arch"

# Arch Linux prerequisites
if [[ $(uname -r) == *"$arch" ]];
then
  sudo pacman -S git base-devel cmake unzip ninja tree-sitter curl neovim
fi

cd ~/.config/
git clone https://github.com/nishu-murmu/nvim.git 

