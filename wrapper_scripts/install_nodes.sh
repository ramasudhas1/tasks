#!/bin/bash
#
# To set up slave nodes on kuberenets 
#
#
apt install docker.io -y
systemctl enable docker
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
apt install kubeadm -y
kubeadm join 192.168.0.20:6443 --token bxpi0l.77o47hmqqfcnp2j7     --discovery-token-ca-cert-hash sha256:0b2ba87e29b047a205133ac47b120280460aed99019d0079fddca06ac22249bf
#kubectl get nodes

