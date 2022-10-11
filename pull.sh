#!/bin/bash

pull="$(git pull)"

if [[ "$pull" == *"up to date"* ]]; then
    exit 0
else
    git pull
    cp dotfiles/.config/nvim/* home/$USER/.congi/nvim/
    cp dotfiles/.config/kitty/* home/$USER/.congi/kitty/
fi


