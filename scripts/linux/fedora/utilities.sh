#!/usr/bin/env bash

print_block "Fedora - Utilities"

packages=("conky" "gnome-tweaks" "java-latest-openjdk-headless" "neofetch" "openssl" "unrar")

for package in "${packages[@]}"; do
    if rpm -q "$package" >/dev/null; then
        echo "Пакет $package уже установлен, выполняется его обновление..."
        sudo dnf upgrade -y "$package"
    else
        echo "Пакет $package не найден, выполняется его установка..."
        sudo dnf install -y "$package"
    fi
done
