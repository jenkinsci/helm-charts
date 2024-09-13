# Jenkins

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/jenkins)](https://artifacthub.io/packages/helm/jenkinsci/jenkins)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Releases downloads](https://img.shields.io/github/downloads/jenkinsci/helm-charts/total.svg)](https://github.com/jenkinsci/helm-charts/releases)
[![Join the chat at https://app.gitter.im/#/room/#jenkins-ci:matrix.org](https://badges.gitter.im/badge.svg)](https://app.gitter.im/#/room/#jenkins-ci:matrix.org)

[Jenkins](https://www.jenkins.io/) is the leading open source automation server, Jenkins provides over 1800 plugins to support building, deploying and automating any project.

This chart installs a Jenkins server which spawns agents on [Kubernetes](http://kubernetes.io) utilizing the [Jenkins Kubernetes plugin](https://plugins.jenkins.io/kubernetes/).

Inspired by the awesome work of [Carlos Sanchez](https://github.com/carlossg).

## Get Repository Info

```console
helm repo add jenkins https://charts.jenkins.io
helm repo update
```

_See [`helm repo`](https://helm.sh/docs/helm/helm_repo/) for command documentation._

## Install Chart

```console
helm install [RELEASE_NAME] jenkins/jenkins [flags]
```

Since version `5.6.0` the chart is available as an OCI image and can be installed using:

```console
helm install [RELEASE_NAME] oci://ghcr.io/jenkinsci/helm-charts/jenkins [flags]
```

_See [configuration](#configuration) below._

_See [helm install](https://helm.sh/docs/helm/helm_install/) for command documentation._

## Uninstall Chart

```console
# Helm 3
$ helm uninstall [RELEASE_NAME]
```

This removes all the Kubernetes components associated with the chart and deletes the release.

_See [helm uninstall](https://helm.sh/docs/helm/helm_uninstall/) for command documentation._

## Upgrade Chart

```console
# Helm 3
$ helm upgrade [RELEASE_NAME] jenkins/jenkins [flags]
```

_See [helm upgrade](https://helm.sh/docs/helm/helm_upgrade/) for command documentation._

Visit the chart's [CHANGELOG](https://github.com/jenkinsci/helm-charts/blob/main/charts/jenkins/CHANGELOG.md) to view the chart's release history.
For migration between major version check [migration guide](#migration-guide).

## Building weekly releases

The default charts target Long-Term-Support (LTS) releases of Jenkins.
To use other versions the easiest way is to update the image tag to the version you want.
You can also rebuild the chart if you want the `appVersion` field to match.

## Configuration

See [Customizing the Chart Before Installing](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing).
To see all configurable options with detailed comments, visit the chart's [values.yaml](https://github.com/jenkinsci/helm-charts/blob/main/charts/jenkins/values.yaml), or run these configuration commands:

```console
# Helm 3
$ helm show values jenkins/jenkins
```

For a summary of all configurable options, see [VALUES_SUMMARY.md](https://github.com/jenkinsci/helm-charts/blob/main/charts/jenkins/VALUES_SUMMARY.md).

### Configure Security Realm and Authorization Strategy

This chart configured a `securityRealm` and `authorizationStrategy` as shown below:

```yaml
controller:
  JCasC:
    securityRealm: |-
      local:
        allowsSignup: false
        enableCaptcha: false
        users:
        - id: "${chart-admin-username}"
          name: "Jenkins Admin"
          password: "${chart-admin-password}"
    authorizationStrategy: |-
      loggedInUsersCanDoAnything:
        allowAnonymousRead: false
```

With the configuration above there is only a single user.
This is fine for getting started quickly, but it needs to be adjusted for any serious environment.

So you should adjust this to suite your needs.
That could be using LDAP / OIDC / .. as authorization strategy and use globalMatrix as authorization strategy to configure more fine-grained permissions.

### Consider using a custom image

This chart allows the user to specify plugins which should be installed. However, for production use cases one should consider to build a custom Jenkins image which has all required plugins pre-installed.
This way you can be sure which plugins Jenkins is using when starting up and you avoid trouble in case of connectivity issues to the Jenkins update site.

The [docker repository](https://github.com/jenkinsci/docker) for the Jenkins image contains [documentation](https://github.com/jenkinsci/docker#preinstalling-plugins) how to do it.

Here is an example how that can be done:

```Dockerfile
FROM jenkins/jenkins:lts
RUN jenkins-plugin-cli --plugins kubernetes workflow-aggregator git configuration-as-code
```

NOTE: If you want a reproducible build then you should specify a non-floating tag for the image `jenkins/jenkins:2.249.3` and specify plugin versions.

Once you built the image and pushed it to your registry you can specify it in your values file like this:

```yaml
controller:
  image: "registry/my-jenkins"
  tag: "v1.2.3"
  installPlugins: false
```

Notice: `installPlugins` is set to false to disable plugin download. In this case, the image `registry/my-jenkins:v1.2.3` must have the plugins specified as default value for [the `controller.installPlugins` directive](https://github.com/jenkinsci/helm-charts/blob/main/charts/jenkins/VALUES_SUMMARY.md#jenkins-plugins) to ensure that the configuration side-car system works as expected.

In case you are using a private registry you can use 'imagePullSecretName' to specify the name of the secret to use when pulling the image:

```yaml
controller:
  image: "registry/my-jenkins"
  tag: "v1.2.3"
  imagePullSecretName: registry-secret
  installPlugins: false
```

### External URL Configuration

If you are using the ingress definitions provided by this chart via the `controller.ingress` block the configured hostname will be the ingress hostname starting with `https://` or `http://` depending on the `tls` configuration.
The Protocol can be overwritten by specifying `controller.jenkinsUrlProtocol`.

If you are not using the provided ingress you can specify `controller.jenkinsUrl` to change the URL definition.

### Configuration as Code

Jenkins Configuration as Code (JCasC) is now a standard component in the Jenkins project.
To allow JCasC's configuration from the helm values, the plugin [`configuration-as-code`](https://plugins.jenkins.io/configuration-as-code/) must be installed in the Jenkins Controller's Docker image (which is the case by default as specified by the [default value of the directive `controller.installPlugins`](https://github.com/jenkinsci/helm-charts/blob/main/charts/jenkins/VALUES_SUMMARY.md#jenkins-plugins)).

JCasc configuration is passed through Helm values under the key `controller.JCasC`.
The section ["Jenkins Configuration as Code (JCasC)" of the page "VALUES_SUMMARY.md"](https://github.com/jenkinsci/helm-charts/blob/main/charts/jenkins/VALUES_SUMMARY.md#jenkins-configuration-as-code-jcasc) lists all the possible directives.

In particular, you may specify custom JCasC scripts by adding sub-key under the `controller.JCasC.configScripts` for each configuration area where each corresponds to a plugin or section of the UI.

The sub-keys (prior to `|` character) are only labels used to give the section a meaningful name.
The only restriction is they must conform to RFC 1123 definition of a DNS label, so they may only contain lowercase letters, numbers, and hyphens.

Each key will become the name of a configuration yaml file on the controller in `/var/jenkins_home/casc_configs` (by default) and will be processed by the Configuration as Code Plugin during Jenkins startup.

The lines after each `|` become the content of the configuration yaml file.

The first line after this is a JCasC root element, e.g. jenkins, credentials, etc.

Best reference is the Documentation link here: `https://<jenkins_url>/configuration-as-code`.

The example below sets custom systemMessage:

```yaml
controller:
  JCasC:
    configScripts:
      welcome-message: |
        jenkins:
          systemMessage: Welcome to our CI\CD server.
```

More complex example that creates ldap settings:

```yaml
controller:
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

For example, you can not configure Jenkins URL and System Admin email address like this because of conflicting configuration error.

Incorrect:

```yaml
controller:
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
controller:
  jenkinsUrl: https://example.com/jenkins
  jenkinsAdminEmail: example@mail.com
```

Further JCasC examples can be found [here](https://github.com/jenkinsci/configuration-as-code-plugin/tree/master/demos).

#### Breaking out large Config as Code scripts

Jenkins Config as Code scripts can become quite large, and maintaining all of your scripts within one yaml file can be difficult.  The Config as Code plugin itself suggests updating the `CASC_JENKINS_CONFIG` environment variable to be a comma separated list of paths for the plugin to traverse, picking up the yaml files as needed.  
However, under the Jenkins helm chart, this `CASC_JENKINS_CONFIG` value is maintained through the templates.  A better solution is to split your `controller.JCasC.configScripts` into separate values files, and provide each file during the helm install.

For example, you can have a values file (e.g values_main.yaml) that defines the values described in the `VALUES_SUMMARY.md` for your Jenkins configuration:

```yaml
jenkins:
  controller:
    jenkinsUrlProtocol: https
    installPlugins: false
    ...
```

In a second file (e.g values_jenkins_casc.yaml), you can define a section of your config scripts:

```yaml
jenkins:
  controller:
    JCasC:
      configScripts:
        jenkinsCasc:  |
          jenkins:
            disableRememberMe: false
            mode: NORMAL
            ...
```

And keep extending your config scripts by creating more files (so not all config scripts are located in one yaml file for better maintenance):

values_jenkins_unclassified.yaml

```yaml
jenkins:
  controller:
    JCasC:
      configScripts:
        unclassifiedCasc: |
          unclassified:
            ...
```

When installing, you provide all relevant yaml files (e.g `helm install -f values_main.yaml -f values_jenkins_casc.yaml -f values_jenkins_unclassified.yaml ...`).  Instead of updating the `CASC_JENKINS_CONFIG` environment variable to include multiple paths, multiple CasC yaml files will be created in the same path `var/jenkins_home/casc_configs`.

#### Config as Code With or Without Auto-Reload

Config as Code changes (to `controller.JCasC.configScripts`) can either force a new pod to be created and only be applied at next startup, or can be auto-reloaded on-the-fly.
If you set `controller.sidecars.configAutoReload.enabled` to `true`, a second, auxiliary container will be installed into the Jenkins controller pod, known as a "sidecar".
This watches for changes to configScripts, copies the content onto the Jenkins file-system and issues a POST to `http://<jenkins_url>/reload-configuration-as-code` with a pre-shared key.
You can monitor this sidecar's logs using command `kubectl logs <controller_pod> -c config-reload -f`.
If you want to enable auto-reload then you also need to configure rbac as the container which triggers the reload needs to watch the config maps:

```yaml
controller:
  sidecars:
    configAutoReload:
      enabled: true
rbac:
  create: true
```

### Allow Limited HTML Markup in User-Submitted Text

Some third-party systems (e.g. GitHub) use HTML-formatted data in their payload sent to a Jenkins webhook (e.g. URL of a pull-request being built).
To display such data as processed HTML instead of raw text set `controller.enableRawHtmlMarkupFormatter` to true.
This option requires installation of the [OWASP Markup Formatter Plugin (antisamy-markup-formatter)](https://plugins.jenkins.io/antisamy-markup-formatter/).
This plugin is **not** installed by default but may be added to `controller.additionalPlugins`.

### Change max connections to Kubernetes API
When using agents with containers other than JNLP, The kubernetes plugin will communicate with those containers using the Kubernetes API. this changes the maximum concurrent connections
```yaml
agent:
  maxRequestsPerHostStr: "32"
```
This will change the configuration of the kubernetes "cloud" (as called by jenkins) that is created automatically as part of this helm chart.

### Change container cleanup timeout API
For tasks that use very large images, this timeout can be increased to avoid early termination of the task while the Kubernetes pod is still deploying.
```yaml
agent:
  retentionTimeout: "32"
```
This will change the configuration of the kubernetes "cloud" (as called by jenkins) that is created automatically as part of this helm chart.

### Change seconds to wait for pod to be running
This will change how long Jenkins will wait (seconds) for pod to be in running state.
```yaml
agent:
  waitForPodSec: "32"
```
This will change the configuration of the kubernetes "cloud" (as called by jenkins) that is created automatically as part of this helm chart.

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

You can use `controller.networkPolicy.internalAgents` and `controller.networkPolicy.externalAgents` stanzas for fine-grained controls over where internal/external agents can connect from.
Internal ones are allowed based on pod labels and (optionally) namespaces, and external ones are allowed based on IP ranges.

### Script approval list

`controller.scriptApproval` allows to pass function signatures that will be allowed in pipelines.
Example:

```yaml
controller:
  scriptApproval:
    - "method java.util.Base64$Decoder decode java.lang.String"
    - "new java.lang.String byte[]"
    - "staticMethod java.util.Base64 getDecoder"
```

### Custom Labels

`controller.serviceLabels` can be used to add custom labels in `jenkins-controller-svc.yaml`.
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
2. Create the PersistentVolumeClaim
3. [Install](#install-chart) the chart, setting `persistence.existingClaim` to `PVC_NAME`

#### Long Volume Attach/Mount Times

Certain volume type and filesystem format combinations may experience long
attach/mount times, [10 or more minutes][K8S_VOLUME_TIMEOUT], when using
`fsGroup`.  This issue may result in the following entries in the pod's event
history:

```console
Warning  FailedMount  38m                kubelet, aks-default-41587790-2 Unable to attach or mount volumes: unmounted volumes=[jenkins-home], unattached volumes=[plugins plugin-dir jenkins-token-rmq2g sc-config-volume tmp jenkins-home jenkins-config secrets-dir]: timed out waiting for the condition
```

In these cases, experiment with replacing `fsGroup` with
`supplementalGroups` in the pod's `securityContext`.  This can be achieved by
setting the `controller.podSecurityContextOverride` Helm chart value to
something like:

```yaml
controller:
  podSecurityContextOverride:
    runAsNonRoot: true
    runAsUser: 1000
    supplementalGroups: [1000]
```

This issue has been reported on [azureDisk with ext4][K8S_VOLUME_TIMEOUT] and
on [Alibaba cloud][K8S_VOLUME_TIMEOUT_ALIBABA].

[K8S_VOLUME_TIMEOUT]: https://github.com/kubernetes/kubernetes/issues/67014
[K8S_VOLUME_TIMEOUT_ALIBABA]: https://github.com/kubernetes/kubernetes/issues/67014#issuecomment-698770511

#### Storage Class

It is possible to define which storage class to use, by setting `persistence.storageClass` to `[customStorageClass]`.
If set to a dash (`-`), dynamic provisioning is disabled.
If the storage class is set to null or left undefined (`""`), the default provisioner is used (gp2 on AWS, standard on GKE, AWS & OpenStack).

### Additional Secrets

Additional secrets and Additional Existing Secrets,
can be mounted into the Jenkins controller through the chart or created using `controller.additionalSecrets` or `controller.additionalExistingSecrets`.  
A common use case might be identity provider credentials if using an external LDAP or OIDC-based identity provider.
The secret may then be referenced in JCasC configuration (see [JCasC configuration](#configuration-as-code)).

`values.yaml` controller section, referencing mounted secrets:
```yaml
controller:
  # the 'name' and 'keyName' are concatenated with a '-' in between, so for example:
  # an existing secret "secret-credentials" and a key inside it named "github-password" should be used in Jcasc as ${secret-credentials-github-password}
  # 'name' and 'keyName' must be lowercase RFC 1123 label must consist of lower case alphanumeric characters or '-',
  # and must start and end with an alphanumeric character (e.g. 'my-name', or '123-abc')
  # existingSecret existing secret "secret-credentials" and a key inside it named "github-username" should be used in Jcasc as ${github-username}
  # When using existingSecret no need to specify the keyName under additionalExistingSecrets.
  existingSecret: secret-credentials
  
  additionalExistingSecrets:
    - name: secret-credentials
      keyName: github-username
    - name: secret-credentials
      keyName: github-password
    - name: secret-credentials
      keyName: token
  
  additionalSecrets:
    - name: client_id
      value: abc123
    - name: client_secret
      value: xyz999
  JCasC:
    securityRealm: |
      oic:
        clientId: ${client_id}
        clientSecret: ${client_secret}
        ...
    configScripts:
      jenkins-casc-configs: |
        credentials:
          system:
            domainCredentials:
            - credentials:
              - string:
                  description: "github access token"
                  id: "github_app_token"
                  scope: GLOBAL
                  secret: ${secret-credentials-token}
              - usernamePassword:
                  description: "github access username password"
                  id: "github_username_pass"
                  password: ${secret-credentials-github-password}
                  scope: GLOBAL
                  username: ${secret-credentials-github-username}
```

For more information, see [JCasC documentation](https://github.com/jenkinsci/configuration-as-code-plugin/blob/master/docs/features/secrets.adoc#kubernetes-secrets).

### Secret Claims from HashiCorp Vault

It's possible for this chart to generate `SecretClaim` resources in order to automatically create and maintain Kubernetes `Secrets` from HashiCorp [Vault](https://www.vaultproject.io/) via [`kube-vault-controller`](https://github.com/roboll/kube-vault-controller)

These `Secrets` can then be referenced in the same manner as Additional Secrets above.

This can be achieved by defining required Secret Claims within `controller.secretClaims`, as follows:
```yaml
controller:
  secretClaims:
    - name: jenkins-secret
      path: secret/path
    - name: jenkins-short-ttl
      path: secret/short-ttl-path
      renew: 60
```

### RBAC

RBAC is enabled by default. If you want to disable it you will need to set `rbac.create` to `false`.

### Adding Custom Pod Templates

It is possible to add custom pod templates for the default configured kubernetes cloud.
Add a key under `agent.podTemplates` for each pod template. Each key (prior to `|` character) is just a label, and can be any value.
Keys are only used to give the pod template a meaningful name. The only restriction is they may only contain RFC 1123 \ DNS label characters: lowercase letters, numbers, and hyphens. Each pod template can contain multiple containers.
There's no need to add the _jnlp_ container since the kubernetes plugin will automatically inject it into the pod.
For this pod templates configuration to be loaded the following values must be set:

```yaml
controller.JCasC.defaultConfig: true
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

### Ingress Configuration

This chart provides ingress resources configurable via the `controller.ingress` block.

The simplest configuration looks like the following:

```yaml
controller:
   ingress:
       enabled: true
       paths: []
       apiVersion: "extensions/v1beta1"
       hostName: jenkins.example.com
```

This snippet configures an ingress rule for exposing jenkins at `jenkins.example.com`

You can define labels and annotations via `controller.ingress.labels` and `controller.ingress.annotations` respectively.
Additionally, you can configure the ingress tls via `controller.ingress.tls`.
By default, this ingress rule exposes all paths.
If needed this can be overwritten by specifying the wanted paths in `controller.ingress.paths`

If you want to configure a secondary ingress e.g. you don't want the jenkins instance exposed but still want to receive webhooks you can configure `controller.secondaryingress`.
The secondaryingress doesn't expose anything by default and has to be configured via `controller.secondaryingress.paths`:

```yaml
controller:
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

## Prometheus Metrics

If you want to expose Prometheus metrics you need to install the [Jenkins Prometheus Metrics Plugin](https://github.com/jenkinsci/prometheus-plugin).
It will expose an endpoint (default `/prometheus`) with metrics where a Prometheus Server can scrape.

If you have implemented [Prometheus Operator](https://github.com/prometheus-operator/prometheus-operator), you can set `controller.prometheus.enabled` to `true` to configure a `ServiceMonitor` and `PrometheusRule`.
If you want to further adjust alerting rules you can do so by configuring `controller.prometheus.alertingrules`

If you have implemented Prometheus without using the operator, you can leave `controller.prometheus.enabled` set to `false`.

### Running Behind a Forward Proxy

The controller pod uses an Init Container to install plugins etc. If you are behind a corporate proxy it may be useful to set `controller.initContainerEnv` to add environment variables such as `http_proxy`, so that these can be downloaded.

Additionally, you may want to add env vars for the init container, the Jenkins container, and the JVM (`controller.javaOpts`):

```yaml
controller:
  initContainerEnv:
    - name: http_proxy
      value: "http://192.168.64.1:3128"
    - name: https_proxy
      value: "http://192.168.64.1:3128"
    - name: no_proxy
      value: ""
    - name: JAVA_OPTS
      value: "-Dhttps.proxyHost=proxy_host_name_without_protocol -Dhttps.proxyPort=3128"
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

### HTTPS Keystore Configuration

[This configuration](https://wiki.jenkins.io/pages/viewpage.action?pageId=135468777) enables jenkins to use keystore in order to serve HTTPS.
Here is the [value file section](https://wiki.jenkins.io/pages/viewpage.action?pageId=135468777#RunningJenkinswithnativeSSL/HTTPS-ConfigureJenkinstouseHTTPSandtheJKSkeystore) related to keystore configuration.
Keystore itself should be placed in front of `jenkinsKeyStoreBase64Encoded` key and in base64 encoded format. To achieve that after having `keystore.jks` file simply do this: `cat keystore.jks | base64` and paste the output in front of `jenkinsKeyStoreBase64Encoded`.
After enabling `httpsKeyStore.enable` make sure that `httpPort` and `targetPort` are not the same, as `targetPort` will serve HTTPS.
Do not set `controller.httpsKeyStore.httpPort` to `-1` because it will cause readiness and liveliness prob to fail.
If you already have a kubernetes secret that has keystore and its password you can specify its' name in front of `jenkinsHttpsJksSecretName`, You need to remember that your secret should have proper data key names `jenkins-jks-file` (or override the key name using `jenkinsHttpsJksSecretKey`)
and `https-jks-password` (or override the key name using `jenkinsHttpsJksPasswordSecretKey`; additionally you can make it get the password from a different secret using `jenkinsHttpsJksPasswordSecretName`). Example:

```yaml
controller:
   httpsKeyStore:
       enable: true
       jenkinsHttpsJksSecretName: ''
       httpPort: 8081
       path: "/var/jenkins_keystore"
       fileName: "keystore.jks"
       password: "changeit"
       jenkinsKeyStoreBase64Encoded: ''
```
### AWS Security Group Policies

To create SecurityGroupPolicies set `awsSecurityGroupPolicies.enabled` to true and add your policies. Each policy requires a `name`, array of `securityGroupIds` and a `podSelector`. Example:

```yaml
awsSecurityGroupPolicies:
  enabled: true
  policies:
    - name: "jenkins-controller"
      securityGroupIds: 
        - sg-123456789
      podSelector:
        matchExpressions:
          - key: app.kubernetes.io/component
            operator: In
            values:
              - jenkins-controller
```

### Agent Direct Connection

Set `directConnection` to `true` to allow agents to connect directly to a given TCP port without having to negotiate a HTTP(S) connection. This can allow you to have agent connections without an external HTTP(S) port. Example:

```yaml
agent:
  jenkinsTunnel: "jenkinsci-agent:50000"
  directConnection: true
```

## Migration Guide

### From stable repository

Upgrade an existing release from `stable/jenkins` to `jenkins/jenkins` seamlessly by ensuring you have the latest [repository info](#get-repository-info) and running the [upgrade commands](#upgrade-chart) specifying the `jenkins/jenkins` chart.

### Major Version Upgrades

Chart release versions follow [SemVer](../../CONTRIBUTING.md#versioning), where a MAJOR version change (example `1.0.0` -> `2.0.0`) indicates an incompatible breaking change needing manual actions.

See [UPGRADING.md](./UPGRADING.md) for a list of breaking changes
