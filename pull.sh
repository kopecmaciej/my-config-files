#!/bin/bash

pull="$(git pull)"

config_dirs=(
    ".config/fish/config.fish"
    ".config/nvim/config.lua"
    ".config/starship.toml"
)

if [[ "$pull" == *"up to date"* ]]; then
    exit 0
else
    git pull
    rsync -a dotfiles/.config/fish/config.fish home/$USER/.config/fish/
    rsync -a dotfiles/.config/nvim home/$USER/.config/nvim/
    rsync -a dotfiles/.config/starship.toml home/$USER/.config/starship.toml
fi


