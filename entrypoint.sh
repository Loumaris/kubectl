#!/bin/sh
set -e

# decode config
echo $KUBECONFIG_BASE64 | base64 -d > $KUBECONFIG

# run kubectl commands directly
kubectl "$@"