#!/bin/bash

set -e

cd "${BASH_SOURCE%/*}"

source commons.sh

function initWebserver() {

  buildWebserver

  kubectl apply -f ../webserver/webserver-deployment.yaml -n=${NAMESPACE}
      
  echo "Webserver started....."
  
}

function buildWebserver(){
  echo "Building and setting up Webserver...."

  docker build -t webserver-nginx-lcp ../webserver
}

initWebserver
