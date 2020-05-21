#!/bin/bash

set -e

cd "${BASH_SOURCE%/*}"

source commons.sh

function main() {
  
  podStatus=""
  
  until [ "true" = "$podStatus" ]
  do
    echo -ne "..."
    podStatus=$(getLiferayStatus)
    sleep 5
  done
  
  echo -e "\n\nYour Liferay is Up & Running in Kubernetes!!"
  
}

function getLiferayStatus(){

    echo $(kubectl get pods -l app=liferay -n=${NAMESPACE} -o jsonpath='{.items[0].status.containerStatuses[0].ready}')
    
}

main


