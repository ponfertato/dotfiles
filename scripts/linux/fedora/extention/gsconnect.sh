#!/usr/bin/env bash

print_block "Fedora - Extention/Gnome"

if sudo firewall-cmd --permanent --zone=public --query-service=kdeconnect >/dev/null; then
	echo "Правило для сервиса kdeconnect в зоне public уже включено"
else
	echo "Включение правила для сервиса kdeconnect в зоне public..."
	sudo firewall-cmd --permanent --zone=public --add-service=kdeconnect
	sudo firewall-cmd --reload
fi
