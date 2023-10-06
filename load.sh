#!/bin/bash

# Setting up the main nix Configuration file
sudo mv /etc/nixos/configuration.nix /etc/nixos/.oldConfiguration.nix
sudo mv ./configuration.nix /etc/nixos/configuration.nix

# Configuring hyprland and hyprpaper
mkdir ~/.config/hypr
cp ./hyprland.conf ~/.config/hypr
cp ./hyprpaper.conf ~/.config/hypr

# Configuring waybar
mkdir ~/.config/waybar
cp ./style.css ~/.config/waybar/
cp ./config.jsonc ~/.config/waybar/

# Update and rebuild the system
sudo nix-channel --update
sudo nixos-rebuild switch

choiceFunction() {
read -p "Do you want to remove the files that were copyed [y:N]: " choice
if [$choice == y*]; then
rm configuration.nix hyprland.conf hyprpaper.conf style.css config.jsonc
else [$choice == n*]; then
	exit
else 
	choiceFunction()
fi
