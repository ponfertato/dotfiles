#!/usr/bin/env bash

print_block "Fedora - Utilities"

packages=(
	conky
	java-latest-openjdk-headless
	neofetch
	python3
	openssl
	unrar
	gnome-tweaks
)
install_or_update_packages
