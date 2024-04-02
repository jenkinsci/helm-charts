#!/bin/bash

set -euxo pipefail

# check if helm-docs is installed
if ! command -v helm-docs &> /dev/null; then
    echo "helm-docs could not be found. Did you install it?"
    exit
fi

# validate docs
cd charts/jenkins
helm-docs --template-files=VALUES.md.gotmpl --output-file=VALUES.md
