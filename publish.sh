#!/bin/bash

cp -r ~/.config/nvim ./dotfiles/.config/   

git add .

echo "Enter commit message"
read commitmsg

git commit -m "$commitmsg"

git push 
