#!/bin/bash

set -e

cd "${BASH_SOURCE%/*}"

source commons.sh

function initLiferay() {

  kubectl apply -f ../liferay/liferay-deployment.yaml -n=${NAMESPACE}
  
  sleep 5
  
  podName=$(getLiferayPod)
  
  echo "Liferay Pod name ${podName} running....."
  
  sleep 5
  
  configureLiferay
  
  echo "New configured Liferay pod is being started: $(getLiferayPod)"
  
}

function configureLiferay(){
  
  echo "Configuring Liferay....."
  kubectl cp ../liferay/files ${podName}:/mnt/liferay -n=${NAMESPACE} 
  
  kubectl delete pods ${podName} -n=${NAMESPACE} 

}

function getLiferayPod(){
  echo $(kubectl get pods -l app=liferay -n=${NAMESPACE} --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
}

initLiferay
