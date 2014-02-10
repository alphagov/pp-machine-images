#!/bin/bash

mkdir ~/.ssh
wget -qO- https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub >> ~/.ssh/authorized_keys
echo 'vagrant ALL=NOPASSWD:ALL' >> /etc/sudoers
