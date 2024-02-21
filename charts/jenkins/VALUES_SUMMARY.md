# Jenkins

## Configuration

The following tables list the configurable parameters of the Jenkins chart and their default values.

### Jenkins Controller

| Parameter                                   | Description                                                              | Default                                                              |
|---------------------------------------------|--------------------------------------------------------------------------|----------------------------------------------------------------------|
| `checkDeprecation`                          | Checks for deprecated values used                                        | `true`                                                               |
| `clusterZone`                               | Override the cluster name for FQDN resolving                             | `cluster.local`                                                      |
| `kubernetesURL`                             | Override the Kubernetes API server URL                                   | `https://kubernetes.default`                                         |
| `nameOverride`                              | Override the resource name prefix                                        | `jenkins`                                                            |
| `renderHelmLabels`                          | Enables rendering of the helm.sh/chart label to the annotations          | `true`                                                               |
| `fullnameOverride`                          | Override the full resource names                                         | `jenkins-{release-name}` (or `jenkins` if release-name is `jenkins`) |
| `namespaceOverride`                         | Override the deployment namespace                                        | Not set (`Release.Namespace`)                                        |
| `controller.componentName`                  | Jenkins controller name                                                  | `jenkins-controller`                                                 |
| `controller.testEnabled`                    | Can be used to disable rendering test resources when using helm template | `true`                                                               |
| `controller.cloudName`                      | Name of default cloud configuration                                      | `kubernetes`                                                         |
| `controller.legacyRemotingSecurityEnabled`  | Is remoting security enabled?                                            | Not set (i.e. not enabled)                                           |

#### Jenkins Configuration as Code (JCasC)

| Parameter                                                       | Description                                                                                                                       | Default                                                           |
|-----------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------|
| `controller.JCasC.defaultConfig`                                | Enables default Jenkins configuration via configuration as code plugin                                                            | `true`                                                            |
| `controller.JCasC.configScripts`                                | List of Jenkins Config as Code scripts                                                                                            | `{}`                                                              |
| `controller.JCasC.security`                                     | Jenkins Config as Code for Security section                                                                                       | `legacy`                                                          |
| `controller.JCasC.securityRealm`                                | Jenkins Config as Code for Security Realm                                                                                         | `legacy`                                                          |
| `controller.JCasC.authorizationStrategy`                        | Jenkins Config as Code for Authorization Strategy                                                                                 | `loggedInUsersCanDoAnything`                                      |
| `controller.JCasC.overwriteConfiguration`                       | Jenkins Config as Code overwrites any existing configuration                                                                      | `false`                                      |
| `controller.sidecars.configAutoReload`                          | Jenkins Config as Code auto-reload settings                                                                                       |                                                                   |
| `controller.sidecars.configAutoReload.enabled`                  | Jenkins Config as Code auto-reload settings (Attention: rbac needs to be enabled otherwise the sidecar can't read the config map) | `true`                                                            |
| `controller.sidecars.configAutoReload.image.registry`           | Registry for the image which triggers the reload                                                                                  | `docker.io`                                                       |
| `controller.sidecars.configAutoReload.image.repository`         | Image which triggers the reload                                                                                                   | `kiwigrid/k8s-sidecar`                                            |
| `controller.sidecars.configAutoReload.image.tag`                | Tag for the image which triggers the reload                                                                                       | `1.24.4`                                                          |
| `controller.sidecars.configAutoReload.scheme`                   | The HTTP scheme to use when connecting to the Jenkins configuration as code endpoint                                              | `http`                                                            |
| `controller.sidecars.configAutoReload.skipTlsVerify`            | Skip TLS verification when connecting to the Jenkins configuration as code endpoint                                               | `false`                                                           |
| `controller.sidecars.configAutoReload.reqRetryConnect`          | How many connection-related errors to retry on                                                                                    | `10`                                                              |
| `controller.sidecars.configAutoReload.sleepTime`                | How many seconds to wait before updating config-maps/secrets (sets METHOD=SLEEP on the sidecar)                                   | Not set                                                           |
| `controller.sidecars.configAutoReload.envFrom`                  | Environment variable sources for the Jenkins Config as Code auto-reload container                                                 | Not set                                                           |
| `controller.sidecars.configAutoReload.env`                      | Environment variables for the Jenkins Config as Code auto-reload container                                                        | Not set                                                           |
| `controller.sidecars.configAutoReload.containerSecurityContext` | Enable container security context                                                                                                 | `{readOnlyRootFilesystem: true, allowPrivilegeEscalation: false}` |

#### Jenkins Configuration Files & Scripts

| Parameter                  | Description                  | Default |
|----------------------------|------------------------------|---------|
| `controller.initScripts`   | List of Jenkins init scripts | `{}`    |
| `controller.initConfigMap` | Pre-existing init scripts    | Not set |

#### Jenkins Global Security

| Parameter                                               | Description                          | Default                      |
|---------------------------------------------------------|--------------------------------------|------------------------------|
| `controller.adminSecret`                                | Create secret for admin user         | `true`                       |
| `controller.disableRememberMe`                          | Disable use of remember me           | `false`                      |
| `controller.enableRawHtmlMarkupFormatter`               | Enable HTML parsing using            | false                        |
| `controller.markupFormatter`                            | Yaml of the markup formatter to use  | `plainText`                  |
| `controller.disabledAgentProtocols`                     | Disabled agent protocols             | `JNLP-connect JNLP2-connect` |
| `controller.csrf.defaultCrumbIssuer.enabled`            | Enable the default CSRF Crumb issuer | `true`                       |
| `controller.csrf.defaultCrumbIssuer.proxyCompatability` | Enable proxy compatibility           | `true`                       |

#### Jenkins Global Settings

| Parameter                        | Description                                                                        | Default                                                      |
|----------------------------------|------------------------------------------------------------------------------------|--------------------------------------------------------------|
| `controller.numExecutors`        | Set Number of executors                                                            | 0                                                            |
| `controller.executorMode`        | Set executor mode of the Jenkins node. Possible values are: NORMAL or EXCLUSIVE    | NORMAL                                                       |
| `controller.customJenkinsLabels` | Append Jenkins labels to the controller                                            | `[]`                                                         |
| `controller.jenkinsHome`         | Custom Jenkins home path                                                           | `/var/jenkins_home`                                          |
| `controller.jenkinsRef`          | Custom Jenkins reference path                                                      | `/usr/share/jenkins/ref`                                     |
| `controller.jenkinsAdminEmail`   | Email address for the administrator of the Jenkins instance                        | Not set                                                      |
| `controller.jenkinsUrl`          | Set Jenkins URL if you are not using the ingress definitions provided by the chart | Not set                                                      |
| `controller.jenkinsUrlProtocol`  | Set protocol for Jenkins URL                                                       | Set to `https` if `controller.ingress.tls`, `http` otherwise |
| `controller.jenkinsUriPrefix`    | Root Uri Jenkins will be served on                                                 | Not set                                                      |
| `controller.jenkinsOpts`         | Append to `JENKINS_OPTS` env var                                                   | Not set                                                      |
| `controller.javaOpts`            | Append to `JAVA_OPTS` env var                                                      | Not set                                                      |

#### Jenkins In-Process Script Approval

| Parameter                   | Description                         | Default |
|-----------------------------|-------------------------------------|---------|
| `controller.scriptApproval` | List of groovy functions to approve | `[]`    |

#### Jenkins Plugins

| Parameter                                  | Description                                                                                                                             | Default                                                                                         |
|--------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| `controller.installPlugins`                | List of Jenkins plugins to install. If you don't want to install plugins set it to `false`                                              | `kubernetes:1.31.3 workflow-aggregator:2.6 git:4.10.2 configuration-as-code:1414.v878271fc496f` |
| `controller.additionalPlugins`             | List of Jenkins plugins to install in addition to those listed in controller.installPlugins                                             | `[]`                                                                                            |
| `controller.initializeOnce`                | Initialize only on first install. Ensures plugins do not get updated inadvertently. Requires `persistence.enabled` to be set to `true`. | `false`                                                                                         |
| `controller.overwritePlugins`              | Overwrite installed plugins on start.                                                                                                   | `false`                                                                                         |
| `controller.overwritePluginsFromImage`     | Keep plugins that are already installed in the controller image.                                                                        | `true`                                                                                          |
| `controller.installLatestPlugins`          | Set to false to download the minimum required version of all dependencies.                                                              | `true`                                                                                          |
| `controller.installLatestSpecifiedPlugins` | Set to true to download latest dependencies of any plugin that is requested to have the latest version.                                 | `false`                                                                                         |

#### Jenkins Agent Listener

| Parameter                                          | Description                                                                                                                          | Default     |
|----------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------|-------------|
| `controller.agentListenerEnabled`                  | Create Agent listener service                                                                                                        | `true`      |
| `controller.agentListenerPort`                     | Listening port for agents                                                                                                            | `50000`     |
| `controller.agentListenerHostPort`                 | Host port to listen for agents                                                                                                       | Not set     |
| `controller.agentListenerNodePort`                 | Node port to listen for agents                                                                                                       | Not set     |
| `controller.agentListenerServiceType`              | Defines how to expose the agentListener service                                                                                      | `ClusterIP` |
| `controller.agentListenerServiceAnnotations`       | Annotations for the agentListener service                                                                                            | `{}`        |
| `controller.agentListenerLoadBalancerIP`           | Static IP for the agentListener LoadBalancer                                                                                         | Not set     |
| `controller.agentListenerExternalTrafficPolicy`    | [Traffic Policy](https://kubernetes.io/docs/concepts/services-networking/service/#traffic-policies) of for the agentListener service | Not set     |
| `controller.agentListenerLoadBalancerSourceRanges` | Allowed inbound IP for the agentListener service                                                                                     | `0.0.0.0/0` |

#### Kubernetes StatefulSet & Service

| Parameter                                  | Description                                                                                                                  | Default                                                                                              |
|--------------------------------------------|------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|
| `controller.image.registry`                | Controller image registry                                                                                                    | `docker.io`                                                                                          |
| `controller.image.repository`              | Controller image name                                                                                                        | `jenkins/jenkins`                                                                                    |
| `controller.image.tagLabel`                | Controller image tag label                                                                                                   | `jdk17`                                                                                              |
| `controller.image.tag`                     | Controller image tag override                                                                                                | Not set                                                                                              |
| `controller.image.pullPolicy`              | Controller image pull policy                                                                                                 | `Always`                                                                                             |
| `controller.imagePullSecretName`           | Controller image pull secret                                                                                                 | Not set                                                                                              |
| `controller.resources`                     | Resources allocation (Requests and Limits)                                                                                   | `{requests: {cpu: 50m, memory: 256Mi}, limits: {cpu: 2000m, memory: 4096Mi}}`                        |
| `controller.initContainerResources`        | Resources allocation (Requests and Limits) for Init Container                                                                | Not set                                                                                              |
| `controller.initContainerEnvFrom`          | Environment variable sources for Init Container                                                                              | Not set                                                                                              |
| `controller.initContainerEnv`              | Environment variables for Init Container                                                                                     | Not set                                                                                              |
| `controller.containerEnvFrom`              | Environment variable sources for Jenkins Container                                                                           | Not set                                                                                              |
| `controller.containerEnv`                  | Environment variables for Jenkins Container                                                                                  | Not set                                                                                              |
| `controller.usePodSecurityContext`         | Enable pod security context (must be `true` if `runAsUser`, `fsGroup`, or `podSecurityContextOverride` are set)              | `true`                                                                                               |
| `controller.runAsUser`                     | Deprecated in favor of `controller.podSecurityContextOverride`.  uid that jenkins runs with.                                 | `1000`                                                                                               |
| `controller.fsGroup`                       | Deprecated in favor of `controller.podSecurityContextOverride`.  uid that will be used for persistent volume.                | `1000`                                                                                               |
| `controller.podSecurityContextOverride`    | Completely overwrites the contents of the pod security context, ignoring the values provided for `runAsUser`, and `fsGroup`. | Not set                                                                                              |
| `controller.containerSecurityContext`      | Allow to control securityContext for the jenkins container.                                                                  | `{runAsUser: 1000, runAsGroup: 1000, readOnlyRootFilesystem: true, allowPrivilegeEscalation: false}` |
| `controller.hostAliases`                   | Aliases for IPs in `/etc/hosts`                                                                                              | `[]`                                                                                                 |
| `controller.serviceAnnotations`            | Service annotations                                                                                                          | `{}`                                                                                                 |
| `controller.serviceType`                   | k8s service type                                                                                                             | `ClusterIP`                                                                                          |
| `controller.clusterIP`                     | k8s service clusterIP                                                                                                        | Not set                                                                                              |
| `controller.servicePort`                   | k8s service port                                                                                                             | `8080`                                                                                               |
| `controller.targetPort`                    | k8s target port                                                                                                              | `8080`                                                                                               |
| `controller.nodePort`                      | k8s node port                                                                                                                | Not set                                                                                              |
| `controller.jmxPort`                       | Open a port, for JMX stats                                                                                                   | Not set                                                                                              |
| `controller.extraPorts`                    | Open extra ports, for other uses                                                                                             | `[]`                                                                                                 |
| `controller.loadBalancerSourceRanges`      | Allowed inbound IP addresses                                                                                                 | `0.0.0.0/0`                                                                                          |
| `controller.loadBalancerIP`                | Optional fixed external IP                                                                                                   | Not set                                                                                              |
| `controller.statefulSetLabels`             | Custom StatefulSet labels                                                                                                    | Not set                                                                                              |
| `controller.serviceLabels`                 | Custom Service labels                                                                                                        | Not set                                                                                              |
| `controller.podLabels`                     | Custom Pod labels (an object with `label-key: label-value` pairs)                                                            | Not set                                                                                              |
| `controller.nodeSelector`                  | Node labels for pod assignment                                                                                               | `{}`                                                                                                 |
| `controller.affinity`                      | Affinity settings                                                                                                            | `{}`                                                                                                 |
| `controller.schedulerName`                 | Kubernetes scheduler name                                                                                                    | Not set                                                                                              |
| `controller.terminationGracePeriodSeconds` | Set TerminationGracePeriodSeconds                                                                                            | Not set                                                                                              |
| `controller.terminationMessagePath`        | Set the termination message path                                                                                             | Not set                                                                                              |
| `controller.terminationMessagePolicy`      | Set the termination message policy                                                                                           | Not set                                                                                              |
| `controller.tolerations`                   | Toleration labels for pod assignment                                                                                         | `[]`                                                                                                 |
| `controller.podAnnotations`                | Annotations for controller pod                                                                                               | `{}`                                                                                                 |
| `controller.statefulSetAnnotations`        | Annotations for controller StatefulSet                                                                                       | `{}`                                                                                                 |
| `controller.updateStrategy`                | Update strategy for StatefulSet                                                                                              | `{}`                                                                                                 |
| `controller.lifecycle`                     | Lifecycle specification for controller-container                                                                             | Not set                                                                                              |
| `controller.priorityClassName`             | The name of a `priorityClass` to apply to the controller pod                                                                 | Not set                                                                                              |
| `controller.admin.existingSecret`          | The name of an existing secret containing the admin credentials.                                                             | `""`                                                                                                 |
| `controller.admin.userKey`                 | The key in the existing admin secret containing the username.                                                                | `jenkins-admin-user`                                                                                 |
| `controller.admin.passwordKey`             | The key in the existing admin secret containing the password.                                                                | `jenkins-admin-password`                                                                             |
| `controller.customInitContainers`          | Custom init-container specification in raw-yaml format                                                                       | Not set                                                                                              |
| `controller.sidecars.additionalSidecarContainers`| Configures additional sidecar container(s) for Jenkins controller                                                            | `[]`                                                                                                 |

#### Kubernetes Pod Disruption Budget

| Parameter                                       | Description                                                                                                                                                                | Default          |
|-------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------|
| `controller.podDisruptionBudget.enabled`        | Enable [Kubernetes Pod Disruption Budget](https://kubernetes.io/docs/tasks/run-application/configure-pdb/) configuration from `controller.podDisruptionBudget` (see below) | `false`          |
| `controller.podDisruptionBudget.apiVersion`     | Policy API version                                                                                                                                                         | `policy/v1beta1` |
| `controller.podDisruptionBudget.maxUnavailable` | Number of pods that can be unavailable. Either an absolute number or a percentage.                                                                                         | Not set          |

#### Kubernetes Health Probes

| Parameter                                              | Description                                                                                                                                                                         | Default                                                                                           |
|--------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| `controller.healthProbes`                              | Enable [Kubernetes Probes](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes) configuration from `controller.probes` (see below) | `true`                                                                                            |
| `controller.probes.livenessProbe.timeoutSeconds`       | Set the timeout for the liveness probe in seconds                                                                                                                                   | `5`                                                                                               |
| `controller.probes.livenessProbe.periodSeconds`        | Set the time interval (in seconds) between two liveness probes executions                                                                                                           | `10`                                                                                              |
| `controller.probes.livenessProbe.failureThreshold`     | Set the failure threshold for the liveness probe                                                                                                                                    | `5`                                                                                               |
| `controller.probes.livenessProbe.initialDelaySeconds`  | Set the initial delay for the liveness probe                                                                                                                                        | Not set                                                                                           |
| `controller.probes.livenessProbe.httpGet.port`         | Set the Pod's HTTP port to use for the liveness probe                                                                                                                               | `http`                                                                                            |
| `controller.probes.livenessProbe.httpGet.path`         | Set the HTTP's path for the liveness probe                                                                                                                                          | `/login'` (or `${controller.jenkinsUriPrefix}/login` if `controller.jenkinsUriPrefix` is defined) |
| `controller.probes.readinessProbe.timeoutSeconds`      | Set the timeout for the readiness probe in seconds                                                                                                                                  | `5`                                                                                               |
| `controller.probes.readinessProbe.periodSeconds`       | Set the time interval (in seconds) between two readiness probes executions                                                                                                          | `10`                                                                                              |
| `controller.probes.readinessProbe.failureThreshold`    | Set the failure threshold for the readiness probe                                                                                                                                   | `3`                                                                                               |
| `controller.probes.readinessProbe.initialDelaySeconds` | Set the initial delay for the readiness probe                                                                                                                                       | Not set                                                                                           |
| `controller.probes.readinessProbe.httpGet.port`        | Set the Pod's HTTP port to use for the readiness probe                                                                                                                              | `http`                                                                                            |
| `controller.probes.readinessProbe.httpGet.path`        | Set the HTTP's path for the readiness probe                                                                                                                                         | `/login'` (or `${controller.jenkinsUriPrefix}/login` if `controller.jenkinsUriPrefix` is defined) |
| `controller.probes.startupProbe.timeoutSeconds`        | Set the timeout for the startup probe in seconds                                                                                                                                    | `5`                                                                                               |
| `controller.probes.startupProbe.periodSeconds`         | Set the time interval (in seconds) between two startup probes executions                                                                                                            | `10`                                                                                              |
| `controller.probes.startupProbe.failureThreshold`      | Set the failure threshold for the startup probe                                                                                                                                     | `12`                                                                                              |
| `controller.probes.startupProbe.initialDelaySeconds`   | Set the initial delay for the startup probe                                                                                                                                         | Not set                                                                                           |
| `controller.probes.startupProbe.httpGet.port`          | Set the Pod's HTTP port to use for the startup probe                                                                                                                                | `http`                                                                                            |
| `controller.probes.startupProbe.httpGet.path`          | Set the HTTP's path for the startup probe                                                                                                                                           | `/login'` (or `${controller.jenkinsUriPrefix}/login` if `controller.jenkinsUriPrefix` is defined) |

#### Kubernetes Ingress

| Parameter                            | Description                            | Default              |
|--------------------------------------|----------------------------------------|----------------------|
| `controller.ingress.enabled`         | Enables ingress                        | `false`              |
| `controller.ingress.apiVersion`      | Ingress API version                    | `extensions/v1beta1` |
| `controller.ingress.hostName`        | Ingress hostname                       | Not set              |
| `controller.ingress.resourceRootUrl` | Hostname to serve assets from          | Not set              |
| `controller.ingress.annotations`     | Ingress annotations                    | `{}`                 |
| `controller.ingress.labels`          | Ingress labels                         | `{}`                 |
| `controller.ingress.path`            | Ingress path                           | Not set              |
| `controller.ingress.paths`           | Override for the default Ingress paths | `[]`                 |
| `controller.ingress.tls`             | Ingress TLS configuration              | `[]`                 |

#### GKE BackendConfig

| Parameter                              | Description               | Default              |
|----------------------------------------|---------------------------|----------------------|
| `controller.backendconfig.enabled`     | Enables backendconfig     | `false`              |
| `controller.backendconfig.apiVersion`  | backendconfig API version | `extensions/v1beta1` |
| `controller.backendconfig.name`        | backendconfig name        | Not set              |
| `controller.backendconfig.annotations` | backendconfig annotations | `{}`                 |
| `controller.backendconfig.labels`      | backendconfig labels      | `{}`                 |
| `controller.backendconfig.spec`        | backendconfig spec        | `{}`                 |

#### OpenShift Route

| Parameter                      | Description             | Default |
|--------------------------------|-------------------------|---------|
| `controller.route.enabled`     | Enables openshift route | `false` |
| `controller.route.annotations` | Route annotations       | `{}`    |
| `controller.route.labels`      | Route labels            | `{}`    |
| `controller.route.path`        | Route path              | Not set |

#### Prometheus

| Parameter                                              | Description                                            | Default                                           |
|--------------------------------------------------------|--------------------------------------------------------|---------------------------------------------------|
| `controller.prometheus.enabled`                        | Enables prometheus service monitor                     | `false`                                           |
| `controller.prometheus.serviceMonitorAdditionalLabels` | Additional labels to add to the service monitor object | `{}`                                              |
| `controller.prometheus.serviceMonitorNamespace`        | Custom namespace for serviceMonitor                    | Not set (same ns where is Jenkins being deployed) |
| `controller.prometheus.scrapeInterval`                 | How often prometheus should scrape metrics             | `60s`                                             |
| `controller.prometheus.scrapeEndpoint`                 | The endpoint prometheus should get metrics from        | `/prometheus`                                     |
| `controller.prometheus.alertingrules`                  | Array of prometheus alerting rules                     | `[]`                                              |
| `controller.prometheus.alertingRulesAdditionalLabels`  | Additional labels to add to the prometheus rule object | `{}`                                              |
| `controller.prometheus.prometheusRuleNamespace`        | Custom namespace for PrometheusRule                    | `""` (same ns where Jenkins being deployed)       |

#### HTTPS Keystore

| Parameter                                                    | Description                                                                                                                                                                                      | Default                 |
|--------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------|
| `controller.httpsKeyStore.enable`                            | Enables HTTPS keystore on jenkins controller                                                                                                                                                     | `false`                 |
| `controller.httpsKeyStore.jenkinsHttpsJksSecretName`         | Name of the secret that already has ssl keystore                                                                                                                                                 | ``                      |
| `controller.httpsKeyStore.jenkinsHttpsJksSecretKey`          | Name of the key in the secret that already has ssl keystore                                                                                                                                      | `jenkins-jks-file`      |
| `controller.httpsKeyStore.jenkinsHttpsJksPasswordSecretName` | Name of the secret that contains the JKS password, if it is not in the same secret as the JKS file                                                                                               | ``                      |
| `controller.httpsKeyStore.jenkinsHttpsJksPasswordSecretKey`  | Name of the key in the secret that contains the JKS password                                                                                                                                     | `https-jks-password`    |
| `controller.httpsKeyStore.httpPort`                          | HTTP Port that Jenkins should listen on along with HTTPS, it also serves liveness and readiness probs port. When HTTPS keystore is enabled servicePort and targetPort will be used as HTTPS port | `8081`                  |
| `controller.httpsKeyStore.path`                              | Path of HTTPS keystore file                                                                                                                                                                      | `/var/jenkins_keystore` |
| `controller.httpsKeyStore.fileName`                          | Jenkins keystore filename which will appear under controller.httpsKeyStore.path                                                                                                                  | `keystore.jks`          |
| `controller.httpsKeyStore.password`                          | Jenkins keystore password                                                                                                                                                                        | `password`              |
| `controller.httpsKeyStore.jenkinsKeyStoreBase64Encoded`      | Base64 encoded Keystore content. Keystore must be converted to base64 then being pasted here                                                                                                     | a self signed cert      |

#### Kubernetes Secret

| Parameter                              | Description                                                                                                                                                                                   | Default      |
|----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------|
| `controller.admin.username`            | Admin username (and password) created as a secret if `controller.admin.createSecret` is true                                                                                                  | `admin`      |
| `controller.admin.password`            | Admin password (and user) created as a secret if `controller.admin.createSecret` is true                                                                                                      | Random value |
| `controller.admin.existingSecret`      | The name of an existing secret containing keys credentials.                                                                                                                                   | `""`         |
| `controller.additionalSecrets`         | List of additional secrets to create and mount according to [JCasC docs](https://github.com/jenkinsci/configuration-as-code-plugin/blob/master/docs/features/secrets.adoc#kubernetes-secrets) | `[]`         |
| `controller.additionalExistingSecrets` | List of additional existing secrets to mount according to [JCasC docs](https://github.com/jenkinsci/configuration-as-code-plugin/blob/master/docs/features/secrets.adoc#kubernetes-secrets)   | `[]`         |
| `controller.secretClaims`              | List of `SecretClaim` resources to create                                                                                                                                                     | `[]`         |

#### Kubernetes NetworkPolicy

| Parameter                                      | Description                                                                                                              | Default                |
|------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|------------------------|
| `networkPolicy.enabled`                        | Enable creation of NetworkPolicy resources.                                                                              | `false`                |
| `networkPolicy.apiVersion`                     | NetworkPolicy ApiVersion                                                                                                 | `networking.k8s.io/v1` |
| `networkPolicy.internalAgents.allowed`         | Allow internal agents (from the same cluster) to connect to controller. Agent pods would be filtered based on PodLabels. | `false`                |
| `networkPolicy.internalAgents.podLabels`       | A map of labels (keys/values) that agents pods must have to be able to connect to controller.                            | `{}`                   |
| `networkPolicy.internalAgents.namespaceLabels` | A map of labels (keys/values) that agents namespaces must have to be able to connect to controller.                      | `{}`                   |
| `networkPolicy.externalAgents.ipCIDR`          | The IP range from which external agents are allowed to connect to controller.                                            | ``                     |
| `networkPolicy.externalAgents.except`          | A list of IP sub-ranges to be excluded from the whitelisted IP range.                                                    | `[]`                   |

#### Kubernetes RBAC

| Parameter          | Description                                                                   | Default |
|--------------------|-------------------------------------------------------------------------------|---------|
| `rbac.create`      | Whether RBAC resources are created                                            | `true`  |
| `rbac.readSecrets` | Whether the Jenkins service account should be able to read Kubernetes secrets | `false` |

#### Kubernetes ServiceAccount - Controller

| Parameter                            | Description                                                          | Default       |
|--------------------------------------|----------------------------------------------------------------------|---------------|
| `serviceAccount.name`                | name of the ServiceAccount to be used by access-controlled resources | autogenerated |
| `serviceAccount.create`              | Configures if a ServiceAccount with this name should be created      | `true`        |
| `serviceAccount.annotations`         | Configures annotation for the ServiceAccount                         | `{}`          |
| `serviceAccount.extraLabels`         | Configures extra labels for the ServiceAccount                       | `{}`          |
| `serviceAccount.imagePullSecretName` | Controller ServiceAccount image pull secret                          | Not set       |

#### Kubernetes ServiceAccount - Agent

| Parameter                                 | Description                                                                | Default       |
|-------------------------------------------|----------------------------------------------------------------------------|---------------|
| `serviceAccountAgent.name`                | name of the agent ServiceAccount to be used by access-controlled resources | autogenerated |
| `serviceAccountAgent.create`              | Configures if an agent ServiceAccount with this name should be created     | `false`       |
| `serviceAccountAgent.annotations`         | Configures annotation for the agent ServiceAccount                         | `{}`          |
| `serviceAccountAgent.extraLabels`         | Configures extra labels for the agent ServiceAccount                       | `{}`          |
| `serviceAccountAgent.imagePullSecretName` | Agent ServiceAccount image pull secret                                     | Not set       |

### Jenkins Agent(s)

| Parameter                        | Description                                                                                                          | Default |
|----------------------------------|----------------------------------------------------------------------------------------------------------------------|---------|
| `agent.enabled`                  | Enable Kubernetes plugin jnlp-agent podTemplate                                                                      | `true`  |
| `agent.namespace`                | Namespace in which the Kubernetes agents should be launched                                                          | Not set |
| `agent.containerCap`             | Maximum number of agent                                                                                              | 10      |
| `agent.defaultsProviderTemplate` | The name of the pod template to use for providing default values                                                     | Not set |
| `agent.jenkinsUrl`               | Overrides the Kubernetes Jenkins URL                                                                                 | Not set |
| `agent.jenkinsTunnel`            | Overrides the Kubernetes Jenkins tunnel                                                                              | Not set |
| `agent.kubernetesConnectTimeout` | The connection timeout in seconds for connections to Kubernetes API. Minimum value is 5.                             | 5       |
| `agent.kubernetesReadTimeout`    | The read timeout in seconds for connections to Kubernetes API. Minimum value is 15.                                  | 15      |
| `agent.maxRequestsPerHostStr`    | The maximum concurrent connections to Kubernetes API                                                                 | 32      |
| `agent.retentionTimeout`         | Time in minutes after which the Kubernetes cloud plugin will clean up an idle worker that has not already terminated | 5       |
| `agent.waitForPodSec`            | Seconds to wait for pod to be running                                                                                | 600     |
| `agent.podLabels`                | Custom Pod labels (an object with `label-key: label-value` pairs)                                                    | Not set |
| `agent.jnlpregistry`             | Custom docker registry used for to get agent jnlp image                                                              | Not set |

#### Pod Configuration

| Parameter                    | Description                                                                                   | Default    |
|------------------------------|-----------------------------------------------------------------------------------------------|------------|
| `agent.websocket`            | Enables agent communication via websockets                                                    | false      |
| `agent.podName`              | Agent Pod base name                                                                           | Not set    |
| `agent.customJenkinsLabels`  | Append Jenkins labels to the agent                                                            | `[]`       |
| `agent.envVars`              | Environment variables for the agent Pod                                                       | `[]`       |
| `agent.idleMinutes`          | Allows the Pod to remain active for reuse                                                     | 0          |
| `agent.imagePullSecretName`  | Agent image pull secret                                                                       | Not set    |
| `agent.hostNetworking`       | Enabled agent to use hostnetwork                                                              | false      |
| `agent.nodeSelector`         | Node labels for pod assignment                                                                | `{}`       |
| `agent.connectTimeout`       | Timeout in seconds for an agent to be online                                                  | 100        |
| `agent.volumes`              | Additional volumes                                                                            | `[]`       |
| `agent.workspaceVolume`      | Workspace volume (defaults to EmptyDir)                                                       | `{}`       |
| `agent.yamlTemplate`         | The raw yaml of a Pod API Object to merge into the agent spec                                 | Not set    |
| `agent.yamlMergeStrategy`    | Defines how the raw yaml field gets merged with yaml definitions from inherited pod templates | `override` |
| `agent.annotations`          | Annotations to apply to the pod                                                               | `{}`       |
| `agent.additionalContainers` | Add additional containers to the agents.                                                      | `[]`       |

#### Side Container Configuration

| Parameter                 | Description                                     | Default                                                                        |
|---------------------------| ----------------------------------------------- |--------------------------------------------------------------------------------|
| `agent.sideContainerName` | Side container name in agent                    | jnlp                                                                           |
| `agent.image.repository`  | Agent image name                                | `jenkins/inbound-agent`                                                        |
| `agent.image.tag`         | Agent image tag                                 | `3192.v713e3b_039fb_e-5`                                                       |
| `agent.alwaysPullImage`   | Always pull agent container image before build  | `false`                                                                        |
| `agent.privileged`        | Agent privileged container                      | `false`                                                                        |
| `agent.resources`         | Resources allocation (Requests and Limits)      | `{requests: {cpu: 512m, memory: 512Mi}, limits: {cpu: 512m, memory: 512Mi}}`   |
| `agent.runAsUser`         | Configure container user                        | Not set                                                                        |
| `agent.runAsGroup`        | Configure container group                       | Not set                                                                        |
| `agent.command`           | Executed command when side container starts     | Not set                                                                        |
| `agent.args`              | Arguments passed to executed command            | `${computer.jnlpmac} ${computer.name}`                                         |
| `agent.TTYEnabled`        | Allocate pseudo tty to the side container       | false                                                                          |
| `agent.workingDir`        | Configure working directory for default agent   | `/home/jenkins/agent`                                                          |


#### Other

| Parameter                   | Description                                                     | Default |
|-----------------------------|-----------------------------------------------------------------|---------|
| `agent.disableDefaultAgent` | Ignore the default Jenkins Agent configuration                  | false   |
| `agent.podTemplates`        | Configures extra pod templates for the default kubernetes cloud | `{}`    |
| `additionalAgents`          | Configure additional agents which inherit values from `agent`   | `{}`    |

### Persistence

| Parameter                   | Description                            | Default         |
|-----------------------------|----------------------------------------|-----------------|
| `persistence.enabled`       | Enable the use of a Jenkins PVC        | `true`          |
| `persistence.existingClaim` | Provide the name of a PVC              | `nil`           |
| `persistence.storageClass`  | Storage class for the PVC              | `nil`           |
| `persistence.annotations`   | Annotations for the PVC                | `{}`            |
| `persistence.labels`        | Labels for the PVC                     | `{}`            |
| `persistence.accessMode`    | The PVC access mode                    | `ReadWriteOnce` |
| `persistence.size`          | The size of the PVC                    | `8Gi`           |
| `persistence.dataSource`    | Existing data source to clone PVC from | `nil`           |
| `persistence.subPath`       | SubPath for jenkins-home mount         | `nil`           |
| `persistence.volumes`       | Additional volumes                     | `nil`           |
| `persistence.mounts`        | Additional mounts                      | `nil`           |

### Helm Tests

| Parameter                        | Description                         | Default     |
|----------------------------------|-------------------------------------|-------------|
| `helmtest.bats.image.registry`   | Registry used to test the framework | `docker.io` |
| `helmtest.bats.image.repository` | Image used to test the framework    | `bats/bats` |
| `helmtest.bats.image.tag`        | Test framework image tag override   | `1.2.1`     |
