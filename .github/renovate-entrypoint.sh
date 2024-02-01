#!/bin/bash

# renovate: datasource=github-tags depName=mikefarah/yq
export YQ_VERSION=v4.40.5

# renovate: datasource=github-tags depName=helm/helm
export HELM_VERSION=v3.14.0

# renovate: datasource=github-tags depName=helm-unittest/helm-unittest
export HELM_UNITTEST_VERSION=v0.3.6

# renovate: datasource=github-tags depName=jenkins-x-plugins/jx-release-version
export JENKINS_JX_VERSION=v2.7.3

apt update

apt install -y curl git

curl -fsSL -o /tmp/helm.tar.gz https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz
mkdir -p /tmp/helm && tar -xf /tmp/helm.tar.gz -C /tmp/helm
mv /tmp/helm/linux-amd64/helm /usr/local/bin/helm
chmod a+x /usr/local/bin/helm

runuser -u ubuntu -- helm plugin install https://github.com/helm-unittest/helm-unittest --version ${HELM_UNITTEST_VERSION}

curl -fsSL -o /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64
chmod a+x /usr/local/bin/yq

curl -fsSL -o /tmp/jx-release.tar.gz https://github.com/jenkins-x-plugins/jx-release-version/releases/download/${JENKINS_JX_VERSION}/jx-release-version-linux-amd64.tar.gz
mkdir -p /tmp/jx && tar -xf /tmp/jx-release.tar.gz -C /tmp/jx
mv /tmp/jx/jx-release-version /usr/local/bin/jx-release-version
chmod a+x /usr/local/bin/jx-release-version

runuser -u ubuntu renovate
