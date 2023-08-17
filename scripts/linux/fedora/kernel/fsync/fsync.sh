#!/usr/bin/env bash

print_block "Fedora - Kernel/Fsync"

if ! dnf repolist | grep -q "sentry/kernel-fsync"; then
    sudo dnf copr enable sentry/kernel-fsync
fi

packages=(
	kernel-fsync
)
install_or_update_packages