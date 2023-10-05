#!/bin/bash

# V
 savedir=~/github
# Setting up the main nix Configuration file
mkdir $savedir

cp /etc/nixos/configuration.nix $savedir
cp ~/.config/hypr/hyprpaper.conf $savedir
cp ~/.config/hypr/hyprland.conf $savedir

cp -r ~/.config/waybar $savedir

cd $savedir
git add ./
read -p "what is the commit message W- for working and B- for broken: " commit_message
git commit -m $commit_message
git push origin main
