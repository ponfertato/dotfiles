#!/usr/bin/env bash

print_block "Fedora - Zsh"

set -e

zsh_bin=$(grep /zsh$ /etc/shells | tail -1)

if [ "$zsh_bin" != "" ]; then
  sudo dnf -y upgrade zsh util-linux-user
else
  sudo dnf -y install zsh util-linux-user
  chsh -s $(grep /zsh$ /etc/shells | tail -1)
fi
