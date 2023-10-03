#!/bin/bash

# Setting up the main nix Configuration file
sudo mv /etc/nixos/configuration.nix /etc/nixos/.oldConfiguration.nix
sudo mv ./configuration.nix /etc/nixos/configuration.nix

# Configuring hyprland and hyprpaper
mkdir ~/.config/hypr
mv ./hyprland.conf ~/.config/hypr
mv ./hyprpaper.conf ~/.config/hypr

# Configuring waybar
mkdir ~/.config/waybar
mv ./style.css ./.config/waybar/
mv ./config.jsonc ./.config/waybar/

# Update and rebuild the system
sudo nix-channel --update
sudo nixos-rebuild switch
