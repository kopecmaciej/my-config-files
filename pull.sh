#!/bin/bash

pull="$(git pull)"

if [[ "$pull" == *"up to date"* ]]; then
    exit 0
else
    git pull
    cp dotfiles/.config/fish/config.fish home/$USER/.config/fish/
    cp dotfiles/.config/lvim/config.lua home/$USER/.config/lvim/
fi

# Install Copilot
if [ ! -d ~/.local/share/lunarvim/site/pack/github/start/copilot.vim ]; then
  git clone https://github.com/github/copilot.vim.git ~/.local/share/lunarvim/site/pack/github/start/copilot.vim
fi

