#!/bin/bash

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

