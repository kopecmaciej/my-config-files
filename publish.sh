#!/bin/bash

cp ~/.config/nvim/init.vim ~/.config/nvim/coc-settings.json dotfiles/.config/nvim/   

git add .

read commitmsg

git commit -m "$commitmsg"

git push 