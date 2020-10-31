#!/bin/bash

set -e

cd "${BASH_SOURCE%/*}"

source commons.sh

function initLiferay() {

  buildWebserverDockerfile
  
  buildLiferay

  kubectl apply -f ../liferay/liferay-deployment.yaml -n=${NAMESPACE}
  
  sleep 5
  
  podName=$(getLiferayPod)
  
  echo "Liferay Pod name ${podName} running....."
  
}

function buildLiferay(){
  echo "Building and setting up Liferay...."
  docker build -t liferay-portal ../liferay/build/docker
}

function buildWebserverDockerfile(){

  echo "Building and setting up Nginx Webserver....."
  docker build -t webserver-nginx ../webserver
  
}

function getLiferayPod(){
  echo $(kubectl get pods -l app=liferay -n=${NAMESPACE} --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
}

initLiferay
