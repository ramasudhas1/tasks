#!/bin/bash
#
#

# cd  ../assessments/blue-green

kubectl apply  -f blue_deployment.yaml
kubectl apply  -f blue_service.yaml

sleep 120

# Access the URL http://157.55.86.132:32555/ to see the blue deployment

kubectl apply  -f green_deployment.yaml
kubectl apply  -f green_service.yaml

# Access the URL http://157.55.86.132:32555/ to see the green deployment
## To role back to the previous version 
#kubectl apply  -f blue_service.yaml
