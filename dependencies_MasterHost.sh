#!/bin/bash

#NFS
sudo apt update
sudo apt install -y nfs-kernel-server
sudo adduser mpiuser
sudo echo '/home/mpiuser *(rw,sync,no_subtree_check)' >> /etc/exports

#DOCKER
sudo apt install -y  apt-transport-https ca-certificates curl gnupg-agent software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y install docker-ce docker-ce-cli containerd.io
