#!/bin/bash

set -e

cd "${BASH_SOURCE%/*}"

source commons.sh

function initLiferay() {

  kubectl apply -f ../liferay/liferay-deployment.yaml -n=${NAMESPACE}
  
  sleep 5
  
  podName=$(kubectl get pods -l app=liferay -n=${NAMESPACE} --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
  
  echo "Liferay Pod name ${podName} running....."
  
  sleep 5
  
  configureLiferay
  
}

function configureLiferay(){
  
  echo "Configuring Liferay....."
  kubectl cp ../liferay/files ${podName}:/mnt/liferay -n=${NAMESPACE} 
  
  kubectl delete pods ${podName} -n=${NAMESPACE} 

}

initLiferay