#!/bin/bash

cp -r ~/.config/nvim/init.lua ./dotfiles/.config/nvim
cp -r ~/.config/fish/config.fish ./dotfiles/.config/fish
# cp -r ~/.config/kitty ./dotfiles/.config/

git add .

echo "Enter commit message"
read commitmsg

git commit -m "$commitmsg"

git push 
