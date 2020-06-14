#!/bin/bash

#NFS
sudo apt update
sudo apt install -y nfs-kernel-server
sudo adduser mpiuser --uid 999
sudo usermod -aG sudo mpiuser
sudo echo '/home/mpiuser *(rw,sync,no_subtree_check)' >> /etc/exports
sudo cd /home/mpiuser
sudo -H -u mpiuser bash -c 'ssh-keygen' 
sudo -H -u mpiuser bash -c 'ssh-copy-id localhost' 

#DOCKER
sudo apt install -y  apt-transport-https ca-certificates curl gnupg-agent software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
