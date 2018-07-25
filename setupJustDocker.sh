#!/bin/bash

# remove cdrom from sources, optional and live with error
sudo perl -p -i -e "s/^deb cdrom/#deb cdrom/g" /etc/apt/sources.list

# install docker-ce
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update && sudo apt-get install -y docker-ce

# add user to docker group
sudo gpasswd -a $USER docker

echo "make sure to turn off swap in /etc/fstab"
echo "Logout and Login to have environment changes take effect"









