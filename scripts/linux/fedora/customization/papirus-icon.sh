#!/usr/bin/env bash

print_block "Fedora - Customization/Papirus Icon"

packages=(
    papirus-icon-theme
)
install_or_update_packages

gsettings set org.gnome.desktop.interface icon-theme 'Papirus'
