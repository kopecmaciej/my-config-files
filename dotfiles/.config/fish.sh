#!/bin/bash

aliases=(
  "k=kubectl" 
  "d=docker"
  "dcu=docker-compose up" 
  "dcd=docker-compose down"
)

for al in "${aliases[@]}"
do
  echo "alias $al" >> ~/.config/fish/config.fish

done
