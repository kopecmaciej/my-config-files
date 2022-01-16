#!/bin/bash

# tab width
tabs 4
clear

#Basic 
sudo apt update; sudo apt upgrade -y

#Git
sudo apt install git

#Nodejs
sudo apt install npm

#NVM
#TODO: add script

#VSCode
sudo apt install code

#Postman
tar -xzf Postman-linux-x64-7.32.0.tar.gz
sudo mkdir -p /opt/apps/
sudo mv Postman /opt/apps/
sudo ln -s /opt/apps/Postman/Postman /usr/local/bin/postman
postman
