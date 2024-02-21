# Upgrade Notes

## To 5.0.0
- `controller.image`, `controller.tag`, and `controller.tagLabel` have been removed. If you want to overwrite the image you now need to configure any or all of:
  - `controller.image.registry`
  - `controller.image.repository`
  - `controller.image.tag`
  - `controller.image.tagLabel`
- `controller.imagePullPolicy` has been removed. If you want to overwrite the pull policy you now need to configure `controller.image.pullPolicy`.
- `controller.sidecars.configAutoReload.image` has been removed. If you want to overwrite the configAutoReload image you now need to configure any or all of:
  - `controller.sidecars.configAutoReload.image.registry`
  - `controller.sidecars.configAutoReload.image.repository`
  - `controller.sidecars.configAutoReload.image.tag`
- `controller.sidecars.other` has been renamed to `controller.sidecars.additionalSidecarContainers`.
- `agent.image` and `agent.tag` have been removed. If you want to overwrite the agent image you now need to configure any or all of:
  - `agent.image.repository`
  - `agent.image.tag`
  - The registry can still be overwritten by `agent.jnlpregistry`
- `agent.additionalContainers[*].image` has been renamed to `agent.additionalContainers[*].image.repository`
- `agent.additionalContainers[*].tag` has been renamed to `agent.additionalContainers[*].image.tag`
- `additionalAgents.*.image` has been renamed to `additionalAgents.*.image.repository`
- `additionalAgents.*.tag` has been renamed to `additionalAgents.*.image.tag`
- `additionalClouds.*.additionalAgents.*.image` has been renamed to `additionalClouds.*.additionalAgents.*.image.repository`
- `additionalClouds.*.additionalAgents.*.tag` has been renamed to `additionalClouds.*.additionalAgents.*.image.tag`
- `helmtest.bats.image` has been split up to:
  - `helmtest.bats.image.registry`
  - `helmtest.bats.image.repository`
  - `helmtest.bats.image.tag`
- `controller.adminUsername` and `controller.adminPassword` have been renamed to `controller.admin.username` and `controller.admin.password` respectively
- `controller.adminSecret` has been renamed to `controller.admin.createSecret`
- `backup.*` was unmaintained and has thus been removed. See the following page for alternatives: [Kubernetes Backup and Migrations](https://nubenetes.com/kubernetes-backup-migrations/).

## To 4.0.0
Removes automatic `remotingSecurity` setting when using a container tag older than `2.326` (introduced in [`3.11.7`](./CHANGELOG.md#3117)). If you're using a version older than `2.326`, you should explicitly set `.controller.legacyRemotingSecurityEnabled` to `true`.

## To 3.0.0

* Check `securityRealm` and `authorizationStrategy` and adjust it.
  Otherwise, your configured users and permissions will be overridden.
* You need to use helm version 3 as the `Chart.yaml` uses `apiVersion: v2`.
* All XML configuration options have been removed.
  In case those are still in use you need to migrate to configuration as code.
  Upgrade guide to 2.0.0 contains pointers how to do that.
* Jenkins is now using a `StatefulSet` instead of a `Deployment`
* terminology has been adjusted that's also reflected in values.yaml
  The following values from `values.yaml` have been renamed:

  * `master` => `controller`
  * `master.useSecurity` => `controller.adminSecret`
  * `master.slaveListenerPort` => `controller.agentListenerPort`
  * `master.slaveHostPort` => `controller.agentListenerHostPort`
  * `master.slaveKubernetesNamespace` => `agent.namespace`
  * `master.slaveDefaultsProviderTemplate` => `agent.defaultsProviderTemplate`
  * `master.slaveJenkinsUrl` => `agent.jenkinsUrl`
  * `master.slaveJenkinsTunnel` => `agent.jenkinsTunnel`
  * `master.slaveConnectTimeout` => `agent.kubernetesConnectTimeout`
  * `master.slaveReadTimeout` => `agent.kubernetesReadTimeout`
  * `master.slaveListenerServiceAnnotations` => `controller.agentListenerServiceAnnotations`
  * `master.slaveListenerServiceType` => `controller.agentListenerServiceType`
  * `master.slaveListenerLoadBalancerIP` => `controller.agentListenerLoadBalancerIP`
  * `agent.slaveConnectTimeout` => `agent.connectTimeout`
* Removed values:

  * `master.imageTag`: use `controller.image` and `controller.tag` instead
  * `slave.imageTag`: use `agent.image` and `agent.tag` instead

## To 2.0.0

Configuration as Code is now default + container does not run as root anymore.

### Configuration as Code new default

Configuration is done via [Jenkins Configuration as Code Plugin](https://github.com/jenkinsci/configuration-as-code-plugin) by default.
That means that changes in values which result in a configuration change are always applied.
In contrast, the XML configuration was only applied during the first start and never altered.

:exclamation::exclamation::exclamation:
Attention:
This also means if you manually altered configuration then this will most likely be reset to what was configured by default.
It also applies to `securityRealm` and `authorizationStrategy` as they are also configured using configuration as code.
:exclamation::exclamation::exclamation:

### Image does not run as root anymore

It's not recommended to run containers in Kubernetes as `root`.

❗Attention: If you had not configured a different user before then you need to ensure that your image supports the user and group ID configured and also manually change permissions of all files so that Jenkins is still able to use them.

### Summary of updated values

As version 2.0.0 only updates default values and nothing else it's still possible to migrate to this version and opt out of some or all new defaults.
All you have to do is ensure the old values are set in your installation.

Here we show which values have changed and the previous default values:

```yaml
controller:
  runAsUser: 1000         # was unset before
  fsGroup: 1000           # was unset before
  JCasC:
    enabled: true         # was false
    defaultConfig: true   # was false
  sidecars:
    configAutoReload:
      enabled: true       # was false
```

### Migration steps

Migration instructions heavily depend on your current setup.
So think of the list below more as a general guideline of what should be done.

- Ensure that the Jenkins image you are using contains a user with ID 1000 and a group with the same ID.
  That's the case for `jenkins/jenkins:lts` image, which the chart uses by default
- Make a backup of your existing installation especially the persistent volume
- Ensure that you have the configuration as code plugin installed
- Export your current settings via the plugin:
  `Manage Jenkins` -> `Configuration as Code` -> `Download Configuration`
- prepare your values file for the update e.g. add additional configuration as code setting that you need.
  The export taken from above might be a good starting point for this.
  In addition, the [demos](https://github.com/jenkinsci/configuration-as-code-plugin/tree/master/demos) from the plugin itself are quite useful.
- Test drive those setting on a separate installation
- Put Jenkins to Quiet Down mode so that it does not accept new jobs
  `<JENKINS_URL>/quietDown`
- Change permissions of all files and folders to the new user and group id:

  ```console
  kubectl exec -it <jenkins_pod> -c jenkins /bin/bash
  chown -R 1000:1000 /var/jenkins_home
  ```

- Update Jenkins

## To 1.0.0

Breaking changes:

- Values have been renamed to follow [helm recommended naming conventions](https://helm.sh/docs/chart_best_practices/#naming-conventions) so that all variables start with a lowercase letter and words are separated with camelcase
- All resources are now using [helm recommended standard labels](https://helm.sh/docs/chart_best_practices/#standard-labels)

As a result of the label changes also the selectors of the deployment have been updated.
Those are immutable so trying an updated will cause an error like:

```console
Error: Deployment.apps "jenkins" is invalid: spec.selector: Invalid value: v1.LabelSelector{MatchLabels:map[string]string{"app.kubernetes.io/component":"jenkins-controller", "app.kubernetes.io/instance":"jenkins"}, MatchExpressions:[]v1.LabelSelectorRequirement(nil)}: field is immutable
```

In order to upgrade, [uninstall](./README.md#uninstall-chart) the Jenkins Deployment before upgrading:
