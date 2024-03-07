#!/bin/bash

set -euxo pipefail

# validate docs
cd charts/jenkins
helm-docs --template-files=VALUES.md.gotmpl --output-file=VALUES.md
