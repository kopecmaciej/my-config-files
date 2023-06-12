#!/bin/bash

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

yay -S /
  spaceship-prompt /
  docker /
  docker-compose /
  go /
  k9s /
  yarn /
  slack-desktop /
  discord /
  brave-bin /
  lazygit /
  postman-bin /
  google-cloud-cli /
  google-cloud-cli-gke-auth-plugin /
  freeoffice /
  noto-fonts-emoji /
  --noconfirm
