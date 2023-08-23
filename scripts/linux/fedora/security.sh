#!/usr/bin/env bash

print_block "Fedora - Security"

packages=(
	firewalld
	firewall-config
)
install_or_update_packages

if [[ $(systemctl is-active firewalld) == "inactive" ]]; then
	echo "Сервис firewalld выключен, включение..."
	sudo systemctl enable firewalld
	sudo systemctl start firewalld
else
	echo "Сервис firewalld включен"
fi
