#!/usr/bin/env bash

print_block "Fedora - Utilities"

packages=(
	conky
	gnome-tweaks
	java-latest-openjdk-headless
	neofetch
	nodejs
	openssl
	python3
	unrar
)
install_or_update_packages
