#!/usr/bin/env bash

# This script uses arg $1 (name of *.jsonnet file to use) to generate the manifests/*.yaml files.

set -e
set -x
# only exit with zero if all commands of the pipeline exit successfully
set -o pipefail

# Make sure to start with a clean 'manifests' dir
rm -f kustomization.yaml
rm -rf manifests
rm -rf setup

mkdir -p manifests
mkdir -p setup/manifests

# Build setup manifests
jsonnet -J vendor -m setup/manifests "${1-setup.jsonnet}" | xargs -I{} sh -c 'cat {} | gojsontoyaml > {}.yaml; rm -f {}' -- {}

# Build main manifests
jsonnet -J vendor -m manifests "${1-main.jsonnet}" | xargs -I{} sh -c 'cat {} | gojsontoyaml > {}.yaml; rm -f {}' -- {}

# Move setup manifests into right places
# mv manifests/setup 
