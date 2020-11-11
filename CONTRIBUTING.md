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
