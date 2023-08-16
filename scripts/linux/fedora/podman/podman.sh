#!/usr/bin/env bash

print_block "Fedora - Podman"

if rpm -qa | grep -q "^podman"; then
    echo "Обноление пакетов Podman..."
    sudo dnf -y upgrade podman
else
    echo "Установка пакетов Podman..."
    sudo dnf -y install podman
fi
