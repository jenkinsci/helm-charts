# jenkins

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalAgents | object | `{}` | Configure additional |
| additionalClouds | object | `{}` |  |
| agent.TTYEnabled | bool | `false` | Allocate pseudo tty to the side container |
| agent.additionalContainers | list | `[]` | Add additional containers to the agents |
| agent.alwaysPullImage | bool | `false` | Always pull agent container image before build |
| agent.annotations | object | `{}` | Annotations to apply to the pod |
| agent.args | string | `"${computer.jnlpmac} ${computer.name}"` | Arguments passed to command to execute |
| agent.command | string | `nil` | Command to execute when side container starts |
| agent.componentName | string | `"jenkins-agent"` |  |
| agent.connectTimeout | int | `100` | Timeout in seconds for an agent to be online |
| agent.containerCap | int | `10` | Max number of agents to launch |
| agent.customJenkinsLabels | list | `[]` | Append Jenkins labels to the agent |
| agent.defaultsProviderTemplate | string | `""` | The name of the pod template to use for providing default values |
| agent.directConnection | bool | `false` |  |
| agent.disableDefaultAgent | bool | `false` | Disable the default Jenkins Agent configuration |
| agent.enabled | bool | `true` | Enable Kubernetes plugin jnlp-agent podTemplate |
| agent.envVars | list | `[]` | Environment variables for the agent Pod |
| agent.hostNetworking | bool | `false` | Enables the agent to use the host network |
| agent.idleMinutes | int | `0` | Allows the Pod to remain active for reuse until the configured number of minutes has passed since the last step was executed on it |
| agent.image.repository | string | `"jenkins/inbound-agent"` | Repository to pull the agent jnlp image from |
| agent.image.tag | string | `"3206.vb_15dcf73f6a_9-3"` | Tag of the image to pull |
| agent.imagePullSecretName | string | `nil` | Name of the secret to be used to pull the image |
| agent.jenkinsTunnel | string | `nil` | Overrides the Kubernetes Jenkins tunnel |
| agent.jenkinsUrl | string | `nil` | Overrides the Kubernetes Jenkins URL |
| agent.jnlpregistry | string | `nil` | Custom registry used to pull the agent jnlp image from |
| agent.kubernetesConnectTimeout | int | `5` | The connection timeout in seconds for connections to Kubernetes API. The minimum value is 5 |
| agent.kubernetesReadTimeout | int | `15` | The read timeout in seconds for connections to Kubernetes API. The minimum value is 15 |
| agent.livenessProbe | object | `{}` |  |
| agent.maxRequestsPerHostStr | string | `"32"` | The maximum concurrent connections to Kubernetes API |
| agent.namespace | string | `nil` | Namespace in which the Kubernetes agents should be launched |
| agent.nodeSelector | object | `{}` | Node labels for pod assignment |
| agent.nodeUsageMode | string | `"NORMAL"` |  |
| agent.podLabels | object | `{}` | Custom Pod labels (an object with `label-key: label-value` pairs) |
| agent.podName | string | `"default"` | Agent Pod base name |
| agent.podRetention | string | `"Never"` |  |
| agent.podTemplates | object | `{}` | Configures extra pod templates for the default kubernetes cloud |
| agent.privileged | bool | `false` | Agent privileged container |
| agent.resources | object | `{"limits":{"cpu":"512m","memory":"512Mi"},"requests":{"cpu":"512m","memory":"512Mi"}}` | Resources allocation (Requests and Limits) |
| agent.retentionTimeout | int | `5` | Time in minutes after which the Kubernetes cloud plugin will clean up an idle worker that has not already terminated |
| agent.runAsGroup | string | `nil` | Configure container group |
| agent.runAsUser | string | `nil` | Configure container user |
| agent.secretEnvVars | list | `[]` | Mount a secret as environment variable |
| agent.showRawYaml | bool | `true` |  |
| agent.sideContainerName | string | `"jnlp"` | Side container name |
| agent.volumes | list | `[]` | Additional volumes |
| agent.waitForPodSec | int | `600` | Seconds to wait for pod to be running |
| agent.websocket | bool | `false` | Enables agent communication via websockets |
| agent.workingDir | string | `"/home/jenkins/agent"` | Configure working directory for default agent |
| agent.workspaceVolume | object | `{}` | Workspace volume (defaults to EmptyDir) |
| agent.yamlMergeStrategy | string | `"override"` | Defines how the raw yaml field gets merged with yaml definitions from inherited pod templates. Possible values: "merge" or "override" |
| agent.yamlTemplate | string | `""` | The raw yaml of a Pod API Object to merge into the agent spec |
| awsSecurityGroupPolicies.enabled | bool | `false` |  |
| awsSecurityGroupPolicies.policies[0].name | string | `""` |  |
| awsSecurityGroupPolicies.policies[0].podSelector | object | `{}` |  |
| awsSecurityGroupPolicies.policies[0].securityGroupIds | list | `[]` |  |
| checkDeprecation | bool | `true` | Checks if any deprecated values are used |
| clusterZone | string | `"cluster.local"` | Override the cluster name for FQDN resolving |
| controller.JCasC.authorizationStrategy | string | `"loggedInUsersCanDoAnything:\n  allowAnonymousRead: false"` | Jenkins Config as Code Authorization Strategy-section |
| controller.JCasC.configScripts | object | `{}` | List of Jenkins Config as Code scripts |
| controller.JCasC.configUrls | list | `[]` | Remote URLs for configuration files. |
| controller.JCasC.defaultConfig | bool | `true` | Enables default Jenkins configuration via configuration as code plugin |
| controller.JCasC.overwriteConfiguration | bool | `false` | Whether Jenkins Config as Code should overwrite any existing configuration |
| controller.JCasC.security | object | `{"apiToken":{"creationOfLegacyTokenEnabled":false,"tokenGenerationOnCreationEnabled":false,"usageStatisticsEnabled":true}}` | Jenkins Config as Code security-section |
| controller.JCasC.securityRealm | string | `"local:\n  allowsSignup: false\n  enableCaptcha: false\n  users:\n  - id: \"${chart-admin-username}\"\n    name: \"Jenkins Admin\"\n    password: \"${chart-admin-password}\""` | Jenkins Config as Code Security Realm-section |
| controller.additionalExistingSecrets | list | `[]` | List of additional existing secrets to mount |
| controller.additionalPlugins | list | `[]` | List of plugins to install in addition to those listed in controller.installPlugins |
| controller.additionalSecrets | list | `[]` | List of additional secrets to create and mount |
| controller.admin.createSecret | bool | `true` | Create secret for admin user |
| controller.admin.existingSecret | string | `""` | The name of an existing secret containing the admin credentials |
| controller.admin.password | string | <random password> | Admin password created as a secret if `controller.admin.createSecret` is true |
| controller.admin.passwordKey | string | `"jenkins-admin-password"` | The key in the existing admin secret containing the password |
| controller.admin.userKey | string | `"jenkins-admin-user"` | The key in the existing admin secret containing the username |
| controller.admin.username | string | `"admin"` | Admin username created as a secret if `controller.admin.createSecret` is true |
| controller.affinity | object | `{}` | Affinity settings |
| controller.agentListenerEnabled | bool | `true` | Create Agent listener service |
| controller.agentListenerExternalTrafficPolicy | string | `nil` | Traffic Policy of for the agentListener service ref: https://kubernetes.io/docs/concepts/services-networking/service/#traffic-policies |
| controller.agentListenerHostPort | string | `nil` | Host port to listen for agents |
| controller.agentListenerLoadBalancerIP | string | `nil` | Static IP for the agentListener LoadBalancer |
| controller.agentListenerLoadBalancerSourceRanges | list | `["0.0.0.0/0"]` | Allowed inbound IP for the agentListener service |
| controller.agentListenerNodePort | string | `nil` | Node port to listen for agents |
| controller.agentListenerPort | int | `50000` | Listening port for agents |
| controller.agentListenerServiceAnnotations | object | `{}` | Annotations for the agentListener service |
| controller.agentListenerServiceType | string | `"ClusterIP"` | Defines how to expose the agentListener service |
| controller.backendconfig.annotations | object | `{}` | backendconfig annotations |
| controller.backendconfig.apiVersion | string | `"extensions/v1beta1"` | backendconfig API version |
| controller.backendconfig.enabled | bool | `false` | Enables backendconfig |
| controller.backendconfig.labels | object | `{}` | backendconfig labels |
| controller.backendconfig.name | string | `nil` | backendconfig name |
| controller.backendconfig.spec | object | `{}` | backendconfig spec |
| controller.cloudName | string | `"kubernetes"` | Name of default cloud configuration. |
| controller.clusterIp | string | `nil` | k8s service clusterIP. Only used if serviceType is ClusterIP |
| controller.componentName | string | `"jenkins-controller"` | Used for label app.kubernetes.io/component |
| controller.containerEnv | list | `[]` | Environment variables for Jenkins Container |
| controller.containerEnvFrom | list | `[]` | Environment variable sources for Jenkins Container |
| controller.containerSecurityContext | object | `{"allowPrivilegeEscalation":false,"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsUser":1000}` | Allow controlling the securityContext for the jenkins container |
| controller.csrf.defaultCrumbIssuer.enabled | bool | `true` | Enable the default CSRF Crumb issuer |
| controller.csrf.defaultCrumbIssuer.proxyCompatability | bool | `true` | Enable proxy compatibility |
| controller.customInitContainers | list | `[]` | Custom init-container specification in raw-yaml format |
| controller.customJenkinsLabels | list | `[]` | Append Jenkins labels to the controller |
| controller.disableRememberMe | bool | `false` | Disable use of remember me |
| controller.disabledAgentProtocols | list | `["JNLP-connect","JNLP2-connect"]` | Disabled agent protocols |
| controller.enableRawHtmlMarkupFormatter | bool | `false` | Enable HTML parsing using OWASP Markup Formatter Plugin (antisamy-markup-formatter) |
| controller.executorMode | string | `"NORMAL"` | Sets the executor mode of the Jenkins node. Possible values are "NORMAL" or "EXCLUSIVE" |
| controller.existingSecret | string | `nil` |  |
| controller.extraPorts | list | `[]` | Optionally configure other ports to expose in the controller container |
| controller.fsGroup | int | `1000` | Deprecated in favor of `controller.podSecurityContextOverride`. uid that will be used for persistent volume. |
| controller.googlePodMonitor.enabled | bool | `false` |  |
| controller.googlePodMonitor.scrapeEndpoint | string | `"/prometheus"` |  |
| controller.googlePodMonitor.scrapeInterval | string | `"60s"` |  |
| controller.healthProbes | bool | `true` | Enable Kubernetes Probes configuration configured in `controller.probes` |
| controller.hostAliases | list | `[]` | Allows for adding entries to Pod /etc/hosts |
| controller.hostNetworking | bool | `false` |  |
| controller.httpsKeyStore.disableSecretMount | bool | `false` |  |
| controller.httpsKeyStore.enable | bool | `false` | Enables HTTPS keystore on jenkins controller |
| controller.httpsKeyStore.fileName | string | `"keystore.jks"` | Jenkins keystore filename which will appear under controller.httpsKeyStore.path |
| controller.httpsKeyStore.httpPort | int | `8081` | HTTP Port that Jenkins should listen to along with HTTPS, it also serves as the liveness and readiness probes port. |
| controller.httpsKeyStore.jenkinsHttpsJksPasswordSecretKey | string | `"https-jks-password"` | Name of the key in the secret that contains the JKS password |
| controller.httpsKeyStore.jenkinsHttpsJksPasswordSecretName | string | `""` | Name of the secret that contains the JKS password, if it is not in the same secret as the JKS file |
| controller.httpsKeyStore.jenkinsHttpsJksSecretKey | string | `"jenkins-jks-file"` | Name of the key in the secret that already has ssl keystore |
| controller.httpsKeyStore.jenkinsHttpsJksSecretName | string | `""` | Name of the secret that already has ssl keystore |
| controller.httpsKeyStore.jenkinsKeyStoreBase64Encoded | string | `nil` | Base64 encoded Keystore content. Keystore must be converted to base64 then being pasted here |
| controller.httpsKeyStore.password | string | `"password"` | Jenkins keystore password |
| controller.httpsKeyStore.path | string | `"/var/jenkins_keystore"` | Path of HTTPS keystore file |
| controller.image.pullPolicy | string | `"Always"` | Controller image pull policy |
| controller.image.registry | string | `"docker.io"` | Controller image registry |
| controller.image.repository | string | `"jenkins/jenkins"` | Controller image repository |
| controller.image.tag | string | `nil` | Controller image tag override; i.e., tag: "2.440.1-jdk17" |
| controller.image.tagLabel | string | `"jdk17"` | Controller image tag label |
| controller.imagePullSecretName | string | `nil` | Controller image pull secret |
| controller.ingress.annotations | object | `{}` | Ingress annotations |
| controller.ingress.apiVersion | string | `"extensions/v1beta1"` | Ingress API version |
| controller.ingress.enabled | bool | `false` | Enables ingress |
| controller.ingress.hostName | string | `nil` | Ingress hostname |
| controller.ingress.labels | object | `{}` | Ingress labels |
| controller.ingress.path | string | `nil` | Ingress path |
| controller.ingress.paths | list | `[]` | Override for the default Ingress paths |
| controller.ingress.resourceRootUrl | string | `nil` | Hostname to serve assets from |
| controller.ingress.tls | list | `[]` | Ingress TLS configuration |
| controller.initConfigMap | string | `nil` | Name of the existing ConfigMap that contains init scripts |
| controller.initContainerEnv | list | `[]` | Environment variables for Init Container |
| controller.initContainerEnvFrom | list | `[]` | Environment variable sources for Init Container |
| controller.initContainerResources | object | `{}` | Resources allocation (Requests and Limits) for Init Container |
| controller.initScripts | object | `{}` | Map of groovy init scripts to be executed during Jenkins controller start |
| controller.initializeOnce | bool | `false` | Initialize only on first installation. Ensures plugins do not get updated inadvertently. Requires `persistence.enabled` to be set to `true` |
| controller.installLatestPlugins | bool | `true` | Download the minimum required version or latest version of all dependencies |
| controller.installLatestSpecifiedPlugins | bool | `false` | Set to true to download the latest version of any plugin that is requested to have the latest version |
| controller.installPlugins | list | `["kubernetes:4186.v1d804571d5d4","workflow-aggregator:596.v8c21c963d92d","git:5.2.1","configuration-as-code:1775.v810dc950b_514"]` | List of Jenkins plugins to install. If you don't want to install plugins, set it to `false` |
| controller.javaOpts | string | `nil` | Append to `JAVA_OPTS` env var |
| controller.jenkinsAdminEmail | string | `nil` | Email address for the administrator of the Jenkins instance |
| controller.jenkinsHome | string | `"/var/jenkins_home"` | Custom Jenkins home path |
| controller.jenkinsOpts | string | `nil` | Append to `JENKINS_OPTS` env var |
| controller.jenkinsRef | string | `"/usr/share/jenkins/ref"` | Custom Jenkins reference path |
| controller.jenkinsUriPrefix | string | `nil` | Root URI Jenkins will be served on |
| controller.jenkinsUrl | string | `nil` | Set Jenkins URL if you are not using the ingress definitions provided by the chart |
| controller.jenkinsUrlProtocol | string | `nil` | Set protocol for Jenkins URL; `https` if `controller.ingress.tls`, `http` otherwise |
| controller.jenkinsWar | string | `"/usr/share/jenkins/jenkins.war"` |  |
| controller.jmxPort | string | `nil` | Open a port, for JMX stats |
| controller.legacyRemotingSecurityEnabled | bool | `false` | Whether legacy remoting security should be enabled |
| controller.lifecycle | object | `{}` | Lifecycle specification for controller-container |
| controller.loadBalancerIP | string | `nil` | Optionally assign a known public LB IP |
| controller.loadBalancerSourceRanges | list | `["0.0.0.0/0"]` | Allowed inbound IP addresses |
| controller.markupFormatter | string | `"plainText"` | Yaml of the markup formatter to use |
| controller.nodePort | string | `nil` | k8s node port. Only used if serviceType is NodePort |
| controller.nodeSelector | object | `{}` | Node labels for pod assignment |
| controller.numExecutors | int | `0` | Set Number of executors |
| controller.overwritePlugins | bool | `false` | Overwrite installed plugins on start |
| controller.overwritePluginsFromImage | bool | `true` | Overwrite plugins that are already installed in the controller image |
| controller.podAnnotations | object | `{}` | Annotations for controller pod |
| controller.podDisruptionBudget.annotations | object | `{}` |  |
| controller.podDisruptionBudget.apiVersion | string | `"policy/v1beta1"` | Policy API version |
| controller.podDisruptionBudget.enabled | bool | `false` | Enable Kubernetes Pod Disruption Budget configuration |
| controller.podDisruptionBudget.labels | object | `{}` |  |
| controller.podDisruptionBudget.maxUnavailable | string | `"0"` | Number of pods that can be unavailable. Either an absolute number or a percentage |
| controller.podLabels | object | `{}` | Custom Pod labels (an object with `label-key: label-value` pairs) |
| controller.podSecurityContextOverride | string | `nil` | Completely overwrites the contents of the pod security context, ignoring the values provided for `runAsUser`, `fsGroup`, and `securityContextCapabilities` |
| controller.priorityClassName | string | `nil` | The name of a `priorityClass` to apply to the controller pod |
| controller.probes.livenessProbe.failureThreshold | int | `5` | Set the failure threshold for the liveness probe |
| controller.probes.livenessProbe.httpGet.path | string | `"{{ default \"\" .Values.controller.jenkinsUriPrefix }}/login"` | Set the Pod's HTTP path for the liveness probe |
| controller.probes.livenessProbe.httpGet.port | string | `"http"` | Set the Pod's HTTP port to use for the liveness probe |
| controller.probes.livenessProbe.initialDelaySeconds | string | `nil` | Set the initial delay for the liveness probe in seconds |
| controller.probes.livenessProbe.periodSeconds | int | `10` | Set the time interval between two liveness probes executions in seconds |
| controller.probes.livenessProbe.timeoutSeconds | int | `5` | Set the timeout for the liveness probe in seconds |
| controller.probes.readinessProbe.failureThreshold | int | `3` | Set the failure threshold for the readiness probe |
| controller.probes.readinessProbe.httpGet.path | string | `"{{ default \"\" .Values.controller.jenkinsUriPrefix }}/login"` | Set the Pod's HTTP path for the liveness probe |
| controller.probes.readinessProbe.httpGet.port | string | `"http"` | Set the Pod's HTTP port to use for the readiness probe |
| controller.probes.readinessProbe.initialDelaySeconds | string | `nil` | Set the initial delay for the readiness probe in seconds |
| controller.probes.readinessProbe.periodSeconds | int | `10` | Set the time interval between two readiness probes executions in seconds |
| controller.probes.readinessProbe.timeoutSeconds | int | `5` | Set the timeout for the readiness probe in seconds |
| controller.probes.startupProbe.failureThreshold | int | `12` | Set the failure threshold for the startup probe |
| controller.probes.startupProbe.httpGet.path | string | `"{{ default \"\" .Values.controller.jenkinsUriPrefix }}/login"` | Set the Pod's HTTP path for the startup probe |
| controller.probes.startupProbe.httpGet.port | string | `"http"` | Set the Pod's HTTP port to use for the startup probe |
| controller.probes.startupProbe.periodSeconds | int | `10` | Set the time interval between two startup probes executions in seconds |
| controller.probes.startupProbe.timeoutSeconds | int | `5` | Set the timeout for the startup probe in seconds |
| controller.projectNamingStrategy | string | `"standard"` |  |
| controller.prometheus.alertingRulesAdditionalLabels | object | `{}` | Additional labels to add to the PrometheusRule object |
| controller.prometheus.alertingrules | list | `[]` | Array of prometheus alerting rules |
| controller.prometheus.enabled | bool | `false` | Enables prometheus service monitor |
| controller.prometheus.metricRelabelings | list | `[]` |  |
| controller.prometheus.prometheusRuleNamespace | string | `""` | Set a custom namespace where to deploy PrometheusRule resource |
| controller.prometheus.relabelings | list | `[]` |  |
| controller.prometheus.scrapeEndpoint | string | `"/prometheus"` | The endpoint prometheus should get metrics from |
| controller.prometheus.scrapeInterval | string | `"60s"` | How often prometheus should scrape metrics |
| controller.prometheus.serviceMonitorAdditionalLabels | object | `{}` | Additional labels to add to the service monitor object |
| controller.prometheus.serviceMonitorNamespace | string | `nil` | Set a custom namespace where to deploy ServiceMonitor resource |
| controller.resources | object | `{"limits":{"cpu":"2000m","memory":"4096Mi"},"requests":{"cpu":"50m","memory":"256Mi"}}` | Resource allocation (Requests and Limits) |
| controller.route.annotations | object | `{}` | Route annotations |
| controller.route.enabled | bool | `false` | Enables openshift route |
| controller.route.labels | object | `{}` | Route labels |
| controller.route.path | string | `nil` | Route path |
| controller.runAsUser | int | `1000` | Deprecated in favor of `controller.podSecurityContextOverride`. uid that jenkins runs with. |
| controller.schedulerName | string | `""` | Name of the Kubernetes scheduler to use |
| controller.scriptApproval | list | `[]` | List of groovy functions to approve |
| controller.secondaryingress.annotations | object | `{}` |  |
| controller.secondaryingress.apiVersion | string | `"extensions/v1beta1"` |  |
| controller.secondaryingress.enabled | bool | `false` |  |
| controller.secondaryingress.hostName | string | `nil` |  |
| controller.secondaryingress.labels | object | `{}` |  |
| controller.secondaryingress.paths | list | `[]` |  |
| controller.secondaryingress.tls | string | `nil` |  |
| controller.secretClaims | list | `[]` | List of `SecretClaim` resources to create |
| controller.securityContextCapabilities | object | `{}` |  |
| controller.serviceAnnotations | object | `{}` | Jenkins controller service annotations |
| controller.serviceExternalTrafficPolicy | string | `nil` |  |
| controller.serviceLabels | object | `{}` | Labels for the Jenkins controller-service |
| controller.servicePort | int | `8080` | k8s service port |
| controller.serviceType | string | `"ClusterIP"` | k8s service type |
| controller.shareProcessNamespace | bool | `false` |  |
| controller.sidecars.additionalSidecarContainers | list | `[]` | Configures additional sidecar container(s) for the Jenkins controller |
| controller.sidecars.configAutoReload.containerSecurityContext | object | `{"allowPrivilegeEscalation":false,"readOnlyRootFilesystem":true}` | Enable container security context |
| controller.sidecars.configAutoReload.enabled | bool | `true` | Enables Jenkins Config as Code auto-reload |
| controller.sidecars.configAutoReload.env | object | `{}` | Environment variables for the Jenkins Config as Code auto-reload container |
| controller.sidecars.configAutoReload.envFrom | list | `[]` | Environment variable sources for the Jenkins Config as Code auto-reload container |
| controller.sidecars.configAutoReload.folder | string | `"/var/jenkins_home/casc_configs"` |  |
| controller.sidecars.configAutoReload.image.registry | string | `"docker.io"` | Registry for the image that triggers the reload |
| controller.sidecars.configAutoReload.image.repository | string | `"kiwigrid/k8s-sidecar"` | Repository of the image that triggers the reload |
| controller.sidecars.configAutoReload.image.tag | string | `"1.26.0"` | Tag for the image that triggers the reload |
| controller.sidecars.configAutoReload.imagePullPolicy | string | `"IfNotPresent"` |  |
| controller.sidecars.configAutoReload.reqRetryConnect | int | `10` | How many connection-related errors to retry on |
| controller.sidecars.configAutoReload.resources | object | `{}` |  |
| controller.sidecars.configAutoReload.scheme | string | `"http"` | The scheme to use when connecting to the Jenkins configuration as code endpoint |
| controller.sidecars.configAutoReload.skipTlsVerify | bool | `false` | Skip TLS verification when connecting to the Jenkins configuration as code endpoint |
| controller.sidecars.configAutoReload.sleepTime | string | `nil` | How many seconds to wait before updating config-maps/secrets (sets METHOD=SLEEP on the sidecar) |
| controller.sidecars.configAutoReload.sshTcpPort | int | `1044` |  |
| controller.statefulSetAnnotations | object | `{}` | Annotations for controller StatefulSet |
| controller.statefulSetLabels | object | `{}` | Jenkins controller custom labels for the StatefulSet |
| controller.targetPort | int | `8080` | k8s target port |
| controller.terminationGracePeriodSeconds | string | `nil` | Set TerminationGracePeriodSeconds |
| controller.terminationMessagePath | string | `nil` | Set the termination message path |
| controller.terminationMessagePolicy | string | `nil` | Set the termination message policy |
| controller.testEnabled | bool | `true` | Can be used to disable rendering controller test resources when using helm template |
| controller.tolerations | list | `[]` | Toleration labels for pod assignment |
| controller.updateStrategy | object | `{}` | Update strategy for StatefulSet |
| controller.usePodSecurityContext | bool | `true` | Enable pod security context (must be `true` if podSecurityContextOverride, runAsUser or fsGroup are set) |
| credentialsId | string | `nil` | The Jenkins credentials to access the Kubernetes API server. For the default cluster it is not needed. |
| fullnameOverride | string | `jenkins-(release-name)` or `jenkins` if the release-name is `jenkins` | Override the full resource names |
| helmtest.bats.image.registry | string | `"docker.io"` | Registry of the image used to test the framework |
| helmtest.bats.image.repository | string | `"bats/bats"` | Repository of the image used to test the framework |
| helmtest.bats.image.tag | string | `"v1.10.0"` | Tag of the image to test the framework |
| kubernetesURL | string | `"https://kubernetes.default"` | The URL of the Kubernetes API server |
| nameOverride | string | `Chart.Name` | Override the resource name prefix |
| namespaceOverride | string | `Release.Namespace` | Override the deployment namespace |
| networkPolicy.apiVersion | string | `"networking.k8s.io/v1"` | NetworkPolicy ApiVersion |
| networkPolicy.enabled | bool | `false` | Enable the creation of NetworkPolicy resources |
| networkPolicy.externalAgents.except | list | `[]` | A list of IP sub-ranges to be excluded from the allowlisted IP range |
| networkPolicy.externalAgents.ipCIDR | string | `nil` | The IP range from which external agents are allowed to connect to controller, i.e., 172.17.0.0/16 |
| networkPolicy.internalAgents.allowed | bool | `true` | Allow internal agents (from the same cluster) to connect to controller. Agent pods will be filtered based on PodLabels |
| networkPolicy.internalAgents.namespaceLabels | object | `{}` | A map of labels (keys/values) that agents namespaces must have to be able to connect to controller |
| networkPolicy.internalAgents.podLabels | object | `{}` | A map of labels (keys/values) that agent pods must have to be able to connect to controller |
| persistence.accessMode | string | `"ReadWriteOnce"` | The PVC access mode |
| persistence.annotations | object | `{}` | Annotations for the PVC |
| persistence.dataSource | object | `{}` | Existing data source to clone PVC from |
| persistence.enabled | bool | `true` | Enable the use of a Jenkins PVC |
| persistence.existingClaim | string | `nil` | Provide the name of a PVC |
| persistence.labels | object | `{}` | Labels for the PVC |
| persistence.mounts | list | `[]` | Additional mounts |
| persistence.size | string | `"8Gi"` | The size of the PVC |
| persistence.storageClass | string | `nil` | Storage class for the PVC |
| persistence.subPath | string | `nil` | SubPath for jenkins-home mount |
| persistence.volumes | list | `[]` | Additional volumes |
| rbac.create | bool | `true` | Whether RBAC resources are created |
| rbac.readSecrets | bool | `false` | Whether the Jenkins service account should be able to read Kubernetes secrets |
| renderHelmLabels | bool | `true` | Enables rendering of the helm.sh/chart label to the annotations |
| serviceAccount.annotations | object | `{}` | Configures annotations for the ServiceAccount |
| serviceAccount.create | bool | `true` | Configures if a ServiceAccount with this name should be created |
| serviceAccount.extraLabels | object | `{}` | Configures extra labels for the ServiceAccount |
| serviceAccount.imagePullSecretName | string | `nil` | Controller ServiceAccount image pull secret |
| serviceAccount.name | string | `nil` |  |
| serviceAccountAgent.annotations | object | `{}` | Configures annotations for the agent ServiceAccount |
| serviceAccountAgent.create | bool | `false` | Configures if an agent ServiceAccount should be created |
| serviceAccountAgent.extraLabels | object | `{}` | Configures extra labels for the agent ServiceAccount |
| serviceAccountAgent.imagePullSecretName | string | `nil` | Agent ServiceAccount image pull secret |
| serviceAccountAgent.name | string | `nil` | The name of the agent ServiceAccount to be used by access-controlled resources |
