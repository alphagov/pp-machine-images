#!/bin/bash

apt-get -y install linux-headers-$(uname -r)
apt-get -y install dkms

mkdir /media/vbox
mount -o loop ~/VBoxGuestAdditions.iso /media/vbox
cd /media/vbox

sh ./VBoxLinuxAdditions.run --nox11

exit 0
