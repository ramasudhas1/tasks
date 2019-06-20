#!/bin/bash
#
# This script will download and install helm and tiller on kuberentes

curl -O https://get.helm.sh/helm-v2.14.1-linux-amd64.tar.gz
tar -xvf helm-v2.14.1-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
helm init --service-account tiller
kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
helm init --service-account tiller --upgrade
