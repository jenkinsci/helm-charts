#!/bin/bash

CHARTVERSION="$(jx-release-version -previous-version=from-file:charts/jenkins/Chart.yaml)"
export CHARTVERSION
depName=$(echo "$1" | tr ' ' '\n' | sort | uniq)
export DEPNAME="$depName"
export NEWVERSION="$2"

helm unittest --strict -f 'unittests/*.yaml' charts/jenkins -u
yq eval '.version = env(CHARTVERSION)' -i charts/jenkins/Chart.yaml
sed -i "/git commit to be able to get more details./a \\\n## ${CHARTVERSION}\n\nUpdate \`${DEPNAME}\` to version \`${NEWVERSION}\`" charts/jenkins/CHANGELOG.md
