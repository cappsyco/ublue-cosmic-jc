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
curl --retry 3 -Lo /tmp/starship.tar.gz "https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz"
tar -xzf /tmp/starship.tar.gz -C /tmp
install -c -m 0755 /tmp/starship /usr/bin


## SERVICES

# systemctl enable podman.socket
