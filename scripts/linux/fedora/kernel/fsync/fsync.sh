#!/usr/bin/env bash

print_block "Fedora - Kernel/Fsync"

if dnf repolist | grep -q "rmnscnce/kernel-xanmod"; then
    sudo dnf config-manager --disable rmnscnce/kernel-xanmod
fi

if ! dnf repolist | grep -q "sentry/kernel-fsync"; then
    sudo dnf copr enable sentry/kernel-fsync --accept
fi

packages=(
	kernel-fsync
)
install_or_update_packages