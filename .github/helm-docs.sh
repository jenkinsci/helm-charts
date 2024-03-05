#!/bin/bash

set -euxo pipefail

# validate docs
cd charts/jenkins
helm-docs --template-files=VALUES.md.gotmpl --output-file=VALUES.md
helm-docs --template-files=README.md.gotmpl --output-file=README.md
