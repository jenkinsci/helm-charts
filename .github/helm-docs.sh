#!/bin/bash

set -euxo pipefail

# check if helm-docs is installed
#!/bin/bash

# Check if helm-docs is installed
if ! command -v helm-docs &>/dev/null; then
    echo "helm-docs could not be found."
    echo "You can install it from https://github.com/norwoodj/helm-docs."
    exit 1
fi

# Optionally check if the version of helm-docs is acceptable
REQUIRED_VERSION="v1.7.0"
INSTALLED_VERSION=$(helm-docs --version)

if [[ "$INSTALLED_VERSION" < "$REQUIRED_VERSION" ]]; then
    echo "Installed helm-docs version ($INSTALLED_VERSION) is older than required version ($REQUIRED_VERSION)."
    echo "Please update helm-docs to the latest version."
    exit 1
else
    echo "helm-docs version $INSTALLED_VERSION is installed and up-to-date."
fi

# Further actions can be added below, such as running helm-docs commands.


# validate docs
cd charts/jenkins
helm-docs --template-files=VALUES.md.gotmpl --output-file=VALUES.md
