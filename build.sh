#!/bin/bash

set -ouex pipefail

# enable copr
dnf5 -y copr enable ublue-os/staging

file="/tmp/packages.txt"
while read -r package; 
do
    if [ "$line" != "" ]; then
        echo -e "dnf5 -y install $line\n"
    fi
done <$file

# disable copr
dnf5 -y copr disable ublue-os/staging

# systemctl enable podman.socket
