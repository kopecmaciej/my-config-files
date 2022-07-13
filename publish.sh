#!/bin/bash

cp -r ~/.config/nvim ./dotfiles/.config/   
cp -r ~/.config/kitty ./dotfiles/.config/   

git add .

echo "Enter commit message"
read commitmsg

git commit -m "$commitmsg"

git push 
