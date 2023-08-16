#!/usr/bin/env bash

print_block "Fedora - Security"

if rpm -qa | grep -q "^firewall-config"; then
    sudo dnf -y upgrade firewall-config
else
    sudo dnf -y install firewalld
    sudo systemctl enable firewalld
    sudo systemctl start firewalld
fi

if sudo firewall-cmd --permanent --zone=public --query-service=kdeconnect; then
    echo "Правило для сервиса kdeconnect в зоне public уже включено"
else
    echo "Включение правила для сервиса kdeconnect в зоне public..."
    sudo firewall-cmd --permanent --zone=public --add-service=kdeconnect
    sudo firewall-cmd --reload
fi

if rpm -qa | grep -q "^firewall-config"; then
    sudo dnf -y upgrade firewall-config
else
    sudo dnf -y install firewall-config
fi
