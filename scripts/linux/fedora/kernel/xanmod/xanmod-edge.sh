#!/usr/bin/env bash

print_block "Fedora - Kernel/Xanmod Edge"

if dnf repolist | grep -q "sentry/kernel-fsync"; then
    sudo dnf config-manager --disable sentry/kernel-fsync
fi

if ! dnf repolist | grep -q "sentry/kernel-fsync"; then
    yes | sudo dnf copr enable sentry/kernel-fsync
fi

packages=(
	kernel-xanmod-edge
)
install_or_update_packages