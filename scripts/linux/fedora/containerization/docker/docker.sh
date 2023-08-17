#!/usr/bin/env bash

print_block "Fedora - Containerization/Docker"

if [ ! -f /etc/yum.repos.d/docker-ce.repo ]; then
    echo "Создается файл репозитория для Docker..."
    sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
fi

echo "Проверка обновлений пакетов для Docker..."
sudo dnf check-update

if ! rpm -q docker-ce &> /dev/null || ! rpm -q docker-ce-cli &> /dev/null || ! rpm -q containerd.io &> /dev/null; then
    echo "Установка пакетов Docker..."
    sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
fi

echo "Запуск службы Docker..."
sudo systemctl start docker
sudo systemctl enable docker

if ! groups | grep -q docker; then
    echo "Добавление пользователя в группу docker..."
    sudo groupadd docker && sudo gpasswd -a ${USER} docker && sudo systemctl restart docker
    newgrp docker
fi

