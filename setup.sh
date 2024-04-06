#!/bin/bash

nvimDir="$HOME/.config/nvim/"
dotfilesDir="$HOME/dotfiles/"

echo "Downloading dotfiles"
cd && git clone https://github.com/fulcain/dotfiles

echo "Downloading nvim config"
cd nvimDir && git clone https://github.com/fulcain/nvim-config
