#!/usr/bin/env bash

print_block "Fedora - System"

if ! grep -q "defaultyes=True" /etc/dnf/dnf.conf; then
    echo "Добавление параметра defaultyes в файл dnf.conf..."
    sudo sh -c 'echo "defaultyes=True" >> /etc/dnf/dnf.conf'
fi
if ! grep -q "fastestmirror=True" /etc/dnf/dnf.conf; then
    echo "Добавление параметра fastestmirror в файл dnf.conf..."
    sudo sh -c 'echo "fastestmirror=True" >> /etc/dnf/dnf.conf'
fi
if ! grep -q "keepcache=True" /etc/dnf/dnf.conf; then
    echo "Добавление параметра keepcache в файл dnf.conf..."
    sudo sh -c 'echo "keepcache=True" >> /etc/dnf/dnf.conf'
fi
if ! grep -q "max_parallel_downloads=10" /etc/dnf/dnf.conf; then
    echo "Добавление параметра max_parallel_downloads в файл dnf.conf..."
    sudo sh -c 'echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf'
fi

if ! rpm -q fedora-workstation-repositories &> /dev/null; then
    echo "Установка fedora-workstation-repositories..."
    sudo dnf -y install fedora-workstation-repositories
fi

if ! rpm -q rpmfusion-free-release &> /dev/null || ! rpm -q rpmfusion-nonfree-release &> /dev/null; then
    echo "Установка rpmfusion репозиториев..."
    sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
fi

echo "Выполняется обновление системы..."
sudo dnf -y distro-sync

echo "Выполняется обновление группы core..."
sudo dnf groupupdate -y core

echo "Выполняется обновление группы multimedia..."
sudo dnf groupupdate -y --best --allowerasing multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
