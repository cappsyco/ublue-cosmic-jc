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

# tzyfetch
curl --retry 3 -Lo /tmp/tzyfetch.tar.gz "https://github.com/cappsyco/tzyfetch/archive/refs/tags/1.0.0.tar.gz"
tar -xzf /tmp/tzyfetch.tar.gz -C /tmp
mv /tmp/tzyfetch-1.0.0/tzyfetch.sh /usr/bin/tzyfetch
chmod 0755 /usr/bin/tzyfetch


## SERVICES

systemctl enable podman.socket
