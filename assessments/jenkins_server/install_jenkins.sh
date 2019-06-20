#!/bin/bash
apt install docker.io -y 
systemctl enable docker


curl -O https://get.helm.sh/helm-v2.14.1-linux-amd64.tar.gz
tar -xvf helm-v2.14.1-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm

curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.14.0/bin/linux/amd64/kubectl
mv ./kubectl /usr/local/bin/kubectl;chmod 755 /usr/local/bin/kubectl

##helm init --client-only

##copy kubeconfig file to jenkins home directory 

###scp -rp ~root/.kube opsadmin@23.102.128.125:/tmp

wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update
apt-get install jenkins -y

