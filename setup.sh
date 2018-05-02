#!/bin/bash
# notes
# sudo apt-get install -y git
# git clone https://github.com/ragetti/dockerserver


# add dns for PV and google
echo "nameserver 10.25.0.122" | sudo tee -a /etc/resolvconf/resolv.conf.d/base
echo "nameserver 8.8.8.8" | sudo tee -a /etc/resolvconf/resolv.conf.d/base
sudo resolvconf -u

# add self signed certs for pv
#echo | openssl s_client -connect storage.googleapis.com:443 -showcerts > bundle.txt
#cat bundle.txt | awk '/BEGIN/ { i++; } /BEGIN/, /END/ { print > "pv" i ".crt" }'
#sudo cp pv*.crt /usr/local/share/ca-certificates/
#sudo update-ca-certificates


# get newest packages
sudo apt-get update
sudo apt-get install -y perl

# remove cdrom from sources, optional and live with error
sudo perl -p -i -e "s/^deb cdrom/#deb cdrom/g" /etc/apt/sources.list

# install opensshd
sudo apt-get install -y openssh-server

# install docker-ce
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update && sudo apt-get install -y docker-ce

# add user to docker group
sudo gpasswd -a $USER docker

# turn off swap, should be made permanent by editing /etc/fstab
sudo swapoff -a


echo "make sure to turn off swap in /etc/fstab"
echo "Logout and Login to have environment changes take effect"









