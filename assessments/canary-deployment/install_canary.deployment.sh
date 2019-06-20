# Deploy the ingress-nginx controller
kubectl apply -f mandatory.yaml

# Expose the ingress-nginx

kubectl apply -f ingress-nginx-service.yaml
# Wait for nginx to be running
kubectl rollout status deploy nginx-ingress-controller -n ingress-nginx -w
#deployment "nginx-ingress-controller" successfully rolled out

# Deploy version 1 and expose the service via an ingress
kubectl apply -f ./app-v1.yaml -f ./ingress-v1.yaml

# Deploy version 2
kubectl apply -f ./app-v2.yaml

# In a different terminal you can check that requests are responding with version 1

#while sleep 0.1; do curl 157.55.86.132:32097 -H "Host: my-app.com"; done

# Create a canary ingress in order to split traffic: 90% to v1, 10% to v2
kubectl apply -f ./ingress-v2-canary.yaml

# Now you should see that the traffic is being splitted

#while sleep 0.1; do curl 157.55.86.132:32097 -H "Host: my-app.com"; done


# When you are happy, delete the canary ingress
# kubectl delete -f ./ingress-v2-canary.yaml

# Then finish the rollout, set 100% traffic to version 2
# kubectl apply -f ./ingress-v2.yaml
