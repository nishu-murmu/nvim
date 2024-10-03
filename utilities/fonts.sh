#!/bin/bash

echo "[[ installing Hack Nerd Fonts: ]]"
sudo apt-get install fontconfig
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
fc-cache -fv
fc-list | grep Hack

echo "[[ Hack Nerd Fonts Installed. ]]"
rm -rf tmp Hack.zip
