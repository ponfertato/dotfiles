#!/usr/bin/env bash

print_block "Fedora - Neovim"

if rpm -qa | grep -q "^neovim"; then
    sudo dnf -y upgrade neovim
else
    sudo dnf -y install neovim
fi

if rpm -qa | grep -q "^python3-neovim"; then
    sudo dnf -y upgrade python3-neovim
else
    sudo dnf -y install python3-neovim
fi