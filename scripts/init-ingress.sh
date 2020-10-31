#!/bin/bash

set -e

cd "${BASH_SOURCE%/*}"

source commons.sh

function initIngress() {

  kubectl apply -f ../ingress/nginx-ingress.yaml -n=${NAMESPACE}
  
  sleep 5
  
  ingressIp=""
  
  until [ ! -z "$ingressIp" ]
  do
    echo -ne "..."
    ingressIp=$(getIngressIp)
    sleep 5
  done
  
  echo -e "\nPlease add the following entry in your hosts file to access to Liferay from your web browser:\n   ${ingressIp}        ${DOMAIN_NAME}"
  
  
}

function getIngressIp(){
    echo "$(kubectl get ingress -n=${NAMESPACE} -o jsonpath='{.items[0].status.loadBalancer.ingress[0].ip}')"
}


initIngress