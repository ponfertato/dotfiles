#!/usr/bin/env bash

print_block "Fedora - Editors/Neovim"

packages=(
    neovim
    python3-neovim
)
install_or_update_packages
