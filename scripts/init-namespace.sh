#!/bin/bash

set -e

cd "${BASH_SOURCE%/*}"

source commons.sh

function initNamespace() {
  echo ".....Creating namespace=${NAMESPACE}....."
  kubectl create namespace ${NAMESPACE}

}

initNamespace