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
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

echo "export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" 
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh""

#VSCode
sudo apt install code

#Postman
curl -o postman.tar.gz https://dl.pstmn.io/download/latest/linux64
tar -xzf postman.tar.gz
sudo mkdir -p /opt/apps/
sudo mv Postman /opt/apps/
sudo ln -s /opt/apps/Postman/Postman /usr/local/bin/postman
rm -rf postman.tar.gz
