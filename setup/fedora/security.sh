#!/bin/bash

echo "Packages - Security"
# sudo dnf install -y clamav clamav-update
# sudo freshclam
# sudo systemctl enable clamav-freshclam.service --now
# sudo dnf install -y clamtk

sudo dnf install -y firewalld
sudo systemctl unmask firewalld
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --reload
sudo dnf install -y firewall-config

## gsconnect
sudo firewall-cmd --permanent --zone=public --add-service=kdeconnect
sudo firewall-cmd --reload

