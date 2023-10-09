#!/usr/bin/env bash

print_block "Fedora - Remoteness/AnyDesk"

if [ ! -f "/etc/yum.repos.d/AnyDesk-RHEL.repo" ]; then
  sudo tee /etc/yum.repos.d/AnyDesk-RHEL.repo <<EOF
[anydesk]
name=AnyDesk RHEL - stable
baseurl=http://rpm.anydesk.com/rhel/\$basearch/
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://keys.anydesk.com/repos/RPM-GPG-KEY
EOF
    echo "Репозиторий AnyDesk-RHEL успешно добавлен"
else
    echo "Репозиторий AnyDesk-RHEL уже добавлен"
fi

packages=(
    anydesk
)
install_or_update_packages
