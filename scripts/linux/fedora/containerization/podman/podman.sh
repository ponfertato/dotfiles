#!/usr/bin/env bash

print_block "Fedora - Containerization/Podman"

packages=(
    podman
)
install_or_update_packages
