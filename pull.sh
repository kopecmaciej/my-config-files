#!/bin/bash

pull="$(git pull)"

config_dirs=(
    ".config/fish/config.fish"
    ".config/lvim/config.lua"
    ".config/starship.toml"
)

if [[ "$pull" == *"up to date"* ]]; then
    exit 0
else
    git pull
    rsync -a dotfiles/.config/fish/config.fish home/$USER/.config/fish/
    rsync -a dotfiles/.config/lvim/config.lua home/$USER/.config/lvim/
    rsync -a dotfiles/.config/starship.toml home/$USER/.config/starship.toml
fi


