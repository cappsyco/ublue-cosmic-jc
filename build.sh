#!/bin/bash

set -ouex pipefail


## PACKAGES

# enable copr
dnf5 -y copr enable ublue-os/staging

file="/tmp/packages.txt"
while read -r package; 
do
    if [ "$package" != "" ]; then
        echo -e "dnf5 -y install $package\n"
    fi
done <$file

# disable copr
dnf5 -y copr disable ublue-os/staging


## CUSTOM

# Starship
curl -sS https://starship.rs/install.sh | sh


## SERVICES

# systemctl enable podman.socket
