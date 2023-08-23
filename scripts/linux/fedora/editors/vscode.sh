#!/usr/bin/env bash

print_block "Fedora - Editors/Visual Studio Code"

if ! rpm -q microsoft-gpg-keys &> /dev/null; then
	echo "Выполняется импорт ключа Microsoft..."
	sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
fi

if [ ! -f /etc/yum.repos.d/vscode.repo ]; then
	echo "Создается файл репозитория для Visual Studio Code..."
	sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
fi

packages=(
	code
)
install_or_update_packages
