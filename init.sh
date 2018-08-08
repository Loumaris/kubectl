#!/bin/sh

echo -n $KUBE_CONFIG | base64 -d > $HOME/.kube/config

kubectl $@