#!/bin/bash

## system
echo "Packages - System"
sudo sh -c 'echo "defaultyes=True" >> /etc/dnf/dnf.conf'
sudo sh -c 'echo "fastestmirror=True" >> /etc/dnf/dnf.conf'
sudo sh -c 'echo "keepcache=True" >> /etc/dnf/dnf.conf'
sudo sh -c 'echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf'
sudo dnf install -y fedora-workstation-repositories
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf distro-sync
sudo dnf groupupdate -y core
sudo dnf groupupdate -y --best --allowerasing multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf install -y openssl java-latest-openjdk-headless

## security
# echo "Packages - Security"
# sudo dnf install -y clamav clamav-update
# sudo freshclam
# sudo systemctl enable clamav-freshclam.service --now
# sudo dnf install -y clamtk

sudo dnf install -y firewalld
sudo systemctl unmask firewalld
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --permanent --zone=public --add-service=kdeconnect
sudo firewall-cmd --reload
sudo dnf install -y firewall-config

## Visual Studio Code
echo "Packages - Visual Studio Code"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install -y code

## utilities
echo "Packages - Utilities"
sudo dnf install -y neofetch unrar gnome-tweaks

## themes
echo "Packages - Themes"
sudo dnf install -y gnome-shell-theme-flat-remix