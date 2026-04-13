# Contributing Guidelines

Contributions are welcome via GitHub pull requests. This document outlines the process to help get your contribution accepted.

## How to Contribute

1. Fork this repository, develop, and test your changes
1. Submit a pull request

**_NOTE_**: In order to make testing and merging of PRs easier, please submit changes to multiple charts in separate PRs.

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

- Must follow [Charts best practices](https://helm.sh/docs/topics/chart_best_practices/)
- Must pass CI jobs for linting and installing changed charts with the [chart-testing](https://github.com/helm/chart-testing) tool
- Any change to a chart requires a version bump following [SemVer](https://semver.org/) principles. See [Immutability](#immutability) and [Versioning](#versioning) below
  - Bump the `version` key in [charts/jenkins/Chart.yaml](charts/jenkins/Chart.yaml)
  - Add a new changelog entry to [charts/jenkins/CHANGELOG.md](charts/jenkins/CHANGELOG.md) with the new version and a description of the change
- Run `.github/helm-docs.sh` from the project root. This will update the [charts/jenkins/VALUES.md](charts/jenkins/VALUES.md) file with changes you made in [charts/jenkins/values.yaml](charts/jenkins/values.yaml)

Once changes have been merged, the release job will automatically run to package and release changed charts.

### Unit Tests

It's encouraged to add unit tests.
This project uses helm-unittest plugin.
Tests can be executed like this:

```console
# install the unittest plugin
$ helm plugin install https://github.com/helm-unittest/helm-unittest --version 1.0.3

# run the unittests
$ helm unittest --strict -f 'unittests/*.yaml' charts/jenkins

### Chart [ jenkins ] charts/jenkins

 PASS  ConfigMap  charts/jenkins/unittests/config-init-scripts-test.yaml
 PASS  ConfigMap  charts/jenkins/unittests/config-test.yaml
 PASS  test extraObjects  charts/jenkins/unittests/extra-objects-test.yaml
 PASS  Garbage collection of pods  charts/jenkins/unittests/garbage-collect-test.yaml
 PASS  PersistentVolumeClaim  charts/jenkins/unittests/home-pvc-test.yaml
 PASS  Instance cap tests  charts/jenkins/unittests/instance-cap-test.yaml
2026/03/31 08:28:09 warning: destination for jenkins.controller.projectNamingStrategy is a table. Ignoring non-table value (standard)
2026/03/31 08:28:09 warning: cannot overwrite table with non table for jenkins.controller.JCasC.security.apiToken (map[creationOfLegacyTokenEnabled:false tokenGenerationOnCreationEnabled:false usageStatisticsEnabled:true])
 PASS  Configuration as Code  charts/jenkins/unittests/jcasc-config-test.yaml
 PASS  Jenkins Agent Service  charts/jenkins/unittests/jenkins-agent-svc-test.yaml
 PASS  Controller Prometheus PrometheusRule  charts/jenkins/unittests/jenkins-controller-alerting-rules-test.yaml
 PASS  Controller HTTPRoute  charts/jenkins/unittests/jenkins-controller-httproute-test.yaml
 PASS  Controller Primary Ingress  charts/jenkins/unittests/jenkins-controller-ingress-1.19-test.yaml
 PASS  Controller Ingress - DRY Support  charts/jenkins/unittests/jenkins-controller-ingress-DRY-test.yaml
 PASS  Controller Primary Ingress  charts/jenkins/unittests/jenkins-controller-ingress-test.yaml
 PASS  Network Policy  charts/jenkins/unittests/jenkins-controller-networkpolicy-test.yaml
 PASS  Controller Pod Disruption Budget  charts/jenkins/unittests/jenkins-controller-pdb-1.21-test.yaml
 PASS  Controller Pod Disruption Budget  charts/jenkins/unittests/jenkins-controller-pdb-test.yaml
 PASS  Controller Secondary Ingress  charts/jenkins/unittests/jenkins-controller-secondary-ingress-1.19-test.yaml
 PASS  Controller Secondary Ingress  charts/jenkins/unittests/jenkins-controller-secondary-ingress-test.yaml
 PASS  Controller Prometheus ServiceMonitor  charts/jenkins/unittests/jenkins-controller-servicemonitor_test.yaml
 PASS  Jenkins Controller  charts/jenkins/unittests/jenkins-controller-statefulset-test.yaml
 PASS  Jenkins Controller  charts/jenkins/unittests/jenkins-controller-svc-test.yaml
 PASS  Role Based Access Control  charts/jenkins/unittests/rbac-test.yaml
 PASS  Controller Admin Additional Secrets  charts/jenkins/unittests/secret-additional-test.yaml
 PASS  Controller Secret Claims  charts/jenkins/unittests/secret-claims-test.yaml
 PASS  Controller Additional Existing Secrets  charts/jenkins/unittests/secret-existing-test.yaml
 PASS  Controller Admin Credentials  charts/jenkins/unittests/secret-test.yaml
 PASS  Controller Service Account  charts/jenkins/unittests/service-account-agent-test.yaml
 PASS  Controller Service Account  charts/jenkins/unittests/service-account-test.yaml

Charts:      1 passed, 1 total
Test Suites: 28 passed, 28 total
Tests:       214 passed, 214 total
Snapshot:    50 passed, 50 total
Time:        2.2434989s
```

> **Note!**
> Some warnings in the sample output are expected. A few unit tests intentionally provide values with a different type than the chart defaults to verify how the templates handle those inputs.

### Immutability

Chart releases must be immutable. Any change to a chart warrants a chart version bump even if it is only a change to the documentation.

### Versioning

The chart `version` should follow [SemVer](https://semver.org/).

Charts should start at `1.0.0`. Any breaking (backwards incompatible) changes to a chart should:

1. Bump the MAJOR version
2. In the readme, under a section called "Upgrading", describe the manual steps necessary to upgrade to the new (specified) MAJOR version

### Community Requirements

This project is released with a [Contributor Covenant](https://www.contributor-covenant.org).
By participating in this project you agree to abide by its terms.
Visit our [code of conduct](https://www.jenkins.io/project/conduct/).
