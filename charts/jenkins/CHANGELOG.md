# Changelog

This file documents all notable changes to the Jenkins Helm Chart.
The release numbering uses [semantic versioning](http://semver.org).

Use the following links to reference issues, PRs, and commits prior to v2.6.0.

* Issue:  `https://github.com/helm/charts/issues/[issue#]`
* PR:     `https://github.com/helm/charts/pull/[pr#]`
* Commit: `https://github.com/helm/charts/commit/[commit]/stable/jenkins`

The changelog until v1.5.7 was auto-generated based on git commits.
Those entries include a reference to the git commit to be able to get more details.

## 5.8.33

Update `configuration-as-code` to version `1953.v148f87d74b_1e`

## 5.8.32

Update `jenkins/jenkins` to version `2.492.3-jdk21`

## 5.8.31

Update `jenkins/jenkins` to version `2.492.3-jdk17`

## 5.8.30

Update `jenkins/inbound-agent` to version `3301.v4363ddcca_4e7-3`

## 5.8.29

Update `docker.io/kiwigrid/k8s-sidecar` to version `1.30.3`

## 5.8.28

Update `jenkins/inbound-agent` to version `3301.v4363ddcca_4e7-2`

## 5.8.27

Update `jenkins/inbound-agent` to version `3301.v4363ddcca_4e7-1`

## 5.8.26

Update `jenkins/inbound-agent` to version `3299.v0d0d06908537-2`

## 5.8.25

Fix indentation in `values.yaml`

## 5.8.24

Update `workflow-aggregator` to version `608.v67378e9d3db_1`

## 5.8.23

Update `configuration-as-code` to version `1947.v7d33fe23569c`

## 5.8.22

Update `jenkins/inbound-agent` to version `3299.v0d0d06908537-1`

## 5.8.21

Update `kubernetes` to version `4324.vfec199a_33512`

## 5.8.20

Update `jenkins/inbound-agent` to version `3291.vb_131b_dc231fa_-1`

## 5.8.19

Update `docker.io/kiwigrid/k8s-sidecar` to version `1.30.2`

## 5.8.18

Update `jenkins/jenkins` to version `2.492.2-jdk17`

## 5.8.17

Update `kubernetes` to version `4314.v5b_846cf499eb_`

## 5.8.16

Update `docker.io/kiwigrid/k8s-sidecar` to version `1.30.1`

## 5.8.15

Update `kubernetes` to version `4313.va_9b_4fe2a_0e34`

## 5.8.14

Update `jenkins/inbound-agent` to version `3283.v92c105e0f819-9`

## 5.8.13

Fix `agentListenerPort` not being updated in `config.xml` when set via Helm values.

## 5.8.12

Update plugin count.

## 5.8.11

Update `jenkins/inbound-agent` to version `3283.v92c105e0f819-8`

## 5.8.10

Update `jenkins/jenkins` to version `2.492.1-jdk17`

## 5.8.9

Update `configuration-as-code` to version `1932.v75cb_b_f1b_698d`

## 5.8.8

Update `docker.io/kiwigrid/k8s-sidecar` to version `1.30.0`

## 5.8.7

Update `configuration-as-code` to version `1929.v036b_5a_e1f123`

## 5.8.6

Update `docker.io/kiwigrid/k8s-sidecar` to version `1.29.1`

## 5.8.5

Update `jenkins/inbound-agent` to version `3283.v92c105e0f819-7`

## 5.8.4

Allow setting [automountServiceAccountToken](https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/#opt-out-of-api-credential-automounting)

## 5.8.3

Update `docker.io/kiwigrid/k8s-sidecar` to version `1.29.0`

## 5.8.2

Update `jenkins/jenkins` to version `2.479.3-jdk17`

## 5.8.1

Update `configuration-as-code` to version `1915.vcdd0a_d0d2625`

## 5.8.0

Add option to publish not-ready addresses in controller service.

## 5.7.27

Update `git` to version `5.7.0`

## 5.7.26

Update `configuration-as-code` to version `1909.vb_b_f59a_27d013`

## 5.7.25

Update `kubernetes` to version `4306.vc91e951ea_eb_d`

## 5.7.24

Update `kubernetes` to version `4304.v1b_39d4f98210`

## 5.7.23

Update `docker.io/kiwigrid/k8s-sidecar` to version `1.28.4`

## 5.7.22

Update `docker.io/kiwigrid/k8s-sidecar` to version `1.28.3`

## 5.7.21

Update `docker.io/kiwigrid/k8s-sidecar` to version `1.28.1`

## 5.7.20

Update `kubernetes` to version `4302.va_756e4b_67715`

## 5.7.19

Update `configuration-as-code` to version `1903.v004d55388f30`

## 5.7.18

Update `kubernetes` to version `4300.vd82c5692b_3a_e`

## 5.7.17

Update `docker.io/bats/bats` to version `1.11.1`

## 5.7.16

Add tpl support for persistence.storageClassName in home-pvc.yaml  and tpl support in controller.ingress parameters(ingressClassName, annotations, hostname) in jenkins-controller-ingress.yaml

## 5.7.15

Update `jenkins/jenkins` to version `2.479.2-jdk17`

## 5.7.14

Update `kubernetes` to version `4296.v20a_7e4d77cf6`

## 5.7.13

Update `configuration-as-code` to version `1897.v79281e066ea_7`

## 5.7.12

Update `configuration-as-code` to version `1887.v9e47623cb_043`

## 5.7.11

Update `git` to version `5.6.0`

## 5.7.10

Update `jenkins/jenkins` to version `2.479.1-jdk17`

## 5.7.9

Update `configuration-as-code` to version `1873.vea_5814ca_9c93`

## 5.7.8

Update `jenkins/inbound-agent` to version `3273.v4cfe589b_fd83-1`

## 5.7.7

Update `kubernetes` to version `4295.v7fa_01b_309c95`

## 5.7.5

Fix helm release deployment with flux revision reconciliation

## 5.7.4

Update `kubernetes` to version `4292.v11898cf8fa_66`

## 5.7.3

Update `git` to version `5.5.2`

## 5.7.2

Update `jenkins/jenkins` to version `2.462.3-jdk17`

## 5.7.1

Update `docker.io/kiwigrid/k8s-sidecar` to version `1.28.0`

## 5.7.0

Add RBAC support for using the `nonroot` and `nonroot-v2` `SecurityContextConstraints` on OpenShift.

## 5.6.5

Update `kubernetes` to version `4290.v93ea_4b_b_26a_61`

## 5.6.4

Update `git` to version `5.5.1`

## 5.6.3

Update `git` to version `5.5.0`

## 5.6.2

Update `kubernetes` to version `4288.v1719f9d0c854`

## 5.6.1

Documentation about OCI installation

## 5.6.0

Helm chart is also now deployed on GitHub packages and can be installed from `oci://ghcr.io/jenkinsci/helm-charts/jenkins`

## 5.5.16

Update `kubernetes` to version `4287.v73451380b_576`

## 5.5.15

Add support for `controller.enableServiceLinks` to disable service links in the controller pod.

## 5.5.14

Update `jenkins/jenkins` to version `2.462.2-jdk17`

## 5.5.13

Update `docker.io/kiwigrid/k8s-sidecar` to version `1.27.6`

## 5.5.12

Update `configuration-as-code` to version `1850.va_a_8c31d3158b_`

## 5.5.11

Update `configuration-as-code` to version `1849.v3a_d20568000a_`

## 5.5.10

Update `git` to version `5.4.1`

## 5.5.9

Update `git` to version `5.4.0`

## 5.5.8

Add `agent.garbageCollection` to support setting [kubernetes plugin garbage collection](https://plugins.jenkins.io/kubernetes/#plugin-content-garbage-collection-beta).

## 5.5.7

Update `kubernetes` to version `4285.v50ed5f624918`

## 5.5.6

Add `agent.useDefaultServiceAccount` to support omitting setting `serviceAccount` in the default pod template from `serviceAgentAccount.name`.
Add `agent.serviceAccount` to support setting the default pod template value.

## 5.5.5

Update `jenkins/inbound-agent` to version `3261.v9c670a_4748a_9-1`

## 5.5.4

Update `jenkins/jenkins` to version `2.462.1-jdk17`

## 5.5.3

Update `git` to version `5.3.0`

## 5.5.2

Update `kubernetes` to version `4280.vd919fa_528c7e`

## 5.5.1

Update `kubernetes` to version `4265.v78b_d4a_1c864a_`

## 5.5.0

Introduce capability of set skipTlsVerify and usageRestricted flags in additionalClouds


## 5.4.4

Update CHANGELOG.md, README.md, and UPGRADING.md for linting

## 5.4.3

Update `configuration-as-code` to version `1836.vccda_4a_122a_a_e`

## 5.4.2

Update `docker.io/kiwigrid/k8s-sidecar` to version `1.27.5`

## 5.4.1

Update `jenkins/jenkins` to version `2.452.3`

## 5.4.0

Introduce capability of additional mountPaths and logging file paths for config reload container

## 5.3.6

Update `workflow-aggregator` to version `600.vb_57cdd26fdd7`

## 5.3.5

Update `kubernetes` to version `4253.v7700d91739e5`

## 5.3.4

Update `jenkins/jenkins` to version `2.452.3-jdk17`
## 5.3.3

Update `jenkins/inbound-agent` to version `3256.v88a_f6e922152-1`

## 5.3.2

Update `kubernetes` to version `4248.vfa_9517757b_b_a_`

## 5.3.1

Fix Tiltfile deprecated value reference

## 5.3.0

Add `controller.topologySpreadConstraints`

## 5.2.2

Update `kubernetes` to version `4246.v5a_12b_1fe120e`

## 5.2.1

Update `jenkins/jenkins` to version `2.452.2-jdk17`

## 5.2.0

Add `agent.inheritYamlMergeStrategy` to allow configuring this setting on the default agent pod template.

## 5.1.31

Update `kubernetes` to version `4245.vf5b_83f1fee6e`

## 5.1.30

Add `controller.JCasC.configMapAnnotations` to allow setting annotations on the JCasC ConfigMaps.

## 5.1.29

Update `docker.io/kiwigrid/k8s-sidecar` to version `1.27.4`

## 5.1.28

Update `docker.io/kiwigrid/k8s-sidecar` to version `1.27.3`

## 5.1.27

Update `kubernetes` to version `4244.v4fb_b_00994a_90`

## 5.1.26

Update `kubernetes` to version `4238.v41b_3ef14a_5d8`

## 5.1.25

Update `kubernetes` to version `4236.vc06f753c3234`

## 5.1.24

Update `kubernetes` to version `4234.vdf3e78112369`

## 5.1.23

Update `kubernetes` to version `4233.vb_67a_0e11a_039`

## 5.1.22

Update `configuration-as-code` to version `1810.v9b_c30a_249a_4c`

## 5.1.21

Update `kubernetes` to version `4231.vb_a_6b_8936497d`

## 5.1.20

Update `kubernetes` to version `4230.vceef11cb_ca_37`

## 5.1.19

Update `docker.io/kiwigrid/k8s-sidecar` to version `1.27.2`

## 5.1.18

Update `configuration-as-code` to version `1807.v0175eda_00a_20`

## 5.1.17

Update `jenkins/inbound-agent` to version `3248.v65ecb_254c298-1`

## 5.1.16

Update `configuration-as-code` to version `1805.v1455f39c04cf`

## 5.1.15

Update `jenkins/jenkins` to version `2.452.1-jdk17`

## 5.1.14

Update `kubernetes` to version `4219.v40ff98cfb_d6f`

## 5.1.13

Update `docker.io/kiwigrid/k8s-sidecar` to version `1.27.1`

## 5.1.12

Update `git` to version `5.2.2`

## 5.1.11

Update `kubernetes` to version `4214.vf10083a_42e70`

## 5.1.10

Update `kubernetes` to version `4211.v08850dd0dfa_3`

## 5.1.9

Update `docker.io/kiwigrid/k8s-sidecar` to version `1.26.2`

## 5.1.8

Update `kubernetes` to version `4209.vc646b_71e5269`

## 5.1.7

Update `kubernetes` to version `4208.v4017b_a_27a_d67`

## 5.1.6

Update `jenkins/jenkins` to version `2.440.3-jdk17`

## 5.1.5

Fix Prometheus controller name.

## 5.1.4

Update `docker.io/bats/bats` to version `1.11.0`

## 5.1.3

Update `jenkins/jenkins` to version `2.440.2-jdk17`

## 5.1.2

Update `kubernetes` to version `4203.v1dd44f5b_1cf9`

## 5.1.1

Update `kubernetes` to version `4199.va_1647c280eb_2`

## 5.1.0

Add `agent.restrictedPssSecurityContext` to automatically inject in the jnlp container a securityContext that is suitable for the use of the restricted Pod Security Standard

## 5.0.20

Update `docker.io/kiwigrid/k8s-sidecar` to version `1.26.1`

## 5.0.19

Introduced helm-docs to automatically generate `values.yaml` documentation.

## 5.0.18

Update `kubernetes` to version `4193.vded98e56cc25`

## 5.0.17

Update `docker.io/kiwigrid/k8s-sidecar` to version `1.26.0`

## 5.0.16

Enable support for deleting plugin configuration files at startup.

## 5.0.15

Fixed changelog entries for previous version bumps


## 5.0.14

Update `jenkins/jenkins` to version `2.440.1-jdk17`

## 5.0.13

Update `docker.io/kiwigrid/k8s-sidecar` to version `1.25.4`

## 5.0.12

Fix controller.sidecars.additionalSidecarContainers renaming and add tests

## 5.0.11

* Add controller.sidecars.configAutoReload.scheme to specify protocol scheme when connecting Jenkins configuration-as-code reload endpoint
* Add controller.sidecars.configAutoReload.skipTlsVerify to force the k8s-sidecar container to skip TLS verification when connecting to an HTTPS Jenkins configuration-as-code reload endpoint

## 5.0.10

Update `jenkins/inbound-agent` to version `3206.vb_15dcf73f6a_9-3`

## 5.0.9

Update `kubernetes` to version `4186.v1d804571d5d4`

## 5.0.8

Update `configuration-as-code` to version `1775.v810dc950b_514`

## 5.0.7

Update `docker.io/kiwigrid/k8s-sidecar` to version `docker.io/kiwigrid/k8s-sidecar`

## 5.0.6

Removed `docker.io` prefix from inbound-agent image

## 5.0.5

Prefixed artifacthub.io/images with `docker.io`

## 5.0.4

Updated super-linter to v6. Updated README.md and CHANGELOG.md to fix linting issues.

## 5.0.2

Update `git` to version `5.2.1`

## 5.0.1

Update `docker.io/bats/bats` to version `v1.10.0`

## 5.0.0

  > [!CAUTION]
  > Several fields have been renamed or removed. See [UPGRADING.md](./UPGRADING.md#to-500)

The Helm Chart is now updated automatically via [Renovate](https://docs.renovatebot.com/)

## 4.12.1

Update Jenkins image and appVersion to jenkins lts release version 2.426.3

## 4.12.0

Add support for [generic ephemeral storage](https://github.com/jenkinsci/kubernetes-plugin/pull/1489) in `agent.volumes` and `agents.workspaceVolume`.

| plugin     | old version         | new version        |
|------------|---------------------|--------------------|
| kubernetes | 4029.v5712230ccb_f8 | 4174.v4230d0ccd951 |

## 4.11.2

Fixed documentation for controller.initScripts.

## 4.11.1

Updated helm-unittest and made unittests compatible.

## 4.11.0

Add multi-cloud support.

## 4.10.0

Bumped Jenkins inbound agent from 3107.v665000b_51092-15 to 3192.v713e3b_039fb_e-5.

## 4.9.2

Update Jenkins image and appVersion to jenkins lts release version 2.426.2


Notes about [Artifact Hub](https://artifacthub.io/packages/helm/jenkinsci/jenkins?modal=changelog) changelog processing:
- Remove empty lines
- Keep only ASCII characters (no emojis)
- One change per line
- Remove table(s) (lines starting by "|")
- Backticks aren't rendered on artifacthub.io changelog

## 4.9.1

Restore artifact hub notes location in CHANGELOG.md

## 4.9.0

Update base images from JDK 11 to JDK 17.

## 4.8.6

Proper `artifacthub.io/changes` changelog annotation preprocessing.

## 4.8.5

Fix `artifacthub.io/changes` changelog annotation added to the released chart.

## 4.8.4

Add `artifacthub.io/changes` changelog annotation to the released chart.

## 4.8.3

Update Jenkins image and appVersion to jenkins lts release version 2.426.1

## 4.8.2

Add the ability to modify `retentionTimeout` and `waitForPodSec` default value in JCasC

## 4.8.1

Reintroduces changes from 4.7.0 (reverted in 4.7.1), with additional fixes:

- METHOD is now allowed in `env` and is not duplicated anymore
- No calls to JCasC reload endpoint from the init container

## 4.8.0

Adds support for ephemeralStorage request and limit in Kubernetes plugin JCasC template

## 4.7.4

Add the config-init-script checksum into the controller statefullset pod annotations to trigger restart of the pod in case of updated init scripts.

## 4.7.3

Update Jenkins image and appVersion to jenkins lts release version 2.414.3

## 4.7.1

Changes in 4.7.0 were reverted.

## 4.7.0

Runs `config-reload` as an init container, in addition to the sidecar container, to ensure that JCasC YAMLs are present before the main Jenkins container starts. This should fix some race conditions and crashes on startup.

## 4.6.7

Change jenkins-test image label to match the other jenkins images

## 4.6.5

Update Jenkins image and appVersion to jenkins lts release version 2.414.2

## 4.6.4

Introducing TPL function on variables related to hostname in `./charts/jenkins/templates/jenkins-controller-ingress.yaml`

## 4.6.3

Add values to documentation

## 4.6.2

Update word from hundreds to over 1800 to align with blurb at <https://github.com/jenkinsci/>.

## 4.6.1

Update `configuration-as-code` plugin to fix dependency issues with `azure-ad` plugin

## 4.6.0

Added `.Values.controller.httpsKeyStore.jenkinsHttpsJksSecretKey` to allow overriding the default secret key containing the JKS file.
Added `.Values.controller.httpsKeyStore.jenkinsHttpsJksPasswordSecretName` to allow getting the JKS password from a different secret.
Added `.Values.controller.httpsKeyStore.jenkinsHttpsJksPasswordSecretKey` to allow overriding the default secret key containing the JKS password.

## 4.5.1

Update Jenkins image and appVersion to jenkins lts release version 2.414.1


## 4.5.0

Added `.Values.persistence.dataSource` to allow cloning home PVC from existing dataSource.

## 4.4.2

Update Jenkins image and appVersion to jenkins lts release version 2.401.3


## 4.4.1

Added `.Values.agent.jnlpregistry` to allow agents to be configured with private registry.

## 4.4.0

Add config keys for liveness probes on agent containers.


## 4.3.30

Update Jenkins version in controller test matching LTS version

## 4.3.29

Update Jenkins image and appVersion to jenkins lts release version 2.401.2


## 4.3.28

Allow the kubernetes API server URL to be configurable.

## 4.3.27

Bump kiwigrid/k8s-sidecar from 1.23.1 to 1.24.4 and jenkins/inbound-agent from 3107.v665000b_51092-5 to 3107.v665000b_51092-15.

## 4.3.26

Fix various typos in the chart documentation.

## 4.3.25

| plugin                | old version          | new version           |
|-----------------------|----------------------|-----------------------|
| kubernetes            | 3900.va_dce992317b_4 | 3937.vd7b_82db_e347b_ |
| configuration-as-code | 1625.v27444588cc3d   | 1647.ve39ca_b_829b_42 |
| git                   | 5.0.0                | 5.1.0                 |
| ldap                  | 671.v2a_9192a_7419d  | 682.v7b_544c9d1512    |

## 4.3.24

Update Jenkins image and appVersion to jenkins lts release version 2.401.1


## 4.3.23

Update Jenkins image and appVersion to jenkins lts release version 2.387.3


## 4.3.22


Bump chart version.

## 4.3.21


Document building charts for weekly releases.

## 4.3.20


Enhance repository appearance and miscellaneous cleanup.

## 4.3.19


Comply with superlinter rules and address ShellCheck issues.

## 4.3.18


Bump kiwigrid/k8s-sidecar from 1.15.0 to 1.23.1.

## 4.3.17


Bump jenkins/inbound-agent from 4.11.2-4 to 3107.v665000b_51092-5.

## 4.3.16


Update bundled plugins:
- [ldap](https://plugins.jenkins.io/ldap/): From 2.5 to 671.v2a_9192a_7419d
- [kubernetes](https://plugins.jenkins.io/kubernetes/): From 3734.v562b_b_a_627ea_c to 3900.va_dce992317b_4
- [workflow-aggregator](https://plugins.jenkins.io/workflow-aggregator/): From 590.v6a_d052e5a_a_b_5 to 590.v6a_d052e5a_a_b_5
- [configuration-as-code](https://plugins.jenkins.io/configuration-as-code/): From 1569.vb_72405b_80249 to 1625.v27444588cc3d

## 4.3.15


Update bats from 1.2.1 to 1.9.0.

## 4.3.14


Update various GH actions, typo fixes, and miscellaneous chores.

## 4.3.13


Bump helm-unittest from 0.2.8 to 0.2.11.

## 4.3.12


Update wording in values.yml.

## 4.3.11

Update Jenkins image and appVersion to jenkins lts release version 2.387.2


## 4.3.10

Correct incorrect env var definition
Disable volume mount if disableSecretMount enabled

## 4.3.9

Document `.Values.agent.directConnection` in readme.
Add default value for `.Values.agent.directConnection` to `values.yaml`

## 4.3.8

Added `.Values.agent.directConnection` to allow agents to be configured to connect direct to the JNLP port on the
controller, preventing the need for an external HTTP endpoint for this purpose.

## 4.3.7

Added `.Values.controller.shareProcessNamespace` and `.Values.controller.httpsKeyStore.disableSecretMount` to enable sourcing TLS certs from external issuers

## 4.3.6

Update Jenkins image and appVersion to jenkins lts release version 2.387.1

## 4.3.5

Added `.Values.helmtest.bats.image` and `.Values.helmtest.bats.image` to allow unit tests to be configurable. Fixes [https://github.com/jenkinsci/helm-charts/issues/683]

## 4.3.4

Update Jenkins image and appVersion to jenkins lts release version 2.375.3


## 4.3.3

Removed hardcoding of chart version in tests to make maintenance easier

## 4.3.2

Added `.Values.serviceAccount.extraLabels` on Service Account
Added `.Values.serviceAccountAgent.extraLabels` on Agent's Service Account


## 4.3.0

Moved use of `.Values.containerEnv` within `jenkins` Container to top of `env` block to allow for subsequent Environment Variables to reference these additional ones.

## 4.2.21

Update Jenkins image and appVersion to jenkins lts release version 2.375.2


## 4.2.20

Fixed the `controller.prometheus.metricRelabelings` being unable to convert the value to the ServiceMonitor.
Added `controller.prometheus.relabelings` to allow relabling before scrape.
Added default values for `controller.prometheus.relabelings` and `controller.prometheus.metricRelabelings`.

## 4.2.19

CronJob API version upgraded to batch/v1

## 4.2.18

Added option to set secretEnvVars.

## 4.2.17

Update Jenkins image and appVersion to jenkins lts release version 2.375.1


## 4.2.16

Fixed chart notes not rendering Jenkins URL with prefix when `controller.jenkinsUriPrefix` is set.
Fixed chart notes not rendering Jenkins URL with `https` when `controller.ingress.tls` or `controller.controller.httpsKeyStore.enable` is set.
Fixed chart notes rendering wrong JCasC URL when not using `controller.ingress`.

## 4.2.15

Update Jenkins image and appVersion to jenkins lts release version 2.361.4

## 4.2.14

Added option to mount all keys from an existing k8s secret

## 4.2.13

Adding `tpl` to `controller.additionalExistingSecrets`

## 4.2.12

Update Jenkins image and appVersion to jenkins lts release version 2.361.3


## 4.2.11

Update default plugin versions

| plugin                | old version           | new version            |
|-----------------------|-----------------------|------------------------|
| kubernetes            | 3706.vdfb_d599579f3   | 3734.v562b_b_a_627ea_c |
| git                   | 4.11.5                | 4.13.0                 |
| configuration-as-code | 1512.vb_79d418d5fc8   | 1569.vb_72405b_80249   |

## 4.2.10
Fix grammar and typos

## 4.2.9
Update Jenkins image and appVersion to jenkins lts release version 2.361.2

## 4.2.8
Modify the condition to trigger copying jenkins_config files when configAutoReload option is disabled during Jenkins initialization

## 4.2.7
Support for remote URL for configuration

## 4.2.6
Add option to set hostnetwork for agents

## 4.2.5
Add an extra optional argument to extraPorts in order to specify targetPort

## 4.2.4
Remove k8s capibility requirements when setting priority class for controller

## 4.2.3 Update plugin versions

| plugin                | old version           | new version           |
| --------------------- | --------------------- | --------------------- |
| kubernetes            | 3600.v144b_cd192ca_a_ | 3706.vdfb_d599579f3   |
| workflow-aggregator   | 581.v0c46fa_697ffd    | 590.v6a_d052e5a_a_b_5 |
| configuration-as-code | 1429.v09b_044a_c93de  | 1512.vb_79d418d5fc8   |
| git                   | 4.11.3                | 4.11.5                |

Resolve version conflict between default install of plugins.

## 4.2.2

Support Google Managed Prometheus

## 4.2.1

Remove option to provide command and args of agent as YAML. This feature was never supported by the Jenkins Kubernetes
plugin.

## 4.2.0

Add option to provide additional containers to agents

## 4.1.18

Update Jenkins image and appVersion to jenkins lts release version 2.361.1


## 4.1.17

Update Jenkins casc default settings to allow `security` configs to be provided


## 4.1.16

Update Jenkins image and appVersion to jenkins lts release version 2.346.3


## 4.1.15

`projectNamingStrategy` is configurable in default config.

## 4.1.14

If `installPlugins` is disabled, don't create unused plugins volume.

## 4.1.13

Update Jenkins image and appVersion to jenkins lts release version 2.346.2


## 4.1.12

If keystore is defined, it is now also made available in the initContainer.

## 4.1.11

JCasC ConfigMaps now generate their name from the `jenkins.casc.configName` helper

## 4.1.10

Update Jenkins image and appVersion to jenkins lts release version 2.346.1


## 4.1.9

Allow setting `imagePullSecret` for backup job via `backup.imagePullSecretName`

## 4.1.8

Fix path of projected secrets from `additionalExistingSecrets`.

## 4.1.7

Update readme with explanation on the required environmental variable `AWS_REGION` in case of using an S3 bucket.

## 4.1.6

project adminSecret, additionalSecrets and additionalExistingSecrets instead of mount with subPath

## 4.1.5

Update readme to fix `JAVA_OPTS` name.

## 4.1.4
Update plugins

## 4.1.3
Update jenkins-controller-statefulset projected volumes definition

## 4.1.1
Added 'controller.prometheus.metricRelabelings' to allow relabling and dropping unused prometheus metrics

## 4.1.0

Added `controller.sidecars.configAutoReload.envFrom`, `controller.initContainerEnvFrom`, `controller.containerEnvFrom`

## 4.0.1

No code changes - CI updated to run unit tests using Helm 3.8.2.

## 4.0.0

Removes automatic `remotingSecurity` setting when using a container tag older than `2.326` (introduced in [`3.11.7`](#3117)). If you're using a version older than `2.326`, you should explicitly set `.controller.legacyRemotingSecurityEnabled` to `true`.

## 3.12.2

Update Jenkins image and appVersion to jenkins lts release version 2.332.3

## 3.12.1

Make namespace configurable for agents and additional agents.

## 3.12.0

Added a flag for disabling the default Jenkins Agent configuration.

## 3.11.10

Update Jenkins image and appVersion to jenkins lts release version 2.332.2

## 3.11.9 Bump configuration-as-code plugin version

| plugin                | old version | new version |
| --------------------- | ----------- | ----------- |
| configuration-as-code | 1.51        | 1414.v878271fc496f        |

## 3.11.8

Make [externalTrafficPolicy](https://kubernetes.io/docs/concepts/services-networking/service/#traffic-policies) and `loadBalancerSourceRanges` fields customizable for Agent listener service via `controller.agentListenerExternalTrafficPolicy` and `controller.loadBalancerSourceRanges`.

## 3.11.7

Removed Configuration as Code `remotingSecurity` section for Jenkins 2.326 or newer. See [Documentation](https://www.jenkins.io/redirect/AdminWhitelistRule) to learn more.

## 3.11.6

Update Jenkins image and appVersion to jenkins lts release version 2.332.1


## 3.11.5

Change Backup Role name function call to match the RoleDef function call in the Backup RoleBinding

## 3.11.4

Update Jenkins image and appVersion to jenkins lts release version 2.319.3


## 3.11.3

Update kiwigrid/k8s-sidecar:1.15.0
Update jenkins/inbound-agent:4.11.2-4

## 3.11.2

Improve example for workspaceVolume. Clarify that this is not a list.

## 3.11.1

Update configuration-as-code plugin to 1.55.1


## 3.11.0

Update default plugin versions

| plugin                | old version | new version |
| --------------------- | ----------- | ----------- |
| kubernetes            | 1.31.1      | 1.31.3      |
| git                   | 4.10.1      | 4.10.2      |

## 3.10.3

Update Jenkins image and appVersion to jenkins lts release version 2.319.2


## 3.10.2

Fix definition of startupProbe when deploying on a Kubernetes cluster < 1.16

## 3.10.1

correct VALUES_SUMMARY.md for installLatestPlugins

## 3.10.0

Update default plugin versions

| plugin                | old version | new version |
| --------------------- | ----------- | ----------- |
| kubernetes            | 1.30.11     | 1.31.1      |
| git                   | 4.10.0      | 4.10.1      |
| configuration-as-code | 1.54        | 1.55        |

## 3.9.4

Add JAVA_OPTIONS to the readme so proxy settings get picked by jenkins-plugin-cli

## 3.9.3

Fix config reload request URL when httpsKeystore in use

## 3.9.2

Update Jenkins image and appVersion to jenkins lts release version 2.319.1
Update following plugins:

* kubernetes:1.30.11
* git:4.10.0
* configuration-as-code:1.54

## 3.9.1

Adding `tpl` to `controller.overrideArgs`

## 3.9.0

Added containerSecurityContext

## 3.8.9

Fix mounting of HTTPS keystore secret when httpsKeyStore is enabled

## 3.8.8

Update Jenkins image and appVersion to jenkins lts release version 2.303.3

## 3.8.7

Adding `tpl` to `initScripts`

## 3.8.6

Add `controller.tagLabel` to specify the label for the image tag, for example `jdk11` or `alpine`

## 3.8.5

Move jenkins web root outside of home dir

## 3.8.4

Add `controller.initConfigMap` to pass pre-existing `init.groovy.d` ConfigMaps to the controller

## 3.8.3

Update missed reference to jenkins/inbound-agent:4.11-1

## 3.8.2

Update jenkins/inbound-agent:4.11-1

## 3.8.1

Update jenkins/inbound-agent:4.10-3

## 3.8.0

Update kiwigrid/k8s-sidecar:1.14.2

## 3.7.1

Update git and casc plugins versions

## 3.7.0

Added the option to create AWS SecurityGroupPolicy resources

## 3.6.2

Fix httpsKeyStore mount when `controller.httpsKeyStore.enable` is `true`

## 3.6.1

Update Jenkins image and appVersion to jenkins lts release version 2.303.2


## 3.6.0
Support custom agent pod labels

## 3.5.20
Disallow ingress on port 50000 when agent listener is disabled

## 3.5.19
Add support for specifying termination-log behaviour for Jenkins controller

## 3.5.18
Add support for creating a Pod Disruption Budget for Jenkins controller

## 3.5.17
Update workdingDir to `/home/jenkins/agent`

## 3.5.16
Update location of icon (wiki.jenkins.io is down)

## 3.5.15
Add support for adding labels to the Jenkins home Persistent Volume Claim (pvc)

## 3.5.14

* Updated versions of default plugins
* Use verbose logging during plugin installation
* download the latest version of all plugin dependencies (Fixes #442)

## 3.5.13

Update Jenkins image and appVersion to jenkins lts release version 2.303.1

## 3.5.12

Added extended documentation for Backup and Restore.

## 3.5.11

Sanitized the Jenkins Label

## 3.5.10

Fixed `controller.customJenkinsLabels` not getting templated into the controller `labelString:` field in JCasC

## 3.5.9

Update Jenkins image and appVersion to jenkins lts release version 2.289.3


## 3.5.8

Add parameter `backup.serviceAccount.create` to disable service account creation for backup service and `backup.serviceAccount.name` to allow change of the SA name.
`backup.annotations` was moved to `backup.serviceAccount.annotations`

## 3.5.7

Enable setting `controller.serviceExternalTrafficPolicy` to set [the standard Service option](https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/#preserving-the-client-source-ip). `externalTrafficPolicy` denotes if this Service desires to route external traffic to node-local or cluster-wide endpoints.

## 3.5.6

Add optional `controller.initContainerResources`, if set, it will change resources allocation for init controller, overwise the `controller.resources` will be used

## 3.5.5

Allow to configure nodeUsageMode via `agent.nodeUsageMode`

## 3.5.4

Update tests to work with unittest 0.2.6

## 3.5.3

Update Jenkins image and appVersion to jenkins lts release version 2.289.2

## 3.5.2

Enable setting `controller.installLatestSpecifiedPlugins` to set whether to download the latest dependencies of any plugin that is requested to have the latest version.

## 3.5.1
Fix activeDeadlineSeconds wrong type bug in jenkins-backup-cronjob template

## 3.5.0

Allow `controller.podAnnotations` to be render as a template

## 3.4.1

Allow showRawYaml for the default agent's pod template to be customized.

## 3.4.0

configAutoReload container updated from `kiwigrid/k8s-sidecar:0.1.275` to `kiwigrid/k8s-sidecar:1.12.2`

## 3.3.23

Make `controller.ingress.resourceRootUrl` compatible with API version networking.k8s.io/v1 on k8s >= 1.19.x

## 3.3.22

Update Jenkins image and appVersion to jenkins lts release version 2.289.1

## 3.3.21
`persistence.mounts` additionally mount to init container to allow custom CA certificate keystore

## 3.3.18
Added `controller.overrideArgs` so any cli argument can be passed to the WAR.

## 3.3.17
Correct docs on disabling plugin installation

## 3.3.16
Support generating `SecretClaim` resources in order to read secrets from HashiCorp Vault into Kubernetes using `kube-vault-controller`.

## 3.3.15
Prevent `controller.httpsKeyStore` from improperly being quoted, leading to an invalid location on disk

## 3.3.14
Correct docs on disabling plugin installation

## 3.3.13
Update plugins

## 3.3.12
Add `controller.additionalExistingSecrets` property

## 3.3.11
Add support for disabling the Agent listener service via `controller.agentListenerEnabled`.

## 3.3.10
Update Jenkins image and appVersion to jenkins lts release version 2.277.4

## 3.3.9
* Change helper template so user defined `agent.jenkinsUrl` value will always be used, if set
* Simplify logic for `jenkinsUrl` and `jenkinsTunnel` generation: always use fully qualified address

## 3.3.8
Update Jenkins image and appVersion to jenkins lts release version 2.277.3

## 3.3.7
fix controller-ingress line feed bug

## 3.3.6

Update Git plugin version to v4.7.1
Update ldap plugin version to v2.5

## 3.3.5

Use tpl function for environment vars. Fixes [https://github.com/jenkinsci/helm-charts/issues/324]

## 3.3.4

Update Jenkins image and appVersion to jenkins lts release version 2.277.2


## 3.3.3

Enable setting `controller.installLatestPlugins` to set whether to download the minimum required version of all dependencies.

## 3.3.2

Add `controller.additionalSecrets` documentation

## 3.3.1

Add `controller.additionalSecrets` property

## 3.3.0

Change default Jenkins image to `jdk11` variant

## 3.2.6

Add missing `controller.jenkinsUrlProtocol` property

## 3.2.5

Add additional metadata `artifacthub.io/images` for artifacthub

## 3.2.4
Update Jenkins image and appVersion to jenkins lts release version 2.277.1
Update Git plugin version to v4.6.0
Update kubernetes plugin version to v1.29.2

## 3.2.3

Fix rendering `controller.ingress.path`

## 3.2.2

Added description for `controller.jenkinsUrl` value

## 3.2.1

Enable setting ImagePullSecrets to controller and agent service accounts.

## 3.2.0

Calculate consistent unique agent IDs to be used in pod templates. Fixes [https://github.com/jenkinsci/helm-charts/issues/270]

## 3.1.15

Fix documentation for the kubernetes probes

## 3.1.14

Typo in documentation

## 3.1.13

Update Jenkins image and appVersion to jenkins lts release version 2.263.4

## 3.1.12

Added GitHub Action to automate the updating of LTS releases.

## 3.1.11

Enable setting controller.updateStrategy to change the update strategy for StatefulSet

## 3.1.10

Fixed issue for the AgentListener where it was not possible to attribute a NodePort

## 3.1.9

Upgrade kubernetes plugin to 1.29.0 and CasC plugin to 1.47

## 3.1.8

Fix init scripts config map name

## 3.1.7

Fix missing newline when `httpsKeyStore` is enabled

## 3.1.6

Mount controller init scripts from ConfigMap

## 3.1.5

Fix `namespaceOverride` not applied when loading JCasC

## 3.1.4

Update Git plugin version to v4.5.2

## 3.1.3

Update Jenkins image and appVersion to jenkins lts release version 2.263.3

## 3.1.2

Enable setting maxRequestsPerHostStr to change the max concurrent connections to Kubernetes API

## 3.1.1

Update Jenkins image and appVersion to jenkins lts release version 2.263.2

## 3.1.0

* Added `.Values.controller.podSecurityContextOverride` and `.Values.backup.podSecurityContextOverride`.
* Added simple default values tests for `jenkins-backup-cronjob.yaml`.

## 3.0.14

Enable to only backup job folder instead of whole jenkins

## 3.0.13

Improve Documentation around JCasc and Custom Image

## 3.0.12

Added GitHub Action testing on Kind 1.16, 1.17, 1.18, 1.19 & 1.20

## 3.0.11

Fixes & unit tests for Ingress resources on Kubernetes 1.19 and above

## 3.0.10

Ingress resources on Kubernetes 1.19 (or above) are created with the version `networking.k8s.io/v1`

## 3.0.9

Added support for backing up to Azure Blob Storage.

## 3.0.8

* Typo in documentation

## 3.0.7

* Add support for setting default agent workspaceVolume

## 3.0.6

Use 2.263.1 image

## 3.0.5

* Update appVersion to reflect new jenkins lts release version 2.263.1

## 3.0.4

* Fix documentation for additional secret mounts

## 3.0.3

* Update `README.md` with explanation on how to mount additional secrets

## 3.0.2

* Fix `.Values.controller.tolerations` and `.Values.controller.nodeSelector` variable names in templates\jenkins-backup-cronjob.yaml

## 3.0.1

* added 'runAsNonroot' to security context

## 3.0.0

* Chart uses StatefulSet instead of Deployment
* XML configuration was removed in favor of JCasC
* chart migrated to helm 3.0.0 (apiVersion v2)
* offending terms have been removed
* values have been renamed and re-ordered to make it easier to use
* already deprecated items have been removed
* componentName for the controller is now `jenkins-controller`
* componentName for the agent is now `jenkins-agent`
* container names are now
  * `init` for the init container which downloads Jenkins plugins
  * `jenkins` for the Jenkins controller
  * `config-reload` for the sidecar container which automatically reloads JCasC
* Updated UI tests to use official `bats/bats` image instead of `dduportal/bats`

For migration instructions from previous versions and additional information check README.md.

## 2.19.0

* Use lts version 2.249.3
* Update kubernetes, workflow-aggregator, git and configuration-as-code plugins.
* Fail apply_config.sh script if an error occurs.

## 2.18.2

Fix: `master.javaOpts` issue with quoted values

## 2.18.1

Recommend installing plugins in custom image

## 2.18.0

Removed /tmp volume. Making /tmp a volume causes permission issues with jmap/jstack on certain Kubernetes clusters

## 2.17.1

Fix location of jenkins.war file.
It is located in `/usr/share/jenkins/jenkins.war` and can be fonfigured via `master.jenkinsWar`.

## 2.17.0

Add support for plugin-installation-manager-tool

## 2.16.0

Added Startup probe for Jenkins pod when Kubernetes cluster is 1.16 or newer

## 2.15.5

scriptApproval is taken into account when enableXmlConfig is false.

## 2.15.4

Add Tilt support for easier helm chart development.

## 2.15.3

Fix error on missing `ingress.paths` value

## 2.15.2

Added documentation for ingress and jenkins URL

## 2.15.1

Fix priorityClassName entry in values.yaml file

## 2.15.0

Added support for disabling the helm.sh/chart annotation

## 2.14.0

Added support for annotations in podTemplates

## 2.13.2

Add nodeSelector in the backup pod
Fix tolerations in the backup pod

## 2.13.1

Update list of maintainers

## 2.13.0

Added Support for websockets in the default Jcasc config
Added trailing slash to JENKINS_URL env var

## 2.12.2

Added unit tests for most resources in the Helm chart.

## 2.12.1

Helm chart readme update

## 2.12.0

Add option to configure securityContext capabilities

## 2.11.0

Added configurable security context for jenkins backup CronJob and annotations to its serviceaccount.

## 2.10.0

Make activeDeadlineSeconds for backup job configurable

## 2.9.0

Make namespace of PrometheusRule configurable

## 2.8.2

Bumped configuration-as-code plugin version from 1.41 to 1.43.
See [configuration-as-code plugin issue #1478](https://github.com/jenkinsci/configuration-as-code-plugin/issues/1478)

## 2.8.1

Fix indentation of JAVA_OPTS

## 2.8.0

Add support for helm unittest and include first tests

## 2.7.2

Target port of container `jenkins-sc-config` taken the value from values.yaml.

## 2.7.0

Add a secondary ingress template for those who want a second ingress with different labels or annotations or whatever else.

Example: You want /github-webhook to be on a public ingress, while the main Jenkins intance to be on a private locked down ingress.

## 2.6.5

Update configScripts example

## 2.6.4

Add timja as a maintainer

## 2.6.3

Update k8s-sidecar image to 0.1.193

## 2.6.2

Only mount empty dir secrets-dir if either `master.enableXmlConfig` or `master.secretsFilesSecret` is set
Fixes #19

## 2.6.1 Do not render empty JCasC templates

## 2.6.0 First release in jenkinsci GitHub org

Updated readme for new location

## 2.5.2

Fix as per JENKINS-47112

## 2.5.1

Support Jenkins Resource Root URL

## 2.5.0

Add an option to specify that Jenkins master should be initialized only once, during first install.

## 2.4.1

Reorder readme parameters into sections to facilitate chart usage and maintenance

## 2.4.0 Update default agent image

`jenkins/jnlp-slave` is deprected and `jenkins/inbound-agent` should be used instead.
Also updated it to newest version (4.3-4).

## 2.3.3 correct templating of master.slaveJenkinsUrl

Fixes #22708

## 2.3.2 Fix wrong value for overwritePluginsFromImage

Fixes #23003
Fixes #22633

Also fixes indentation for #23114

## 2.3.1

Always mount {{ .Values.master.jenkinsRef }}/secrets/ directory. Previous it
was mounted only when `master.enableXmlConfig` was enabled.

## 2.3.0

Add an option to specify pod based on labels that can connect to master if NetworkPolicy is enabled

## 2.2.0 increase retry for config auto reload

Configure `REQ_RETRY_CONNECT` to `10` to give Jenkins more time to start up.
<https://github.com/kiwigrid/k8s-sidecar>

Value can be configured via `master.sidecars.configAutoReload.reqRetryConnect`

## 2.1.2 updated readme

## 2.1.1 update credentials-binding plugin to 1.23

## 2.1.0

Add support to set `runAsUser` and `runAsGroup` for `agent`.

## 2.0.1

Only render authorizationStrategy and securityRealm when values are set.

## 2.0.0 Configuration as Code now default + container does not run as root anymore

The readme contains more details for this update.
Please note that the updated values contain breaking changes.

## 1.27.0 Update plugin versions & sidecar container

| plugin                | old version | new version |
| --------------------- | ----------- | ----------- |
| kubernetes            | 1.25.3      | 1.25.7      |
| workflow-job          | 2.38        | 2.39        |
| credentials-binding   | 1.21        | 1.22        |
| configuration-as-code | 1.39        | 1.41        |

configAutoReload container updated from `kiwigrid/k8s-sidecar:0.1.132` to `kiwigrid/k8s-sidecar:0.1.144`

## 1.26.0

Add support to override `workingDir` for default pod template

## 1.25.0

Add support for installing plugins in addition to the chart's default plugins via `master.additionalPlugins`

## 1.24.0

Allow configuration of yamlMergeStrategy via `agent.yamlMergeStrategy`

## 1.23.2

In the `jenkins.xml.podTemplate` helper function, allow templating of all string values under `agent.volumes` except `type` by rendering them with the `tpl` function

## 1.23.1

Added auto detection for Ingress API version

## 1.23.0

Allow to use an existing secret for the jenkins admin credentials

## 1.22.0

Add support for UI security in the default JCasC via `master.JCasC.securityRealm` and `master.JCasC.authorizationStrategy` which deny anonymous access by default

## 1.21.3

Render `agent.envVars` in kubernetes pod template JCasC

## 1.21.2

Cleanup `agent.yamlTemplate` rendering in kubernetes pod template XML configuration

## 1.21.1

Render `agent.nodeSelector` in the kubernetes pod template JCasC

## 1.21.0

Add support for overriding Ingress paths via `master.ingress.paths`

## 1.20.0

Add the following options for configuring the Kubernetes plugin.

- master.slaveDefaultsProviderTemplate
- master.slaveJenkinsUrl
- master.slaveJenkinsTunnel
- master.slaveConnectTimeout
- master.slaveReadTimeout

## 1.19.0

Add support for disabling remember me via `master.disableRememberMe`
Add support for using a different markup formatter via `master.markupFormatter`

## 1.18.1

Add support for executor mode configuraton with `master.executorMode`.

## 1.18.0 Make installation of configuration-as-code plugin explicit

Instead of configuring the configuration-as-code plugin version via
`master.JCasC.pluginVersion` it is now installed via `master.installPlugins`

## 1.17.2

Allow templating of `serviceAccount.annotations` and `serviceAccountAgent.annotations` by rendering them with the `tpl` function

## 1.17.1

Add support for Persistent Volume Claim (PVC) in `agent.volumes`

## 1.17.0

Render `agent.volumes` in kubernetes pod template JCasC

## 1.16.2

Reverts 1.16.1 as it introduced an error #22047

## 1.16.1

Fixed a bug with master.runAsUser variable due to use wrong type for comparison.

## 1.16.0

Add `master.overwritePluginsFromImage` to allow support for jenkins plugins installed in the master image to persist.

## 1.15.0 Update plugin versions & sidecar container

| plugin                | old version | new version |
| --------------------- | ----------- | ----------- |
| kubernetes            | 1.25.1      | 1.25.3      |
| workflow-job          | 2.36        | 2.38        |
| git                   | 4.2.0       | 4.2.2       |
| configuration-as-code | 1.36        | 1.39        |

configAutoReload container updated from `kiwigrid/k8s-sidecar:0.1.20` to `kiwigrid/k8s-sidecar:0.1.132`

## 1.14.0

support auto-reload container environment variables configuration

## 1.13.3

Fix wrong indent in tolerations

## 1.13.2

Add support for custom ClusterIP

## 1.13.1

Fix `agent.yamlTemplate` rendering in kubernetes pod template JCasC

## 1.13.0

Add `master.networkPolicy.internalAgents` and `master.networkPolicy.externalAgents` stanzas to fine grained controls over where internal/external agents can connect from. Internal ones are allowed based on pod labels and (optionally) namespaces, and external ones are allowed based on IP ranges.

## 1.12.0 Support additional agents

Add support for easy configuration of additional agents which inherit values from `agent`.

## 1.11.3

Update the kubernetes plugin from 1.24.1 to 1.25.1 and grant 'watch' permission to 'events' which is required since this plugin version.

## 1.11.2 Configure agent.args in values.yaml

## 1.11.1 Support for master.additionalConfig

Fixed a bug with jenkinsHome variable in range block when master.additionalConfig is set - Helm cannot evaluate field Values in type interface {}.

## 1.11.0 Add support for configuring custom pod templates

Add `agent.podTemplates` option for declaring custom pod templates in the default configured kubernetes cloud.

## 1.10.1 Only copy JCasC files if there are any

The chart always tried to copy Configuration as Code configs even if there are none. That resulted in an error which is resolved with this.

## 1.10.0 Remove configuration-as-code-support plugins

In recent version of configuration-as-code-plugin this is no longer necessary.

## 1.9.24

Update JCasC auto-reload docs and remove stale SSH key references from version "1.8.0 JCasC auto reload works without SSH keys"

## 1.9.23 Support jenkinsUriPrefix when JCasC is enabled

Fixed a bug in the configuration as code reload URL, where it wouldn't work with a jenkinsUriPrefix set.

## 1.9.22

Add `master.jenkinsHome` and `master.jenkinsRef` options to use docker images derivates from Jenkins

## 1.9.21

Add `master.terminationGracePeriodSeconds` option

## 1.9.20

Update default plugins

- kubernetes:1.24.1
- workflow-job:2.36
- workflow-aggregator:2.6
- credentials-binding:1.21
- git:4.2.0
- configuration-as-code:1.36

## 1.9.19

Update docs for Helm 3

## 1.9.18

Make `jenkins-home` attachable to Azure Disks without pvc

```yaml
 volumes:
  - name: jenkins-home
    azureDisk:
      kind: Managed
      diskName: myAKSDisk
      diskURI: /subscriptions/<subscriptionID>/resourceGroups/MC_myAKSCluster_myAKSCluster_eastus/providers/Microsoft.Compute/disks/myAKSDisk
```

## 1.9.16

Fix PodLabel for NetworkPolicy to work if enabled

## 1.9.14

Properly fix case sense in `Values.master.overwriteConfig` in `config.yaml`

## 1.9.13

Fix case sense in `Values.master.overwriteConfig` in `config.yaml`

## 1.9.12

Scriptapprovals are overwritten when overwriteConfig is enabled

## 1.9.10

Added documentation for `persistence.storageClass`.

## 1.9.9
Make `master.deploymentAnnotation` configurable.

## 1.9.8

Make `agent.slaveConnectTimeout` configurable: by increasing this value Jenkins will not cancel&ask k8s for a pod again, while it's on `ContainerCreating`. Useful when you have big images or autoscaling takes some time.

## 1.9.7 Update plugin versions

| plugin                | old version | new version |
|-----------------------|-------------|-------------|
| kubernetes            | 1.18.2      | 1.21.2      |
| workflow-job          | 2.33        | 2.36        |
| credentials-binding   | 1.19        | 1.20        |
| git                   | 3.11.0      | 4.0.0       |
| configuration-as-code | 1.27        | 1.32        |

## 1.9.6

Enables jenkins to use keystore inorder to have native ssl support #17790 <https://wiki.jenkins.io/pages/viewpage.action?pageId=135468777>

## 1.9.5 Enable remoting security

`Manage Jenkins` -> `Configure Global Security` -> `Enable Agent → Master Access Control` is now enabled via configuration as code plugin

## 1.9.4 Option to set existing secret with Google Application Default Credentials

Google application credentials are kept in a file, which has to be mounted to a pod. You can set `gcpcredentials` in `existingSecret` as follows:

```yaml
 existingSecret:
    jenkins-service-account:
      gcpcredentials: application_default_credentials.json
```

Helm template then creates the necessary volume mounts and `GOOGLE_APPLICATION_CREDENTIALS` environmental variable.

## 1.9.3 Fix `JAVA_OPTS` when config auto-reload is enabled

## 1.9.2 Add support for kubernetes-credentials-provider-plugin

[kubernetes-credentials-provider-plugin](https://jenkinsci.github.io/kubernetes-credentials-provider-plugin/) needs permissions to get/watch/list kubernetes secrets in the namespaces where Jenkins is running.

The necessary role binding can be created using `rbac.readSecrets` when `rbac.create` is `true`.

To quote from the plugin documentation:

> Because granting these permissions for secrets is not something that should be done lightly it is highly advised for security reasons that you both create a unique service account to run Jenkins as, and run Jenkins in a unique namespace.

Therefor this is disabled by default.

## 1.9.1 Update kubernetes plugin URL

## 1.9.0 Change default serviceType to ClusterIP

## 1.8.2

Revert fix in `1.7.10` since direct connection is now disabled by default.

## 1.8.1

Add `master.schedulerName` to allow setting a Kubernetes custom scheduler

## 1.8.0 JCasC auto reload works without SSH keys

We make use of the fact that the Jenkins Configuration as Code Plugin can be triggered via http `POST` to `JENKINS_URL/configuration-as-code/reload`and a pre-shared key.
The sidecar container responsible for reloading config changes is now `kiwigrid/k8s-sidecar:0.1.20` instead of it's fork `shadwell/k8s-sidecar`.

References:

- [Triggering Configuration Reload](https://github.com/jenkinsci/configuration-as-code-plugin/blob/master/docs/features/configurationReload.md)
- [kiwigrid/k8s-sidecar](https://hub.docker.com/r/kiwigrid/k8s-sidecar)

`master.sidecars.configAutoReload.enabled` now works using `casc.reload.token`

## 1.7.10

Disable direct connection in default configuration (when kubernetes plugin version >= 1.20.2).
Note: In case direct connection is going to be used `jenkins/jnlp-slave` needs to be version `3.35-5` or newer.

## 1.7.9

Prevented Jenkins Setup Wizard on new installations

## 1.7.8

Extend extraPorts to be opened on the Service object, not just the container.

## 1.7.7

Add persistentvolumeclaim permission to the role to support new dynamic pvc workspaces.

## 1.7.6

Updated `master.slaveKubernetesNamespace` to parse helm templates.
Defined an sensible empty value to the following variables, to silence invalid warnings:

- master.extraPorts
- master.scriptApproval
- master.initScripts
- master.JCasC.configScripts
- master.sidecars.other
- agent.envVars
- agent.volumes

## 1.7.5

Fixed an issue where the JCasC won't run if JCasC auto-reload is enabled [issue #17135](https://github.com/helm/charts/issues/17135)

## 1.7.4

Comments out JCasC example of jenkins.systemMessage so that it can be used by end users. Previously, an attempt to set systemMessage causes Jenkins to startup, citing duplicate JCasC settings for systemMessage [issue #13333](https://github.com/helm/charts/issues/13333)

## 1.7.2

Update kubernetes-plugin to version 1.18.2 which fixes frequently encountered [JENKINS-59000](https://issues.jenkins-ci.org/plugins/servlet/mobile#issue/JENKINS-59000)

## 1.7.1

Update the default requirements for jenkins-agent to 512Mi which fixes frequently encountered [issue #3723](https://github.com/helm/charts/issues/3723)

## 1.7.0

[Jenkins Configuration as Code Plugin](https://github.com/jenkinsci/configuration-as-code-plugin) default configuration can now be enabled via `master.JCasC.defaultConfig`.

JCasC default configuration includes:

- Jenkins URL
- Admin email `master.jenkinsAdminEmail`
- crumbIssuer
- disableRememberMe: false
- mode: NORMAL
- numExecutors: {{ .Values.master.numExecutors }}
- projectNamingStrategy: "standard"
- kubernetes plugin
  - containerCapStr via `agent.containerCap`
  - jenkinsTunnel
  - jenkinsUrl
  - maxRequestsPerHostStr: "32"
  - name: "kubernetes"
  - namespace
  - serverUrl: `"https://kubernetes.default"`
  - template
    - containers
      - alwaysPullImage: `agent.alwaysPullImage`
      - args
      - command
      - envVars
      - image: `agent.image:agent.imageTag`
      - name: `.agent.sideContainerName`
      - privileged: `.agent.privileged`
      - resourceLimitCpu: `agent.resources.limits.cpu`
      - resourceLimitMemory: `agent.resources.limits.memory`
      - resourceRequestCpu: `agent.resources.requests.cpu`
      - resourceRequestMemory: `agent.resources.requests.memory`
      - ttyEnabled: `agent.TTYEnabled`
      - workingDir: "/home/jenkins"
    - idleMinutes: `agent.idleMinutes`
    - instanceCap: 2147483647
    - imagePullSecrets:
      - name: `.agent.imagePullSecretName`
    - label
    - name
    - nodeUsageMode: "NORMAL"
    - podRetention: `agent.podRetention`
    - serviceAccount
    - showRawYaml: true
    - slaveConnectTimeoutStr: "100"
    - yaml: `agent.yamlTemplate`
    - yamlMergeStrategy: "override"
- security:
  - apiToken:
    - creationOfLegacyTokenEnabled: false
    - tokenGenerationOnCreationEnabled: false
    - usageStatisticsEnabled: true

Example `values.yaml` which enables JCasC, it's default config and configAutoReload:

```yaml
master:
  JCasC:
    enabled: true
    defaultConfig: true
  sidecars:
    configAutoReload:
      enabled: true
```

add master.JCasC.defaultConfig and configure location

- JCasC configuration is stored in template `jenkins.casc.defaults`
  so that it can be used in `config.yaml` and `jcasc-config.yaml`
  depending on if configAutoReload is enabled or not

- Jenkins Location (URL) is configured to provide a startin point
  for the config

## 1.6.1

Print error message when `master.sidecars.configAutoReload.enabled` is `true`, but the admin user can't be found to configure the SSH key.

## 1.6.0

Add support for Google Cloud Storage for backup CronJob (migrating from nuvo/kube-tasks to maorfr/kube-tasks)

## 1.5.9

Fixed a warning when sidecar resources are provided through a parent chart or override values

## 1.5.8

Fixed an issue when master.enableXmlConfig is set to false: Always mount jenkins-secrets volume if secretsFilesSecret is set (#16512)

## 1.5.7

added initial changelog (#16324)
commit: cee2ebf98

## 1.5.6

enable xml config misspelling (#16477)
commit: a125b99f9

## 1.5.5

Jenkins master label (#16469)
commit: 4802d14c9

## 1.5.4

add option enableXmlConfig (#16346)
commit: 387d97a4c

## 1.5.3

extracted "jenkins.URL" into template (#16347)
commit: f2fdf5332

## 1.5.2

Fix backups when deployment has custom name (#16279)
commit: 16b89bfff

## 1.5.1

Ability to set custom namespace for ServiceMonitor (#16145)
commit: 18ee6cf01

## 1.5.0

update Jenkins plugins to fix security issue (#16069)
commit: 603cf2d2b

## 1.4.3

Use fixed container name (#16068)
commit: b3e4b4a49

## 1.4.2

Provide default job value (#15963)
commit: c462e2017

## 1.4.1

Add Jenkins backendconfig values (#15471)
commit: 7cc9b54c7

## 1.4.0

Change the value name for docker image tags - standartise to helm preferred value name - tag; this also allows auto-deployments using weaveworks flux (#15565)
commit: 5c3d920e7

## 1.3.6

jenkins deployment port should be target port (#15503)
commit: 83909ebe3

## 1.3.5

Add support for namespace specification (#15202)
commit: e773201a6

## 1.3.4

Adding sub-path option for scraping (#14833)
commit: e04021154

## 1.3.3

Add existingSecret to Jenkins backup AWS credentials (#13392)
commit: d9374f57d

## 1.3.2

Fix JCasC version (#14992)
commit: 26a6d2b99

## 1.3.1

Update affinity for a backup cronjob (#14886)
commit: c21ed8331

## 1.3.0

only install casc support plugin when needed (#14862)
commit: a56fc0540

## 1.2.2

DNS Zone customization (#14775)
commit: da2910073

## 1.2.1

only render comment if configAutoReload is enabled (#14754)
commit: e07ead283

## 1.2.0

update plugins to latest version (#14744)
commit: 84336558e

## 1.1.24

add example for EmptyDir volume (#14499)
commit: cafb60209

## 1.1.23

check if installPlugins is set before using it (#14168)
commit: 1218f0359

## 1.1.22

Support servicemonitor and alerting rules (#14124)
commit: e15a27f48

## 1.1.21

Fix: healthProbe timeouts mapping to initial delay (#13875)
commit: 825b32ece

## 1.1.20

Properly handle overwrite config for additional configs (#13915)
commit: 18ce9b558

## 1.1.18

update maintainer (#13897)
commit: 223002b27

## 1.1.17

add apiVersion (#13795)
commit: cd1e5c35a

## 1.1.16

allow changing of the target port to support TLS termination sidecar (#13576)
commit: a34d3bbcc

## 1.1.15

fix wrong pod selector in jenkins-backup (#13542)
commit: b5df4fd7e

## 1.1.14

allow templating of customInitContainers (#13536)
commit: d1e1421f4

## 1.1.13

fix #13467 (wrong deprecation message) (#13511)
commit: fbe28fa1c

## 1.1.12

Correct customInitContainers Name example. (#13405)
commit: 6c6e40405

## 1.1.11

fix master.runAsUser, master.fsGroup examples (#13389)
commit: 2d7e5bf72

## 1.1.10

Ability to specify raw yaml template (#13319)
commit: 77aaa9a5f

## 1.1.9

correct NOTES.txt - use master.ingress.hostname (#13318)
commit: b08ef6280

## 1.1.8

explain how to upgrade major versions (#13273)
commit: e7617a97e

## 1.1.7

Add support for idleMinutes and serviceAccount (#13263)
commit: 4595ee033

## 1.1.6

Use same JENKINS_URL no matter if slaves use different namespace (#12564)
commit: 94c90339f

## 1.1.5

fix deprecation checks (#13224)
commit: c7d2f8105

## 1.1.4

Fix issue introduced in #13136 (#13232)
commit: 0dbcded2e

## 1.1.3

fix chart errors (#13197)
commit: 692a1e3da

## 1.1.2

correct selector for jenkins pod (#13200)
commit: 4537e7fda

## 1.1.1

Fix rendering of customInitContainers and lifecycle for Jenkins helm chart (#13189)
commit: e8f6b0ada

## 1.1.0

Add support for openshift route in jenkins (#12973)
commit: 48c58a430

## 1.0.0

helm chart best practices (#13136)
commit: b02ae3f48

### Breaking changes

- values have been renamed to follow helm chart best practices for naming conventions so
  that all variables start with a lowercase letter and words are separated with camelcase
  <https://helm.sh/docs/chart_best_practices/#naming-conventions>
- all resources are now using recommended standard labels
  <https://helm.sh/docs/chart_best_practices/#standard-labels>

As a result of the label changes also the selectors of the deployment have been updated.
Those are immutable so trying an updated will cause an error like:

```text
Error: Deployment.apps "jenkins" is invalid: spec.selector: Invalid value: v1.LabelSelector{MatchLabels:map[string]string{"app.kubernetes.io/component":"jenkins-master", "app.kubernetes.io/instance":"jenkins"}, MatchExpressions:[]v1.LabelSelectorRequirement(nil)}: field is immutable
```

In order to upgrade, delete the Jenkins Deployment before upgrading:

```console
kubectl delete deploy jenkins
```

## 0.40.0

Allow to override jenkins location protocol (#12257)
commit: 18a830626

## 0.39.0

Add possibility to add custom init-container and lifecycle for master-container (#13062)
commit: 14d043593

## 0.38.0

Support `priorityClassName` on Master Deployment (#13069)
commit: e896c62bc

## 0.37.3

Add support for service account annotations in jenkins (#12969)
commit: b22774e2f

## 0.37.2

fix: add hostName to ingress in values.yaml (#12946)
commit: 041045e9b

## 0.37.1

Update to match actual defaults in value.yaml (#12904)
commit: 73b6d37eb

## 0.37.0

Support multiple Jenkins instances in same namespace (#12748)
commit: 32ff2f343

## 0.36.5

Fix wrong comment in values.yaml (#12761)
commit: 9db8ced23

## 0.36.4

Re-add value for Ingress API Version (#12753)
commit: ecb7791b5

## 0.36.3

allow templating of volumes (#12734)
commit: adbda2ca6

## 0.36.2

Fix self-introduced whitespace bug (#12528)
commit: eec1678eb

## 0.36.1

Add flag to overwrite jobs definition from values.yaml (#12427)
commit: fd349b2fc

## 0.36.0

Replace OwnSshKey with AdminSshKey (#12140) (#12466)
commit: 80a8c9eb6

## 0.35.2

add note for breaking changes (#12203)
commit: e779c5a54

## 0.35.1

Allow Jenkins to run with READONLYROOTFS psp (#12338)
commit: 7c419e191

## 0.35.0

Jenkins OverwriteConfig setting also overwrites init scripts (#9468)
commit: 501335b76

## 0.34.1

Fix typo on hostname variable (#12156)
commit: 3d337d8dd

## 0.34.0

Allow ingress without host rule (#11960)
commit: ddc966d1e

## 0.33.2

Improve documentation - clarify that rbac is needed for autoreload (#11739)
commit: 9d75a5c34

## 0.33.1

use object for rollingUpdate (#11909)
commit: cb9cf21e8

## 0.33.0

Add hostAliases (#11701)
commit: 0b89e1094

## 0.32.10

Fix slave jnlp port always being reset when container is restarted (#11685)
commit: d7d51797b

## 0.32.9

add ingress Hostname an ApiVersion to docs (#11576)
commit: 4d3e77137

## 0.32.8

Support custom master pod labels in deployment (#9714) (#11511)
commit: 9de96faa0

## 0.32.7

Fix Markdown syntax in readme (#11496)
commit: a32221a95

## 0.32.6

Added custom labels on jenkins ingress (#11466)
commit: c875d2b9b

## 0.32.5

fix typo in default jenkins agent image fixes #11356 (#11463)
commit: 30adb9a91

## 0.32.4

fix incorrect Deployment when using sidecars (#11413)
commit: 362b4cef8

## 0.32.3

[]: #10131 (#11411)
commit: 49cb72055

## 0.32.2

Option to expose the slave listener port as host port (#11187)
commit: 2f85a9663

## 0.32.1

Updating Jenkins deployment fails appears rollingUpdate needs to be (#11166)
commit: 07fc9dbde

## 0.32.0

Merge Sidecard configs (#11339)
commit: 3696090b9

## 0.31.0

Add option to overwrite plugins (#11231)
commit: 0e9aa00a5

## 0.30.0

Added slave Pod env vars (#8743)
commit: 1499f6608

## 0.29.3

revert indentation to previous working version (#11293)
commit: 61662f17a

## 0.29.2

allow running sidecar containers for Jenkins master (#10950)
commit: 9084ce54a

## 0.29.1

Indent lines related to EnableRawHtmlMarkupFormatter (#11252)
commit: 20b310c08

## 0.29.0

Jenkins Configuration as Code (#9057)
commit: c3e8c0b17

## 0.28.11

Allow to enable OWASP Markup Formatter Plugin (#10851)
commit: 9486e5ddf

## 0.28.10

Fixes #1341 -- update Jenkins chart documentation (#10290)
commit: 411c81cd0

## 0.28.9

Quoted JavaOpts values (#10671)
commit: 926a843a8

## 0.28.8

Support custom labels in deployment (#9714) (#10533)
commit: 3e00b47fa

## 0.28.7

separate test resources (#10597)
commit: 7b7ae2d11

## 0.28.6

allow customizing livenessProbe periodSeconds (#10534)
commit: 3c94d250d

## 0.28.5

Add role kind option (#8498)
commit: e791ad124

## 0.28.4

workaround for busybox's cp (Closes: #10471) (#10497)
commit: 0d51a4187

## 0.28.3

fix parsing java options (#10140)
commit: 9448d0293

## 0.28.2

Fix job definitions in standard values.yaml (#10184)
commit: 6b6355ae7

## 0.28.1

add numExecutors as a variable in values file (#10236)
commit: d5ea2050f

## 0.28.0

various (#10223)
commit: e17d2a65d

## 0.27.0

add backup cronjob (#10095)
commit: 863ead8db

## 0.26.2

add namespace flag for port-forwarding in jenkins notes (#10399)
commit: 846b589a9

## 0.26.1

- fixes #10267 when executed with helm template - otherwise produces an invalid template. (#10403)
  commit: 266f9d839

## 0.26.0

Add subPath for jenkins-home mount (#9671)
commit: a9c76ac9b

## 0.25.1

update readme to indicate the correct image that is used by default (#9915)
commit: 6aba9631c

## 0.25.0

Add ability to manually set Jenkins URL (#7405)
commit: a0178fcb4

## 0.24.0

Make AuthorizationStrategy configurable (#9567)
commit: 06545b226

## 0.23.0

Update Jenkins public chart (#9296)
commit: 4e5f5918b

## 0.22.0

allow to override jobs (#9004)
commit: dca9f9ab9

## 0.21.0

Simple implementation of the option to define the ingress path to the jenkins service (#8101)
commit: 013159609

## 0.20.2

Cosmetic change to remove necessity of changing "appVersion" for every new LTS release (#8866)
commit: f52af042a

## 0.20.1

Added ExtraPorts to open in the master pod (#7759)
commit: 78858a2fb

## 0.19.1

Fix component label in NOTES.txt ... (#8300)
commit: c5494dbfe

## 0.19.0

Kubernetes 1.9 support as well as automatic apiVersion detection (#7988)
commit: 6853ad364

## 0.18.1

Respect SlaveListenerPort value in config.xml (#7220)
commit: 0a5ddac35

## 0.18.0

Allow replacement of Jenkins config with configMap. (#7450)
commit: c766da3de

## 0.17.0

Add option to allow host networking (#7530)
commit: dc2eeff32

## 0.16.25

add custom jenkins labels to the build agent (#7167)
commit: 3ecde5dbf

## 0.16.24

Move kubernetes and job plugins to latest versions (#7438)
commit: 019e39456

## 0.16.23

Add different Deployment Strategies based on persistence (#6132)
commit: e0a20b0b9

## 0.16.22

avoid linting errors when adding Values.Ingress.Annotations (#7425)
commit: 99eacc854

## 0.16.21

bump appVersion to reflect new jenkins lts release version 2.121.3 (#7217)
commit: 296df165d

## 0.16.20

Configure kubernetes plugin for including namespace value (#7164)
commit: c0dc6cc48

## 0.16.19

make pod retention policy setting configurable (#6962)
commit: e614c1033

## 0.16.18

Update plugins version (#6988)
commit: bf8180018

## 0.16.17

Add Master.AdminPassword in readme (#6987)
commit: 13e754ad7

## 0.16.16

Added jenkins location configuration (#6573)
commit: 79de7026c

## 0.16.15

use generic env var, not oracle specific env var (#6116)
commit: 6084ab4a4

## 0.16.14

Allow to specify resource requests and limits on initContainers (#6723)
commit: 942a33b1a

## 0.16.13

Added support for NodePort service type for jenkens agent svc (#6571)
commit: 89a213c2b

## 0.16.12

Added ability to configure multiple LoadBalancerSourceRanges (#6243)
commit: 01604ddbc

## 0.16.11

Removing ContainerPort configuration as at the moment it does not work when you change this setting (#6411)
commit: e1c0468bd

## 0.16.9

Fix jobs parsing for configmap by adding toYaml to jobs.yaml template (#3747)
commit: b2542a123

## 0.16.8

add jenkinsuriprefix in healthprobes (#5737)
commit: 435d7a7b9

## 0.16.7

Added the ability to switch from ClusterRoleBinding to RoleBinding. (#6190)
commit: dde03ede0

## 0.16.6

Make jenkins master pod security context optional (#6122)
commit: 63653fd59

## 0.16.5

Rework resources requests and limits (#6077) (#6077)
commit: e738f99d0

## 0.16.4

Add jenkins master pod annotations (#6313)
commit: 5e7325721

## 0.16.3

Split Jenkins readiness and liveness probe periods (#5704)
commit: fc6100c38

## 0.16.1

fix typo in jenkins readme (#5228)
commit: 3cd3f4b8b

## 0.16.0

Inherit existing plugins from Jenkins image (#5409)
commit: fd93bff82

## 0.15.1

Allow NetworkPolicy.ApiVersion and Master.Ingress.ApiVersion to Differ (#5103)
commit: 78ee4ba15

## 0.15.0

Secure Defaults (#5026)
commit: 0fe90b520

## 0.14.6

Wait for up to 2 minutes before failing liveness check (#5161)
commit: 2cd3fc481

## 0.14.5

correct ImageTag setting (#4371)
commit: 8ea04174d

## 0.14.4

Update jenkins/README.md (#4559)
commit: d4e6352dd

## 0.14.3

Bump appVersion (#4177)
commit: 605d3d441

## 0.14.2

Master.InitContainerEnv: Init Container Env Vars (#3495)
commit: c64abe27d

## 0.14.1

Allow more configuration of Jenkins agent service (#4028)
commit: fc82f39b2

## 0.14.0

Add affinity settings (#3839)
commit: 64e82fa6a

## 0.13.5

bump test timeouts (#3886)
commit: cd05dd99c

## 0.13.4

Add OWNERS to jenkins chart (#3881)
commit: 1c106b9c8

## 0.13.3

Add fullnameOverride support (#3705)
commit: ec8080839

## 0.13.2

Update README.md (#3638)
commit: f6d274c37

## 0.13.1

Lower initial healthcheck delay (#3463)
commit: 9b99db67c

## 0.13.0

Provision credentials.xml, secrets files and jobs (#3316)
commit: d305c5961

## 0.12.1

fix the default value for nodeUsageMode. (#3299)
commit: b68d19516

## 0.12.0

Recreate pods when CustomConfigMap is true and there are changes to the ConfigMap (which is how the vanilla chart works) (#3181)
commit: 86d29f804

## 0.11.1

Optionally adds liveness and readiness probes to jenkins (#3245)
commit: 8b9aa73ee

## 0.11.0

Feature/run jenkins as non root user (#2899)
commit: 8918f4175

## 0.10.3

template the version to keep them synced (#3084)
commit: 35e7fa49a

## 0.10.2

Update Chart.yaml
commit: e3e617a0b

## 0.10.1

Merge branch 'master' into jenkins-test-timeout
commit: 9a230a6b1

Double retry count for Jenkins test
commit: 129c8e824

Jenkins: Update readme | Master.ServiceAnnotations (#2757)
commit: 6571810bc

## 0.10.0

Update Jenkins images and plugins (#2496)
commit: 2e2622682

## 0.9.4

Updating to remove the `.lock` directory as well (#2747)
commit: 6e676808f

## 0.9.3

Use variable for service port when testing (#2666)
commit: d044f99be

## 0.9.2

Review jenkins networkpolicy docs (#2618)
commit: 49911e458

Add image pull secrets to jenkins templates (#1389)
commit: 4dfae21fd

## 0.9.1

Added persistent volume claim annotations (#2619)
commit: ac9e5306e

Fix failing CI lint (#2758)
commit: 26f709f0e

## 0.9.0

namespace defined templates with chart name (#2140)
commit: 408ae0b3f

## 0.8.9

added useSecurity and adminUser to params (#1903)
commit: 39d2a03cd

Use storageClassName for jenkins. (#1997)
commit: 802f6449b

## 0.8.8

Remove old plugin locks before installing plugins (#1746)
commit: 6cd7b8ff4

promote initContainrs to podspec (#1740)
commit: fecc804fc

## 0.8.7

add optional LoadBalancerIP option. (#1568)
commit: d39f11408

## 0.8.6

Fix bad key in values.yaml (#1633)
commit: dc27e5af3

## 0.8.5

Update Jenkins to support node selectors for agents. (#1532)
commit: 4af5810ff

## 0.8.4

Add support for supplying JENKINS_OPTS and/or URI prefix (#1405)
commit: 6a331901a

## 0.8.3

Add serviceAccountName to deployment (#1477)
commit: 0dc349b44

## 0.8.2

Remove path from ingress specification to allow other paths (#1599)
commit: e727f6b32

Update git plugin to 3.4.0 for CVE-2017-1000084 (#1505)
commit: 03482f995

## 0.8.1

Use consistent whitespace in template placeholders (#1437)
commit: 912f50c71

add configurable service annotations #1234 (#1244)
commit: 286861ca8

## 0.8.0

Jenkins v0.8.0 (#1385)
commit: 0009a2393

## 0.7.4

Use imageTag as version in config map (#1333)
commit: e8bb6ebb4

## 0.7.3

Add NetworkPolicy to Jenkins (#1228)
commit: 572b36c6d

## 0.7.2

- Workflow plugin pin (#1178)
  commit: ac3a0c7bc

## 0.7.1

copy over plugins.txt in case of update (#1222)
commit: 75b5b1174

## 0.7.0

add jmx option (#964)
commit: 6ae8d1945

## 0.6.4

update jenkins to latest LTS 2.46.3 (#1182)
commit: ad90b4c27

## 0.6.3

Update chart maints to gh u/n (#1107)
commit: f357b77ed

## 0.6.2

Add Agent.Privileged option (#957)
commit: 2cf4aced2

## 0.6.1

Upgrade jenkins to 2.46.2 (#971)
commit: 41bd742b4

## 0.6.0

Smoke test for Jenkins Chart (#944)
commit: 110441054

## 0.5.1

removed extra space from hardcoded password (#925)
commit: 85a9b9123

## 0.5.0

move config to init-container allowing use of upstream containers (#921)
commit: 1803c3d33

## 0.4.1

add ability to toggle jnlp-agent podTemplate generation (#918)
commit: accd53203

## 0.4.0

Jenkins add script approval (#916)
commit: c1746656e

## 0.3.1

Update Jenkins to Latest LTS fixes #731 (#733)
commit: e9a3aed8b

## 0.3.0

Added option to add Jenkins init scripts (#617)
commit: b889623d0

## 0.2.0

Add existing PVC (#716)
commit: 05271f145

## 0.1.15

use Master.ServicePort in config.xml (#769)
commit: f351f4b16

## 0.1.14

Added option to disable security on master node (#403)
commit: 3a6113d18

## 0.1.13

Added: extra mount points support for jenkins master (#474)
commit: fab0f7eb1

## 0.1.12

fix storageclass config typo (#548)
commit: 6fc0ff242

## 0.1.10

Changed default value of Kubernetes Cloud name to match one in kubernetes plugin (#404)
commit: 68351304a

Add support for overriding the Jenkins ConfigMap (#524)
commit: f97ca53b1

## 0.1.9

Added jenkins-master ingress support (#402)
commit: d76a09588

## 0.1.8

Change description (#553)
commit: 91f5c24e1

Removed default Persistence.StorageClass: generic (#530)
commit: c87494c10

Update to the recommended pvc patterns. (#448)
commit: a7fc595aa

Remove helm.sh/created annotations (#505)
commit: f380da2fb

## 0.1.7

add support for explicit NodePort on jenkins chart (#342)
commit: f63c188da

Add configurable loadBalancerSourceRanges for jenkins chart (#360)
commit: 44007c50e

Update Jenkins version to current LTS (2.19.4) and Kubernetes Plugin to 0.10 (#341)
commit: 6c8678167

## 0.1.6

Add imagePullPolicy to init container (#295)
commit: 103ee1952

## 0.1.5

bump chart version with PVC metadata label additions
commit: 4aa9cf5b1

## 0.1.4

removed `*` from `jenkins/templates/NOTES.txt`
commit: 76212230b

apply standard metadata labels to PVC's
commit: 58b730836

specify namespace in `kubectl get svc` commands in NOTES.txt
commit: 7d3287e81

Update Jenkins version to current LTS (#194)
commit: 2c0404049

## 0.1.1

escape fixed
commit: 2026e1d15

.status.loadBalancer.ingress[0].ip is empty in AWS
commit: 1810e37f4

.status.loadBalancer.ingress[0].ip is empty in AWS
commit: 3cbd3ced6

Remove 'Getting Started:' from various NOTES.txt. (#181)
commit: 2f63fd524

docs(\*): update readmes to reference chart repos (#119)
commit: c7d1bff05

## 0.1.0

Move first batch of PVC charts to stable
commit: d745f4879
