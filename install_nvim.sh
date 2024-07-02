#!/bin/bash


# Arch Linux prerequisites
if [[ $(uname -r) == *"arch" ]]; then
  echo 'gone inside'
  sudo pacman -S git base-devel cmake unzip ninja tree-sitter curl neovim
else
  echo "[[ installing cargo: ]]"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  echo "[[ installing tree-sitter-cli: ]]"
  cargo install tree-sitter-cli
fi

cd ../
mv nvim/ ~/.config/

nvim -c "so $MYVIMRC"
nvim -c ":q"
nvim -c "PackerSync"
nvim -c ":q"
