#!/bin/sh

set -e

source ./scripts/commons.sh

echo "##########################"
echo "Deleting namespace ${NAMESPACE} and resources"

kubectl delete namespace ${NAMESPACE}


