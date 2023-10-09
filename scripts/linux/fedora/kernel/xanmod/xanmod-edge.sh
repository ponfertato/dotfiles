#!/usr/bin/env bash

print_block "Fedora - Kernel/Xanmod Edge"

if dnf repolist | grep -q "sentry/kernel-fsync"; then
    sudo dnf config-manager --disable sentry/kernel-fsync
fi

if ! dnf repolist | grep -q "rmnscnce/kernel-xanmod"; then
    yes | sudo dnf copr enable rmnscnce/kernel-xanmod
    sudo dnf update --refresh
fi

packages=(
    kernel-xanmod-edge
)
install_or_update_packages
