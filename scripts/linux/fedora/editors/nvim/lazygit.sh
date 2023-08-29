#!/usr/bin/env bash

print_block "Fedora - Editors/Lazygit"

if ! dnf repolist | grep -q "atim/lazygit"; then
	yes | sudo dnf copr enable atim/lazygit
	sudo dnf update --refresh
fi

packages=(
	lazygit
)
install_or_update_packages
