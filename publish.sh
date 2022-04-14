#!/bin/bash

cp ~/.config/nvim/init.vim ~/.config/nvim/coc-settings.json dotfiles/.config/nvim/   

git add .

echo "Enter commit message"
read commitmsg

git commit -m "$commitmsg"

git push 
