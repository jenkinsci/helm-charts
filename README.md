# Jenkins Helm Charts

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/jenkins)](https://artifacthub.io/packages/helm/jenkinsci/jenkins)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Releases downloads](https://img.shields.io/github/downloads/jenkinsci/helm-charts/total.svg)](https://github.com/jenkinsci/helm-charts/releases)
[![Join the chat at https://app.gitter.im/#/room/#jenkins-ci:matrix.org](https://badges.gitter.im/badge.svg)](https://app.gitter.im/#/room/#jenkins-ci:matrix.org)

## Usage

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repository as follows:

```console
helm repo add jenkins https://charts.jenkins.io
helm repo update
```

You can then run `helm search repo jenkins` to see the charts or obtain an exhaustive list of releases from [GitHub releases](https://github.com/jenkinsci/helm-charts/releases).

<!-- Keep full URL links to repo files because this README syncs from main to gh-pages.  -->
Chart documentation is available in [jenkins directory](https://github.com/jenkinsci/helm-charts/blob/main/charts/jenkins/README.md).

# Building weekly releases

The default charts target Long-Term-Support (LTS) releases of Jenkins.

You can build helm charts for weekly releases yourself by replacing `appVersion` in [`charts/jenkins/Chart.yaml`](https://github.com/jenkinsci/helm-charts/blob/14e78d66107c61341fbb843f156f6e4e30238c65/charts/jenkins/Chart.yaml#L5) with the [desired version](https://updates.jenkins.io/download/war/), bumping the chart [`version`](https://github.com/jenkinsci/helm-charts/blob/14e78d66107c61341fbb843f156f6e4e30238c65/charts/jenkins/Chart.yaml#L4) and running `helm package charts/jenkins`.

## Contributing

<!-- Keep full URL links to repo files because this README syncs from main to gh-pages.  -->
We'd love to have you contribute! Please refer to our [contribution guidelines](https://github.com/jenkinsci/helm-charts/blob/main/CONTRIBUTING.md) for details.

## License

<!-- Keep full URL links to repo files because this README syncs from main to gh-pages.  -->
[Apache 2.0 License](https://github.com/jenkinsci/helm-charts/blob/main/LICENSE).
