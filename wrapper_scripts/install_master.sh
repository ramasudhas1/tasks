#!/bin/bash
#
#This script is to run on the kubernetes master node

apt install docker.io
systemctl enable docker
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
apt install git curl -y
apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
apt install kubeadm
kubeadm init --pod-network-cidr=10.244.0.0/16 | tee /opt/kubeadm_init.log
#kubeadm join 192.168.0.20:6443 --token bxpi0l.77o47hmqqfcnp2j7 \
#kubectl get nodes
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
#kubectl get po --all-namespaces
#kubectl get nodes

