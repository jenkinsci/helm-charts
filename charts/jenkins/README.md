# Jenkins

[Jenkins](https://www.jenkins.io/) is the leading open source automation server, Jenkins provides hundreds of plugins to support building, deploying and automating any project.

This chart installs a Jenkins server which spawns agents on [Kubernetes](http://kubernetes.io) utilizing the [Jenkins Kubernetes plugin](https://plugins.jenkins.io/kubernetes/).

Inspired by the awesome work of [Carlos Sanchez](https://github.com/carlossg).

## Get Repo Info

```console
helm repo add jenkins https://charts.jenkins.io
helm repo update
```

_See [helm repo](https://helm.sh/docs/helm/helm_repo/) for command documentation._

## Install Chart

```console
# Helm 3
$ helm install [RELEASE_NAME] jenkins/jenkins [flags]

# Helm 2
$ helm install --name [RELEASE_NAME] jenkins/jenkins [flags]
```

_See [configuration](#configuration) below._

_See [helm install](https://helm.sh/docs/helm/helm_install/) for command documentation._

## Uninstall Chart

```console
# Helm 3
$ helm uninstall [RELEASE_NAME]

# Helm 2
# helm delete --purge [RELEASE_NAME]
```

This removes all the Kubernetes components associated with the chart and deletes the release.

_See [helm uninstall](https://helm.sh/docs/helm/helm_uninstall/) for command documentation._

## Upgrade Chart

```console
# Helm 3 or 2
$ helm upgrade [RELEASE_NAME] jenkins/jenkins [flags]
```

_See [helm upgrade](https://helm.sh/docs/helm/helm_upgrade/) for command documentation._

Visit the chart's [CHANGELOG](./CHANGELOG.md) to view the chart's release history.
For migration between major version check [migration guide](#migration-guide).

## Configuration

See [Customizing the Chart Before Installing](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing).
To see all configurable options with detailed comments, visit the chart's [values.yaml](./values.yaml), or run these configuration commands:

```console
# Helm 3
$ helm show values jenkins/jenkins

# Helm 2
$ helm inspect values jenkins/jenkins
```

For a summary of all configurable options, see [VALUES_SUMMARY.md](./VALUES_SUMMARY.md)

### Consider using a custom image

This chart allows the user to specify plugins, which should be installed however for production use cases one should consider to build a custom Jenkins image which has all required plugins pre-installed.
This way you can be sure which plugins Jenkins is using when starting up and you avoid trouble in case of connectivity issues to the Jenkins update site.

The [docker repository](https://github.com/jenkinsci/docker) for the Jenkins image contains [documentation](https://github.com/jenkinsci/docker#preinstalling-plugins) how to do it.

Here is an example how that can be done:

```Dockerfile
FROM jenkins/jenkins:lts
RUN jenkins-plugin-cli --plugins kubernetes workflow-aggregator git configuration-as-code
```

NOTE: If you want a reproducible build then you should specify a non floating tag for the image `jenkins/jenkins:2.249.3` and specify plugin versions.

Once you built the image and pushed it tou your registry you can specify it in your values file like this:

```yaml
master:
  image: "registry/my-jenkins"
  tag: "v1.2.3"
  installPlugins: []
```

Notice: `installPlugins` is set to an empty list to disable plugin download.

In case you are using a private registry you can use 'imagePullSecretName' to specify the name of the secret to use when pulling the image:

```yaml
master:
  image: "registry/my-jenkins"
  tag: "v1.2.3"
  imagePullSecretName: registry-secret
  installPlugins: []
```

### External URL Configuration

If you are using the ingress definitions provided by this chart via the `master.ingress` block the configured hostname will be the ingress hostname starting with `https://` or `http://` depending on the `tls` configuration.
The Protocol can be overwritten by specifying `master.jenkinsUrlProtocol`.

If you are not using the provided ingress you can specify `master.jenkinsUrl` to change the url definition.

### Configuration as Code

Jenkins Configuration as Code is now a standard component in the Jenkins project.
Add a key under configScripts for each configuration area, where each corresponds to a plugin or section of the UI.
The keys (prior to `|` character) are just labels, and can be any value.
They are only used to give the section a meaningful name.
The only restriction is they must conform to RFC 1123 definition of a DNS label, so they may only contain lowercase letters, numbers, and hyphens.
Each key will become the name of a configuration yaml file on the master in `/var/jenkins_home/casc_configs` (by default) and will be processed by the Configuration as Code Plugin during Jenkins startup.
The lines after each `|` become the content of the configuration yaml file.
The first line after this is a JCasC root element, e.g. jenkins, credentials, etc.
Best reference is the Documentation link here: `https://<jenkins_url>/configuration-as-code`.

The example below sets custom systemMessage:

```yaml
master:
  JCasC:
    configScripts:
      welcome-message: |
        jenkins:
          systemMessage: Welcome to our CI\CD server.
```

More complex example that creates ldap settings:

```yaml
master:
  JCasC:
    configScripts:
      ldap-settings: |
        jenkins:
          securityRealm:
            ldap:
              configurations:
                - server: ldap.acme.com
                  rootDN: dc=acme,dc=uk
                  managerPasswordSecret: ${LDAP_PASSWORD}
                  groupMembershipStrategy:
                    fromUserRecord:
                      attributeName: "memberOf"
```

Keep in mind that default configuration file already contains some values that you won't be able to override under configScripts section.

For example, you can not configure Jenkins URL and System Admin e-mail address like this because of conflicting configuration error.

Incorrect:

```yaml
master:
  JCasC:
    configScripts:
      jenkins-url: |
        unclassified:
          location:
            url: https://example.com/jenkins
            adminAddress: example@mail.com
```

Correct:

```yaml
master:
  jenkinsUrl: https://example.com/jenkins
  jenkinsAdminEmail: example@mail.com
```

Further JCasC examples can be found [here](https://github.com/jenkinsci/configuration-as-code-plugin/tree/master/demos).

#### Config as Code With or Without Auto-Reload

Config as Code changes (to `master.JCasC.configScripts`) can either force a new pod to be created and only be applied at next startup, or can be auto-reloaded on-the-fly.
If you set `master.sidecars.configAutoReload.enabled` to `true`, a second, auxiliary container will be installed into the Jenkins master pod, known as a "sidecar".
This watches for changes to configScripts, copies the content onto the Jenkins file-system and issues a POST to `http://<jenkins_url>/reload-configuration-as-code` with a pre-shared key.
You can monitor this sidecar's logs using command `kubectl logs <master_pod> -c jenkins-sc-config -f`.
If you want to enable auto-reload then you also need to configure rbac as the container which triggers the reload needs to watch the config maps:

```yaml
master:
  JCasC:
    enabled: true
  sidecars:
    configAutoReload:
      enabled: true
rbac:
  create: true
```

### Allow Limited HTML Markup in User-Submitted Text

Some third-party systems (e.g. GitHub) use HTML-formatted data in their payload sent to a Jenkins webhook (e.g. URL of a pull-request being built).
To display such data as processed HTML instead of raw text set `master.enableRawHtmlMarkupFormatter` to true.
This option requires installation of the [OWASP Markup Formatter Plugin (antisamy-markup-formatter)](https://plugins.jenkins.io/antisamy-markup-formatter/).
This plugin is **not** installed by default but may be added to `master.additionalPlugins`.

### Mounting Volumes into Agent Pods

Your Jenkins Agents will run as pods, and it's possible to inject volumes where needed:

```yaml
agent:
  volumes:
  - type: Secret
    secretName: jenkins-mysecrets
    mountPath: /var/run/secrets/jenkins-mysecrets
```

The supported volume types are: `ConfigMap`, `EmptyDir`, `HostPath`, `Nfs`, `PVC`, `Secret`.
Each type supports a different set of configurable attributes, defined by [the corresponding Java class](https://github.com/jenkinsci/kubernetes-plugin/tree/master/src/main/java/org/csanchez/jenkins/plugins/kubernetes/volumes).

### NetworkPolicy

To make use of the NetworkPolicy resources created by default, install [a networking plugin that implements the Kubernetes NetworkPolicy spec](https://kubernetes.io/docs/tasks/administer-cluster/declare-network-policy#before-you-begin).

[Install](#install-chart) helm chart with network policy enabled by setting `networkPolicy.enabled` to `true`.

You can use `master.networkPolicy.internalAgents` and `master.networkPolicy.externalAgents` stanzas for fine-grained controls over where internal/external agents can connect from.
Internal ones are allowed based on pod labels and (optionally) namespaces, and external ones are allowed based on IP ranges.

### Custom Security Realm

`master.securityRealm` in values can be used to support custom security realm instead of default `LegacySecurityRealm`.
For example, you can add a security realm to authenticate via keycloak:

```yaml
securityRealm: |-
  <securityRealm class="org.jenkinsci.plugins.oic.OicSecurityRealm" plugin="oic-auth@1.0">
    <clientId>testId</clientId>
    <clientSecret>testsecret</clientSecret>
    <tokenServerUrl>https:testurl</tokenServerUrl>
    <authorizationServerUrl>https:testAuthUrl</authorizationServerUrl>
    <userNameField>email</userNameField>
    <scopes>openid email</scopes>
  </securityRealm>
```

### Script approval list

`master.scriptApproval` allows to pass function signatures that will be allowed in pipelines.
Example:

```yaml
scriptApproval:
  - "method java.util.Base64$Decoder decode java.lang.String"
  - "new java.lang.String byte[]"
  - "staticMethod java.util.Base64 getDecoder"
```

### Additional Configs

`master.additionalConfig` can be used to add additional config files in `config.yaml`.
For example, it can be used to add additional config files for keycloak authentication:

```yaml
additionalConfig:
  testConfig.txt: |-
    - name: testName
      clientKey: testKey
      clientURL: testUrl
```

### Custom Labels

`master.serviceLabels` can be used to add custom labels in `jenkins-master-svc.yaml`.
For example:

```yaml
ServiceLabels:
  expose: true
```

### Persistence

The Jenkins image stores persistence under `/var/jenkins_home` path of the container.
A dynamically managed Persistent Volume Claim is used to keep the data across deployments, by default.
This is known to work in GCE, AWS, and minikube. Alternatively, a previously configured Persistent Volume Claim can be used.

It is possible to mount several volumes using `persistence.volumes` and `persistence.mounts` parameters.
See additional `persistence` values using [configuration commands](#configuration).

#### Existing PersistentVolumeClaim

1. Create the PersistentVolume
1. Create the PersistentVolumeClaim
1. [Install](#install-chart) the chart, setting `persistence.existingClaim` to `PVC_NAME`

#### Storage Class

It is possible to define which storage class to use, by setting `persistence.storageClass` to `[customStorageClass]`.
If set to a dash (`-`), dynamic provisioning is disabled.
If the storage class is set to null or left undefined (`""`), the default provisioner is used (gp2 on AWS, standard on GKE, AWS & OpenStack).

### RBAC

RBAC is enabled by default. If you want to disable it you will need to set `rbac.create` to `false`.

### Backup

Adds a backup CronJob for jenkins, along with required RBAC resources. See additional `backup` values using [configuration commands](#configuration).

### Restore From Backup

To restore a backup, you can use the `kube-tasks` underlying tool called [skbn](https://github.com/maorfr/skbn), which copies files from cloud storage to Kubernetes.
The best way to do it would be using a `Job` to copy files from the desired backup tag to the Jenkins pod.
See the [skbn in-cluster example](https://github.com/maorfr/skbn/tree/master/examples/in-cluster) for more details.

### Providing Jobs XML

Jobs can be created (and overwritten) by providing jenkins config xml within the `values.yaml` file.
The keys of the map will become a directory within the jobs directory.
The values of the map will become the `config.xml` file in the respective directory.

Below is an example of a `values.yaml` file and the directory structure created:

```yaml
master:
  jobs:
    test-job: |-
      <?xml version='1.0' encoding='UTF-8'?>
      <project>
        <keepDependencies>false</keepDependencies>
        <properties/>
        <scm class="hudson.scm.NullSCM"/>
        <canRoam>false</canRoam>
        <disabled>false</disabled>
        <blockBuildWhenDownstreamBuilding>false</blockBuildWhenDownstreamBuilding>
        <blockBuildWhenUpstreamBuilding>false</blockBuildWhenUpstreamBuilding>
        <triggers/>
        <concurrentBuild>false</concurrentBuild>
        <builders/>
        <publishers/>
        <buildWrappers/>
      </project>
    test-job-2: |-
      <?xml version='1.0' encoding='UTF-8'?>
      <project>
        <keepDependencies>false</keepDependencies>
        <properties/>
        <scm class="hudson.scm.NullSCM"/>
        <canRoam>false</canRoam>
        <disabled>false</disabled>
        <blockBuildWhenDownstreamBuilding>false</blockBuildWhenDownstreamBuilding>
        <blockBuildWhenUpstreamBuilding>false</blockBuildWhenUpstreamBuilding>
        <triggers/>
        <concurrentBuild>false</concurrentBuild>
        <builders/>
        <publishers/>
        <buildWrappers/>
```

#### Jobs Directory Structure

```console
.
├── _test-job-1
|   └── config.xml
├── _test-job-2
|   └── config.xml
```

Docs taken from <https://github.com/jenkinsci/docker/blob/master/Dockerfile>:
_Jenkins is run with user `jenkins`, uid = 1000. If you bind mount a volume from the host or a data container,ensure you use the same uid_

### Adding Custom Pod Templates

It is possible to add custom pod templates for the default configured kubernetes cloud.
Add a key under `agent.podTemplates` for each pod template. Each key (prior to `|` character) is just a label, and can be any value.
Keys are only used to give the pod template a meaningful name.  The only restriction is they may only contain RFC 1123 \ DNS label characters: lowercase letters, numbers, and hyphens. Each pod template can contain multiple containers.
There's no need to add the *jnlp* container since the kubernetes plugin will automatically inject it into the pod.
For this pod templates configuration to be loaded the following values must be set:

```yaml
master.JCasC.enabled: true
master.JCasC.defaultConfig: true
```

The example below creates a python pod template in the kubernetes cloud:

```yaml
agent:
  podTemplates:
    python: |
      - name: python
        label: jenkins-python
        serviceAccount: jenkins
        containers:
          - name: python
            image: python:3
            command: "/bin/sh -c"
            args: "cat"
            ttyEnabled: true
            privileged: true
            resourceRequestCpu: "400m"
            resourceRequestMemory: "512Mi"
            resourceLimitCpu: "1"
            resourceLimitMemory: "1024Mi"
```

Best reference is `https://<jenkins_url>/configuration-as-code/reference#Cloud-kubernetes`.

### Adding Pod Templates Using additionalAgents

`additionalAgents` may be used to configure additional kubernetes pod templates.
Each additional agent corresponds to `agent` in terms of the configurable values and inherits all values from `agent` so you only need to specify values which differ.
For example:

```yaml
agent:
  podName: default
  customJenkinsLabels: default
  # set resources for additional agents to inherit
  resources:
    limits:
      cpu: "1"
      memory: "2048Mi"

additionalAgents:
  maven:
    podName: maven
    customJenkinsLabels: maven
    # An example of overriding the jnlp container
    # sideContainerName: jnlp
    image: jenkins/jnlp-agent-maven
    tag: latest
  python:
    podName: python
    customJenkinsLabels: python
    sideContainerName: python
    image: python
    tag: "3"
    command: "/bin/sh -c"
    args: "cat"
    TTYEnabled: true
```

### Running Behind a Forward Proxy

The master pod uses an Init Container to install plugins etc. If you are behind a corporate proxy it may be useful to set `master.initContainerEnv` to add environment variables such as `http_proxy`, so that these can be downloaded.

Additionally, you may want to add env vars for the init container, the Jenkins container, and the JVM (`master.javaOpts`):

```yaml
master:
  initContainerEnv:
    - name: http_proxy
      value: "http://192.168.64.1:3128"
    - name: https_proxy
      value: "http://192.168.64.1:3128"
    - name: no_proxy
      value: ""
  containerEnv:
    - name: http_proxy
      value: "http://192.168.64.1:3128"
    - name: https_proxy
      value: "http://192.168.64.1:3128"
  javaOpts: >-
    -Dhttp.proxyHost=192.168.64.1
    -Dhttp.proxyPort=3128
    -Dhttps.proxyHost=192.168.64.1
    -Dhttps.proxyPort=3128
```

### Custom ConfigMap

The following configuration method is deprecated and will be removed in an upcoming version of this chart.
We recommend you use Jenkins Configuration as Code to configure instead.
When creating a new parent chart with this chart as a dependency, the `customConfigMap` parameter can be used to override the default `config.xml` provided.
It also allows for providing additional xml configuration files that will be copied into `/var/jenkins_home`. In the parent chart's values.yaml, set the `jenkins.master.customConfigMap` value to `true` like so:

```yaml
jenkins:
  master:
    customConfigMap: true
```

and provide the file `templates/config.tpl` in your parent chart for your use case.
You can start by copying the contents of `config.yaml` from this chart into your parent charts `templates/config.tpl` as a basis for customization.
Finally, you'll need to wrap the contents of `templates/config.tpl` like so:

```yaml
{{- define "override_config_map" }}
    <CONTENTS_HERE>
{{ end }}
```

### HTTPS Keystore Configuration

[This configuration](https://wiki.jenkins.io/pages/viewpage.action?pageId=135468777) enables jenkins to use keystore in order to serve https.
Here is the [value file section](https://wiki.jenkins.io/pages/viewpage.action?pageId=135468777#RunningJenkinswithnativeSSL/HTTPS-ConfigureJenkinstouseHTTPSandtheJKSkeystore) related to keystore configuration.
Keystore itself should be placed in front of `jenkinsKeyStoreBase64Encoded` key and in base64 encoded format. To achieve that after having `keystore.jks` file simply do this: `cat keystore.jks | base64` and paste the output in front of `jenkinsKeyStoreBase64Encoded`.
After enabling `httpsKeyStore.enable` make sure that `httpPort` and `targetPort` are not the same, as `targetPort` will serve https.
Do not set `master.httpsKeyStore.httpPort` to `-1` because it will cause readiness and liveliness prob to fail.
If you already have a kubernetes secret that has keystore and its password you can specify its' name in front of `jenkinsHttpsJksSecretName`, You need to remember that your secret should have proper data key names `jenkins-jks-file` and `https-jks-password`. Example:

```yaml
master:
   httpsKeyStore:
       enable: true
       jenkinsHttpsJksSecretName: ''
       httpPort: 8081
       path: "/var/jenkins_keystore"
       fileName: "keystore.jks"
       password: "changeit"
       jenkinsKeyStoreBase64Encoded: ''
```


### Ingress Configuration
This chart provides ingress resources configurable via the `master.ingress` block.

The simplest configuration looks like the following:
```yaml
master:
   ingress:
       enabled: true
       paths: []
       apiVersion: "extensions/v1beta1"
       hostName: jenkins.example.com
```
This snippet configures an ingress rule for exposing jenkins at `jenkins.example.com`

You can define labels and annotations via `master.ingress.labels` and `master.ingress.annotations` respectively.
Additionally, you can configure the ingress tls via `master.ingress.tls`.
By default, this ingress rule exposes all paths.
If needed this can be overwritten by specifying the wanted paths in `master.ingress.paths`

If you want to configure a secondary ingress e.g. you don't want the jenkins instance exposed but still want to receive webhooks you can configure `master.secondaryingress`.
The secondaryingress doesn't expose anything by default and has to be configured via `master.secondaryingress.paths`:

```yaml
master:
   ingress:
       enabled: true
       apiVersion: "extensions/v1beta1"
       hostName: "jenkins.internal.example.com"
       annotations:
           kubernetes.io/ingress.class: "internal"
   secondaryingress:
       enabled: true
       apiVersion: "extensions/v1beta1"
       hostName: "jenkins-scm.example.com"
       annotations:
           kubernetes.io/ingress.class: "public"
       paths:
        - /github-webhook
```

## Migration Guide

### From stable repo

Upgrade an existing release from `stable/jenkins` to `jenkins/jenkins` seamlessly by ensuring you have the latest [repo info](#get-repo-info) and running the [upgrade commands](#upgrade-chart) specifying the `jenkins/jenkins` chart.

### Major Version Upgrades

Chart release versions follow [semver](../../CONTRIBUTING.md#versioning), where a MAJOR version change (example `1.0.0` -> `2.0.0`) indicates an incompatible breaking change needing manual actions.

### To 2.0.0

Configuration as Code is now default + container does not run as root anymore.

#### Configuration as Code new default

Configuration is done via [Jenkins Configuration as Code Plugin](https://github.com/jenkinsci/configuration-as-code-plugin) by default.
That means that changes in values which result in a configuration change are always applied.
In contrast the XML configuration was only applied during the first start and never altered.

:exclamation::exclamation::exclamation:
Attention:
This also means if you manually altered configuration then this will most likely be reset to what was configured by default.
It also applies to `securityRealm` and `authorizationStrategy` as they are also configured using configuration as code.
:exclamation::exclamation::exclamation:

#### Image does not run as root anymore

It's not recommended to run containers in Kubernetes as `root`.

:exclamation: Attention: If you had not configured a different user before then you need to ensure that your image supports the user and group id configured and also manually change permissions of all files so that Jenkins is still able to use them.

#### Summary of updated values

As version 2.0.0 only updates default values and nothing else it's still possible to migrate to this version and opt out of some or all new defaults.
All you have to do is ensure the old values are set in your installation.

Here we show which values have changed and the previous default values:

```yaml
master:
  enableXmlConfig: false  # was true
  runAsUser: 1000         # was unset before
  fsGroup: 1000           # was unset before
  JCasC:
    enabled: true         # was false
    defaultConfig: true   # was false
  sidecars:
    configAutoReload:
      enabled: true       # was false
```

#### Migration steps

Migration instructions heavily depend on your current setup.
So think of the list below more as a general guideline of what should be done.

- Ensure that the Jenkins image you are using contains a user with id 1000 and a group with the same id.
  That's the case for `jenkins/jenkins:lts` image, which the chart uses by default
- Make a backup of your existing installation especially the persistent volume
- Ensure that you have the configuration as code plugin installed
- Export your current settings via the plugin:
  `Manage Jenkins` -> `Configuration as Code` -> `Download Configuration`
- prepare your values file for the update e.g. add additional configuration as code setting that you need.
  The export taken from above might be a good starting point for this.
  In addition the [demos](https://github.com/jenkinsci/configuration-as-code-plugin/tree/master/demos) from the plugin itself are quite useful.
- Test drive those setting on a separate installation
- Put Jenkins to Quiet Down mode so that it does not accept new jobs
  `<JENKINS_URL>/quietDown`
- Change permissions of all files and folders to the new user and group id:

  ```console
  kubectl exec -it <jenkins_pod> -c jenkins /bin/bash
  chown -R 1000:1000 /var/jenkins_home
  ```

- Update Jenkins

### To 1.0.0

Breaking changes:

- Values have been renamed to follow [helm recommended naming conventions](https://helm.sh/docs/chart_best_practices/#naming-conventions) so that all variables start with a lowercase letter and words are separated with camelcase
- All resources are now using [helm recommended standard labels](https://helm.sh/docs/chart_best_practices/#standard-labels)

As a result of the label changes also the selectors of the deployment have been updated.
Those are immutable so trying an updated will cause an error like:

```console
Error: Deployment.apps "jenkins" is invalid: spec.selector: Invalid value: v1.LabelSelector{MatchLabels:map[string]string{"app.kubernetes.io/component":"jenkins-master", "app.kubernetes.io/instance":"jenkins"}, MatchExpressions:[]v1.LabelSelectorRequirement(nil)}: field is immutable
```

In order to upgrade, [uninstall](#uninstall-chart) the Jenkins Deployment before upgrading:
