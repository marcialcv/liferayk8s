#!/bin/bash

set -e

cd "${BASH_SOURCE%/*}"

source commons.sh

function initElasticsearch() {

  kubectl apply -f ../es/search-deployment.yaml -n=${NAMESPACE}
  
  sleep 5

}

initElasticsearch