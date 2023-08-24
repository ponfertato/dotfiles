#!/usr/bin/env bash

print_block "Fedora - Utilities"

packages=(
	conky
	git-all
	gnome-tweaks
	java-latest-openjdk-headless
	neofetch
	nodejs
	openssl
	python3
	unrar
	wget
)
install_or_update_packages
