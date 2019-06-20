#!/bin/bash
##Grafana and prometheus will get installed in the monitoring namespace

helm install --name prometheus ../assessments/helm/prometheus --namespace monitoring
helm install --name grafana  ../assessments/helm/grafana --namespace monitoring

####### Efk will get installed on the efk namespace

helm install --name grafana  ../assessments/helm/grafana --namespace monitoring