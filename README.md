# How to Install Liferay 7.3 CE to a Kubernetes Cluster with Webserver and Liferay in differents pods

### Required Software and Prerequisites

First of all, please see this blog post in order to check install requirements:

    - English version:
        <https://liferay.dev/blogs/-/blogs/deploying-liferay-7-3-in-kubernetes>
    - Spanish version:
        <https://liferay.dev/blogs/-/blogs/desplegando-liferay-7-3-en-kubernetes>

Before run script, you have to get started minikube and enabled addon ingress. If not, execute:

    - minikube start
    - minikube addons enable ingress
    - eval $(minikube docker-env)
 
Run the `build-and-deploy.sh` script. Note that this script is a shortcut for running all of the sub-steps below.

    1. Run the MySQL database deployment and service scripts/init-mysql.sh
    
    2. Run the Elastichsearch deployment and service scripts/init-es.sh
    
    3. Run the Liferay deployment (this deployment contains 1 container with Liferay), service and configuration scripts/init-liferay.sh
    
    4. Configure the Nginx Ingress scripts/init-ingress.sh
    
    5. Notification when Liferay service is UP & Running scripts/check-liferay-status.sh
    
Run the `tear-down.sh` script when you want to remove namespace with all resources created.

 

