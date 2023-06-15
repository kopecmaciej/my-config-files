#!/bin/bash

# tab width
tabs 4
clear

#Basic 
sudo apt update; sudo apt upgrade -y

#Steam
sudo apt install steam

#Discord
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i discord.deb
sudo apt -f install 
rm discord.deb
