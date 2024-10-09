#!/bin/bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common.sh"

info "Installing Hack Nerd Fonts"
if [[ $(uname -r) == *"arch" ]]; then
  sudo pacman -S fontconfig
else
  sudo apt-get install fontconfig
fi

mkdir tmp
curl -LO "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip"
unzip -q ./Hack.zip -d tmp
cd tmp
FONTS_FOLDER="$HOME/.local/share/fonts/"
if [[ -d "$FONTS_FOLDER" ]]; then
  cp *.ttf "$FONTS_FOLDER"
else
  mkdir "$FONTS_FOLDER"
  cp *.ttf "$FONTS_FOLDER"
fi
export PATH="$PATH:$FONTS_FOLDER"
fc-cache -fv
fc-list | grep Hack
cd ..
rm -rf tmp Hack.zip
info "Hack Nerd Fonts installed."
