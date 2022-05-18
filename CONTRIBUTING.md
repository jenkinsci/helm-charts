# Contributing Guidelines

Contributions are welcome via GitHub pull requests. This document outlines the process to help get your contribution accepted.

## Sign off Your Work

The Developer Certificate of Origin (DCO) is a lightweight way for contributors to certify that they wrote or otherwise have the right to submit the code they are contributing to the project. Here is the full text of the [DCO](http://developercertificate.org/). Contributors must sign-off that they adhere to these requirements by adding a `Signed-off-by` line to commit messages.

```text
This is my commit message

Signed-off-by: Random J Developer <random@developer.example.org>
```

See `git help commit`:

```text
-s, --signoff
    Add Signed-off-by line by the committer at the end of the commit log
    message. The meaning of a signoff depends on the project, but it typically
    certifies that committer has the rights to submit this work under the same
    license and agrees to a Developer Certificate of Origin (see
    http://developercertificate.org/ for more information).
```

## How to Contribute

1. Fork this repository, develop, and test your changes
1. Remember to sign off your commits as described above
1. Submit a pull request

***NOTE***: In order to make testing and merging of PRs easier, please submit changes to multiple charts in separate PRs.

## Local Development

### Prerequisites

- [minikube](https://minikube.sigs.k8s.io/docs/start/), [k3d](https://k3d.io/), [kind](https://kind.sigs.k8s.io/), [microk8s](https://microk8s.io/) or some other local k8s cluster
- [Tilt](https://tilt.dev/)

### Setup

```console
CHART=jenkins
cd charts/$CHART
tilt up
# Open a service tunnel into the cluster with minikube
minikube service chart-$CHART
# Login with username admin and password asdf
```

### Technical Requirements

* Must pass [DCO check](#sign-off-your-work)
* Must follow [Charts best practices](https://helm.sh/docs/topics/chart_best_practices/)
* Must pass CI jobs for linting and installing changed charts with the [chart-testing](https://github.com/helm/chart-testing) tool
* Any change to a chart requires a version bump following [semver](https://semver.org/) principles. See [Immutability](#immutability) and [Versioning](#versioning) below

Once changes have been merged, the release job will automatically run to package and release changed charts.

### Unit Tests

It's encouraged to add unit tests.
This project uses helm-unittest plugin.
Tests can be executed like this:

```console
# install the unittest plugin
$ helm plugin install https://github.com/quintush/helm-unittest --version 0.2.8

# run the unittests
$ helm unittest --helm3 --strict -f 'unittests/*.yaml' charts/jenkins

### Chart [ jenkins ] charts/jenkins

2022/01/15 11:25:01 warning: destination for initScripts is a table. Ignoring non-table value []
 PASS  ConfigMap                               charts/jenkins/unittests/config-init-scripts-test.yaml
 PASS  ConfigMap                               charts/jenkins/unittests/config-test.yaml
 PASS  PersistentVolumeClaim                   charts/jenkins/unittests/home-pvc-test.yaml
 PASS  Configuration as Code                   charts/jenkins/unittests/jcasc-config-test.yaml
 PASS  Jenkins Agent Service                   charts/jenkins/unittests/jenkins-agent-svc-test.yaml
 PASS  Jenkins Backup Cronjob                  charts/jenkins/unittests/jenkins-backup-cronjob-test.yaml
 PASS  Controller Prometheus PrometheusRule    charts/jenkins/unittests/jenkins-controller-alerting-rules-test.yaml
 PASS  Controller Primary Ingress              charts/jenkins/unittests/jenkins-controller-ingress-1.19-test.yaml
 PASS  Controller Primary Ingress              charts/jenkins/unittests/jenkins-controller-ingress-test.yaml
 PASS  Network Policy                          charts/jenkins/unittests/jenkins-controller-networkpolicy-test.yaml
 PASS  Controller Pod Disruption Budget        charts/jenkins/unittests/jenkins-controller-pdb-1.21-test.yaml
 PASS  Controller Pod Disruption Budget        charts/jenkins/unittests/jenkins-controller-pdb-test.yaml
 PASS  Controller Secondary Ingress            charts/jenkins/unittests/jenkins-controller-secondary-ingress-1.19-test.yaml
 PASS  Controller Secondary Ingress            charts/jenkins/unittests/jenkins-controller-secondary-ingress-test.yaml
 PASS  Controller Prometheus ServiceMonitor    charts/jenkins/unittests/jenkins-controller-servicemonitor_test.yaml
 PASS  Jenkins Controller                      charts/jenkins/unittests/jenkins-controller-statefulset-test.yaml
 PASS  Jenkins Controller                      charts/jenkins/unittests/jenkins-controller-svc-test.yaml
 PASS  Role Based Access Control               charts/jenkins/unittests/rbac-test.yaml
 PASS  Controller Admin Additional Secrets     charts/jenkins/unittests/secret-additional-test.yaml
 PASS  Controller Secret Claims                charts/jenkins/unittests/secret-claims-test.yaml
 PASS  Controller Additional Existing Secrets  charts/jenkins/unittests/secret-existing-test.yaml
 PASS  Controller Admin Credentials            charts/jenkins/unittests/secret-test.yaml
 PASS  Controller Service Account              charts/jenkins/unittests/service-account-agent-test.yaml
 PASS  Controller Service Account              charts/jenkins/unittests/service-account-test.yaml

Charts:      1 passed, 1 total
Test Suites: 24 passed, 24 total
Tests:       119 passed, 119 total
Snapshot:    1 passed, 1 total
Time:        440.35914ms
```

### Immutability

Chart releases must be immutable. Any change to a chart warrants a chart version bump even if it is only a change to the documentation.

### Versioning

The chart `version` should follow [semver](https://semver.org/).

Charts should start at `1.0.0`. Any breaking (backwards incompatible) changes to a chart should:

1. Bump the MAJOR version
2. In the README, under a section called "Upgrading", describe the manual steps necessary to upgrade to the new (specified) MAJOR version

### Community Requirements

This project is released with a [Contributor Covenant](https://www.contributor-covenant.org).
By participating in this project you agree to abide by its terms.
See [CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md).
