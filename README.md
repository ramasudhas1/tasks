# tasks

Task: Level#2
Azure: Infrastructure used
Terraform: Used to provision the infrastructure
Kubeadm : Used to create the kubernetes cluster  ( Since I have limited credit limits available in Azure , I created a 3 node cluster – But HA cluster can be created by just following the link - https://medium.com/velotio-perspectives/demystifying-high-availability-in-kubernetes-using-kubeadm-3d83ed8c458b ) 
NodePort : Used to expose the services.
OS :  Ubuntu 18.04
Applications are accessible on the below URL’s.
•	http://157.55.86.132:32319   --> grafana
•	http://157.55.86.132:30170   --> prometheus
•	http://157.55.86.132:31416   --> guestbook
•	http://157.55.86.132:30194/app/kibana --> kibana 
•	http://157.55.86.132:32721    --> Elasticsearch
•	http://23.102.128.125:30194/job/helm_install_tomcat/12/console   --> application installation from Jenkins though helm charts.
•	http://157.55.86.132:32555/   --> blue-green deployments 
•	while sleep 0.1; do curl 157.55.86.132:32097 -H "Host: my-app.com"; done --> run this command on the server to see the canary deployment results


1.	Provision the infrastructure.

a.	Requirements: Azure-cli, terraform 
b.	Go to terraform folder
c.	Az login and get authenticated with azure
d.	Run the commands – terraform init;terraform plan; terraform apply
e.	Infrastructure is ready now – ( This will create four servers  including master ,node1,node2 and Jenkins )

2.	Install kubernetes cluster with kubeadm 

a.	Run the script  install_master.sh on the master node , this will install all the required software’s and make master node ready 
b.	Run the script   install_nodes.sh on the slave nodes , this install required software’s and join the node to the cluster

root@master:~# kubectl get nodes
NAME     STATUS   ROLES    AGE     VERSION
master   Ready    master   2d19h   v1.14.3
node1    Ready    <none>   2d19h   v1.14.3
node2    Ready    <none>   2d18h   v1.14.3
root@master:~#

3.	 Guest-book installation 

a.	Run the script install_gues-book.sh – This will create the development name space and install guest-book application on the development namespace.
b.	Application will be accessible through the URL http://157.55.86.132:31416/

 
4.	Install and configure Helm in Kubernetes

a.	Run the script install_helm.sh  -  This will install helm and tiller on the kube-system namespce


 


5.	Installation of Prometheus , grafana and efk using helm charts .

a.	Run the script install_grafana_prometheus_efk.sh - This will install Prometheus and Grafana on the monitoring namespace ( grafana datasource is also updated through the helm charts)  and efk on the efk namespace . 
b.	Required dashboards created on Grafana

 
 


 





6.	 Create a CI/CD pipeline using Jenkins

a.	  Run the script install_jenkins.sh on the Jenkins server - This will install required software’s on the server and setup the Jenkins server.
b.	Install required plugins 
c.	Create a pipeline job to install application on the kubernetes cluster using helm 
d.	Tomcat application used for the installation

 
 

7.	Demonstrate Blue/Green deployment 

a.	Run the script install_blue_green.sh - This will install the deployments.
b.	Used custom image and put this image manually on the nodes. 



 
 
8.	Canary deployment 

a.	Run the script install_canary.deployment.sh  - script will do the below steps.

a)	version 1 is serving traffic
b)	deploy version 2
c)	create a new "canary" ingress with traffic splitting enabled
d)	wait enought time to confirm that version 2 is stable and not throwing unexpected errors
e)	delete the canary ingress
f)	point the main application ingress to send traffic to version 2
g)	shutdown version 1

split traffic: 90% to v1, 10% to v2 

 

9.	wrapper scripts -  All scripts placed in the wrapper_scripts directory. 
