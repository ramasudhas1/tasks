#!/bin/bash
#
#
#
#cd to guest-book directory 
 kubectl apply -f development_namespace.yaml
 kubectl apply -f redis-master-deployment.yaml
 kubectl apply -f  redis-master-service.yaml
 kubectl apply -f  redis-slave-deployment.yaml
 kubectl apply -f  redis-slave-service.yaml
 kubectl apply -f  redis-frontend-deployment.yaml
 kubectl apply -f redis-frontend-service.yaml
