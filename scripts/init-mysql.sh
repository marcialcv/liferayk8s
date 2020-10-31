#!/bin/bash

set -e

cd "${BASH_SOURCE%/*}"

source commons.sh

function initMysql() {

  kubectl apply -f ../mysql/database-deployment.yaml -n=${NAMESPACE}
  
  sleep 5

}

initMysql