#!/bin/bash

set arch "arch"

# Arch Linux prerequisites
if [[ $(uname -r) == *"$arch" ]];
then
  sudo pacman -S git base-devel cmake unzip ninja tree-sitter curl neovim
fi

cd ../
mv nvim/ ~/.config/
