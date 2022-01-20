#!/bin/bash

pull="$(git pull)"

if [[ "$pull" == *"up to date"* ]]; then
    exit 0
else
    git pull
    cp dotfiles/.config/nvim/init.vim dotfiles/.config/nvim/coc-settings.json dotfiles/.config/nvim/    
fi


