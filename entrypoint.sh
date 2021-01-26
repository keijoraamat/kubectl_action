#!/bin/bash

set -e

# Extract the base64 encoded config data and write this to the KUBECONFIG
echo $KUBE_CONFIG | base64 -di > kubeconfig
export KUBECONFIG=kubeconfig

result=${INPUT_ARGS}
$result
status=$? # get previous command output
echo "::set-output name=kubectl_response::$result"
if [[ $status -eq 0 ]]; then exit 0; else exit 1; fi