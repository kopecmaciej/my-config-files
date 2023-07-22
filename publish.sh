#!/bin/bash

rsync -a ~/.config/starship.toml ./dotfiles/.config/
rsync -a ~/.config/nvim/lua ./dotfiles/.config/nvim/
rsync -a ~/.config/fish/config.fish ./dotfiles/.config/fish

git add .

echo "Enter commit message"
read commitmsg

git commit -m "$commitmsg"

git push 
