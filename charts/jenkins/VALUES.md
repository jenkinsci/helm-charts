# Jenkins

## Configuration

The following tables list the configurable parameters of the Jenkins chart and their default values.

## Values

| Key | Type | Description | Default |
|:----|:-----|:---------|:------------|
| [additionalAgents](./values.yaml#L1210) | object | Configure additional | `{}` |
| [additionalClouds](./values.yaml#L1235) | object |  | `{}` |
| [agent.TTYEnabled](./values.yaml#L1115) | bool | Allocate pseudo tty to the side container | `false` |
| [agent.additionalContainers](./values.yaml#L1163) | list | Add additional containers to the agents | `[]` |
| [agent.alwaysPullImage](./values.yaml#L1008) | bool | Always pull agent container image before build | `false` |
| [agent.annotations](./values.yaml#L1159) | object | Annotations to apply to the pod | `{}` |
| [agent.args](./values.yaml#L1109) | string | Arguments passed to command to execute | `"${computer.jnlpmac} ${computer.name}"` |
| [agent.command](./values.yaml#L1107) | string | Command to execute when side container starts | `nil` |
| [agent.componentName](./values.yaml#L976) | string |  | `"jenkins-agent"` |
| [agent.connectTimeout](./values.yaml#L1157) | int | Timeout in seconds for an agent to be online | `100` |
| [agent.containerCap](./values.yaml#L1117) | int | Max number of agents to launch for a whole cluster. | `10` |
| [agent.customJenkinsLabels](./values.yaml#L973) | list | Append Jenkins labels to the agent | `[]` |
| [agent.defaultsProviderTemplate](./values.yaml#L925) | string | The name of the pod template to use for providing default values | `""` |
| [agent.directConnection](./values.yaml#L979) | bool |  | `false` |
| [agent.disableDefaultAgent](./values.yaml#L1181) | bool | Disable the default Jenkins Agent configuration | `false` |
| [agent.enabled](./values.yaml#L923) | bool | Enable Kubernetes plugin jnlp-agent podTemplate | `true` |
| [agent.envVars](./values.yaml#L1090) | list | Environment variables for the agent Pod | `[]` |
| [agent.garbageCollection.enabled](./values.yaml#L1126) | bool | When enabled, Jenkins will periodically check for orphan pods that have not been touched for the given timeout period and delete them. | `false` |
| [agent.garbageCollection.namespaces](./values.yaml#L1128) | string | Namespaces to look at for garbage collection, in addition to the default namespace defined for the cloud. One namespace per line. | `""` |
| [agent.garbageCollection.timeout](./values.yaml#L1133) | int | Timeout value for orphaned pods | `300` |
| [agent.hostNetworking](./values.yaml#L987) | bool | Enables the agent to use the host network | `false` |
| [agent.idleMinutes](./values.yaml#L1136) | int | Allows the Pod to remain active for reuse until the configured number of minutes has passed since the last step was executed on it | `0` |
| [agent.image.registry](./values.yaml#L964) | string | Registry to pull the agent jnlp image from | `""` |
| [agent.image.repository](./values.yaml#L966) | string | Repository to pull the agent jnlp image from | `"jenkins/inbound-agent"` |
| [agent.image.tag](./values.yaml#L968) | string | Tag of the image to pull | `"3327.v868139a_d00e0-2"` |
| [agent.imagePullSecretName](./values.yaml#L975) | string | Name of the secret to be used to pull the image | `nil` |
| [agent.inheritYamlMergeStrategy](./values.yaml#L1155) | bool | Controls whether the defined yaml merge strategy will be inherited if another defined pod template is configured to inherit from the current one | `false` |
| [agent.instanceCap](./values.yaml#L1119) | int | Max number of agents to launch for this type of agent | `2147483647` |
| [agent.jenkinsTunnel](./values.yaml#L941) | string | Overrides the Kubernetes Jenkins tunnel | `nil` |
| [agent.jenkinsUrl](./values.yaml#L937) | string | Overrides the Kubernetes Jenkins URL | `nil` |
| [agent.jnlpregistry](./values.yaml#L961) | string | Custom registry used to pull the agent jnlp image from | `nil` |
| [agent.kubernetesConnectTimeout](./values.yaml#L947) | int | The connection timeout in seconds for connections to Kubernetes API. The minimum value is 5 | `5` |
| [agent.kubernetesReadTimeout](./values.yaml#L949) | int | The read timeout in seconds for connections to Kubernetes API. The minimum value is 15 | `15` |
| [agent.livenessProbe](./values.yaml#L998) | object |  | `{}` |
| [agent.maxRequestsPerHostStr](./values.yaml#L951) | string | The maximum concurrent connections to Kubernetes API | `"32"` |
| [agent.namespace](./values.yaml#L957) | string | Namespace in which the Kubernetes agents should be launched | `nil` |
| [agent.nodeSelector](./values.yaml#L1101) | object | Node labels for pod assignment | `{}` |
| [agent.nodeUsageMode](./values.yaml#L971) | string |  | `"NORMAL"` |
| [agent.podLabels](./values.yaml#L959) | object | Custom Pod labels (an object with `label-key: label-value` pairs) | `{}` |
| [agent.podName](./values.yaml#L1121) | string | Agent Pod base name | `"default"` |
| [agent.podRetention](./values.yaml#L1017) | string |  | `"Never"` |
| [agent.podTemplates](./values.yaml#L1191) | object | Configures extra pod templates for the default kubernetes cloud | `{}` |
| [agent.privileged](./values.yaml#L981) | bool | Agent privileged container | `false` |
| [agent.resources](./values.yaml#L989) | object | Resources allocation (Requests and Limits) | `{"limits":{"cpu":"512m","memory":"512Mi"},"requests":{"cpu":"512m","memory":"512Mi"}}` |
| [agent.restrictedPssSecurityContext](./values.yaml#L1014) | bool | Set a restricted securityContext on jnlp containers | `false` |
| [agent.retentionTimeout](./values.yaml#L953) | int | Time in minutes after which the Kubernetes cloud plugin will clean up an idle worker that has not already terminated | `5` |
| [agent.runAsGroup](./values.yaml#L985) | string | Configure container group | `nil` |
| [agent.runAsUser](./values.yaml#L983) | string | Configure container user | `nil` |
| [agent.secretEnvVars](./values.yaml#L1094) | list | Mount a secret as environment variable | `[]` |
| [agent.serviceAccount](./values.yaml#L933) | string | Override the default service account | `serviceAccountAgent.name` if `agent.useDefaultServiceAccount` is `true` |
| [agent.showRawYaml](./values.yaml#L1021) | bool |  | `true` |
| [agent.sideContainerName](./values.yaml#L1111) | string | Side container name | `"jnlp"` |
| [agent.skipTlsVerify](./values.yaml#L943) | bool | Disables the verification of the controller certificate on remote connection. This flag correspond to the "Disable https certificate check" flag in kubernetes plugin UI | `false` |
| [agent.usageRestricted](./values.yaml#L945) | bool | Enable the possibility to restrict the usage of this agent to specific folder. This flag correspond to the "Restrict pipeline support to authorized folders" flag in kubernetes plugin UI | `false` |
| [agent.useDefaultServiceAccount](./values.yaml#L929) | bool | Use `serviceAccountAgent.name` as the default value for defaults template `serviceAccount` | `true` |
| [agent.volumes](./values.yaml#L1028) | list | Additional volumes | `[]` |
| [agent.waitForPodSec](./values.yaml#L955) | int | Seconds to wait for pod to be running | `600` |
| [agent.websocket](./values.yaml#L978) | bool | Enables agent communication via websockets | `false` |
| [agent.workingDir](./values.yaml#L970) | string | Configure working directory for default agent | `"/home/jenkins/agent"` |
| [agent.workspaceVolume](./values.yaml#L1063) | object | Workspace volume (defaults to EmptyDir) | `{}` |
| [agent.yamlMergeStrategy](./values.yaml#L1153) | string | Defines how the raw yaml field gets merged with yaml definitions from inherited pod templates. Possible values: "merge" or "override" | `"override"` |
| [agent.yamlTemplate](./values.yaml#L1142) | string | The raw yaml of a Pod API Object to merge into the agent spec | `""` |
| [awsSecurityGroupPolicies.enabled](./values.yaml#L1368) | bool |  | `false` |
| [awsSecurityGroupPolicies.policies[0].name](./values.yaml#L1370) | string |  | `""` |
| [awsSecurityGroupPolicies.policies[0].podSelector](./values.yaml#L1372) | object |  | `{}` |
| [awsSecurityGroupPolicies.policies[0].securityGroupIds](./values.yaml#L1371) | list |  | `[]` |
| [checkDeprecation](./values.yaml#L1365) | bool | Checks if any deprecated values are used | `true` |
| [clusterZone](./values.yaml#L21) | string | Override the cluster name for FQDN resolving | `"cluster.local"` |
| [controller.JCasC.authorizationStrategy](./values.yaml#L548) | string | Jenkins Config as Code Authorization Strategy-section | `"loggedInUsersCanDoAnything:\n  allowAnonymousRead: false"` |
| [controller.JCasC.configMapAnnotations](./values.yaml#L553) | object | Annotations for the JCasC ConfigMap | `{}` |
| [controller.JCasC.configScripts](./values.yaml#L522) | object | List of Jenkins Config as Code scripts | `{}` |
| [controller.JCasC.configUrls](./values.yaml#L519) | list | Remote URLs for configuration files. | `[]` |
| [controller.JCasC.defaultConfig](./values.yaml#L513) | bool | Enables default Jenkins configuration via configuration as code plugin | `true` |
| [controller.JCasC.overwriteConfiguration](./values.yaml#L517) | bool | Whether Jenkins Config as Code should overwrite any existing configuration | `false` |
| [controller.JCasC.security](./values.yaml#L529) | object | Jenkins Config as Code security-section | `{"apiToken":{"creationOfLegacyTokenEnabled":false,"tokenGenerationOnCreationEnabled":false,"usageStatisticsEnabled":true}}` |
| [controller.JCasC.securityRealm](./values.yaml#L537) | string | Jenkins Config as Code Security Realm-section | `"local:\n  allowsSignup: false\n  enableCaptcha: false\n  users:\n  - id: \"${chart-admin-username}\"\n    name: \"Jenkins Admin\"\n    password: \"${chart-admin-password}\""` |
| [controller.additionalExistingSecrets](./values.yaml#L474) | list | List of additional existing secrets to mount | `[]` |
| [controller.additionalPlugins](./values.yaml#L424) | list | List of plugins to install in addition to those listed in controller.installPlugins | `[]` |
| [controller.additionalSecrets](./values.yaml#L483) | list | List of additional secrets to create and mount | `[]` |
| [controller.admin.createSecret](./values.yaml#L93) | bool | Create secret for admin user | `true` |
| [controller.admin.existingSecret](./values.yaml#L96) | string | The name of an existing secret containing the admin credentials | `""` |
| [controller.admin.password](./values.yaml#L83) | string | Admin password created as a secret if `controller.admin.createSecret` is true | `<random password>` |
| [controller.admin.passwordKey](./values.yaml#L88) | string | The key in the existing admin secret containing the password | `"jenkins-admin-password"` |
| [controller.admin.userKey](./values.yaml#L86) | string | The key in the existing admin secret containing the username | `"jenkins-admin-user"` |
| [controller.admin.username](./values.yaml#L80) | string | Admin username created as a secret if `controller.admin.createSecret` is true | `"admin"` |
| [controller.affinity](./values.yaml#L677) | object | Affinity settings | `{}` |
| [controller.agentListenerEnabled](./values.yaml#L333) | bool | Create Agent listener service | `true` |
| [controller.agentListenerExternalTrafficPolicy](./values.yaml#L343) | string | Traffic Policy of for the agentListener service | `nil` |
| [controller.agentListenerHostPort](./values.yaml#L337) | string | Host port to listen for agents | `nil` |
| [controller.agentListenerLoadBalancerIP](./values.yaml#L373) | string | Static IP for the agentListener LoadBalancer | `nil` |
| [controller.agentListenerLoadBalancerSourceRanges](./values.yaml#L345) | list | Allowed inbound IP for the agentListener service | `["0.0.0.0/0"]` |
| [controller.agentListenerNodePort](./values.yaml#L339) | string | Node port to listen for agents | `nil` |
| [controller.agentListenerPort](./values.yaml#L335) | int | Listening port for agents | `50000` |
| [controller.agentListenerServiceAnnotations](./values.yaml#L368) | object | Annotations for the agentListener service | `{}` |
| [controller.agentListenerServiceType](./values.yaml#L365) | string | Defines how to expose the agentListener service | `"ClusterIP"` |
| [controller.backendconfig.annotations](./values.yaml#L781) | object | backendconfig annotations | `{}` |
| [controller.backendconfig.apiVersion](./values.yaml#L775) | string | backendconfig API version | `"extensions/v1beta1"` |
| [controller.backendconfig.enabled](./values.yaml#L773) | bool | Enables backendconfig | `false` |
| [controller.backendconfig.labels](./values.yaml#L779) | object | backendconfig labels | `{}` |
| [controller.backendconfig.name](./values.yaml#L777) | string | backendconfig name | `nil` |
| [controller.backendconfig.spec](./values.yaml#L783) | object | backendconfig spec | `{}` |
| [controller.cloudName](./values.yaml#L502) | string | Name of default cloud configuration. | `"kubernetes"` |
| [controller.clusterIp](./values.yaml#L228) | string | k8s service clusterIP. Only used if serviceType is ClusterIP | `nil` |
| [controller.componentName](./values.yaml#L37) | string | Used for label app.kubernetes.io/component | `"jenkins-controller"` |
| [controller.containerEnv](./values.yaml#L158) | list | Environment variables for Jenkins Container | `[]` |
| [controller.containerEnvFrom](./values.yaml#L155) | list | Environment variable sources for Jenkins Container | `[]` |
| [controller.containerSecurityContext](./values.yaml#L213) | object | Allow controlling the securityContext for the jenkins container | `{"allowPrivilegeEscalation":false,"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsUser":1000}` |
| [controller.csrf.defaultCrumbIssuer.enabled](./values.yaml#L354) | bool | Enable the default CSRF Crumb issuer | `true` |
| [controller.csrf.defaultCrumbIssuer.proxyCompatability](./values.yaml#L356) | bool | Enable proxy compatibility | `true` |
| [controller.customInitContainers](./values.yaml#L556) | list | Custom init-container specification in raw-yaml format | `[]` |
| [controller.customJenkinsLabels](./values.yaml#L71) | list | Append Jenkins labels to the controller | `[]` |
| [controller.disableRememberMe](./values.yaml#L62) | bool | Disable use of remember me | `false` |
| [controller.disabledAgentProtocols](./values.yaml#L348) | list | Disabled agent protocols | `["JNLP-connect","JNLP2-connect"]` |
| [controller.enableRawHtmlMarkupFormatter](./values.yaml#L444) | bool | Enable HTML parsing using OWASP Markup Formatter Plugin (antisamy-markup-formatter) | `false` |
| [controller.enableServiceLinks](./values.yaml#L132) | bool |  | `false` |
| [controller.executorMode](./values.yaml#L68) | string | Sets the executor mode of the Jenkins node. Possible values are "NORMAL" or "EXCLUSIVE" | `"NORMAL"` |
| [controller.existingSecret](./values.yaml#L471) | string |  | `nil` |
| [controller.extraPorts](./values.yaml#L403) | list | Optionally configure other ports to expose in the controller container | `[]` |
| [controller.fsGroup](./values.yaml#L194) | int | Deprecated in favor of `controller.podSecurityContextOverride`. uid that will be used for persistent volume. | `1000` |
| [controller.googlePodMonitor.enabled](./values.yaml#L844) | bool |  | `false` |
| [controller.googlePodMonitor.scrapeEndpoint](./values.yaml#L849) | string |  | `"/prometheus"` |
| [controller.googlePodMonitor.scrapeInterval](./values.yaml#L847) | string |  | `"60s"` |
| [controller.healthProbes](./values.yaml#L263) | bool | Enable Kubernetes Probes configuration configured in `controller.probes` | `true` |
| [controller.hostAliases](./values.yaml#L797) | list | Allows for adding entries to Pod /etc/hosts | `[]` |
| [controller.hostNetworking](./values.yaml#L73) | bool |  | `false` |
| [controller.httpsKeyStore.disableSecretMount](./values.yaml#L865) | bool |  | `false` |
| [controller.httpsKeyStore.enable](./values.yaml#L856) | bool | Enables HTTPS keystore on jenkins controller | `false` |
| [controller.httpsKeyStore.fileName](./values.yaml#L873) | string | Jenkins keystore filename which will appear under controller.httpsKeyStore.path | `"keystore.jks"` |
| [controller.httpsKeyStore.httpPort](./values.yaml#L869) | int | HTTP Port that Jenkins should listen to along with HTTPS, it also serves as the liveness and readiness probes port. | `8081` |
| [controller.httpsKeyStore.jenkinsHttpsJksPasswordSecretKey](./values.yaml#L864) | string | Name of the key in the secret that contains the JKS password | `"https-jks-password"` |
| [controller.httpsKeyStore.jenkinsHttpsJksPasswordSecretName](./values.yaml#L862) | string | Name of the secret that contains the JKS password, if it is not in the same secret as the JKS file | `""` |
| [controller.httpsKeyStore.jenkinsHttpsJksSecretKey](./values.yaml#L860) | string | Name of the key in the secret that already has SSL keystore | `"jenkins-jks-file"` |
| [controller.httpsKeyStore.jenkinsHttpsJksSecretName](./values.yaml#L858) | string | Name of the secret that already has SSL keystore | `""` |
| [controller.httpsKeyStore.jenkinsKeyStoreBase64Encoded](./values.yaml#L878) | string | Base64 encoded Keystore content. Keystore must be converted to base64 then being pasted here | `nil` |
| [controller.httpsKeyStore.password](./values.yaml#L875) | string | Jenkins keystore password | `"password"` |
| [controller.httpsKeyStore.path](./values.yaml#L871) | string | Path of HTTPS keystore file | `"/var/jenkins_keystore"` |
| [controller.image.pullPolicy](./values.yaml#L50) | string | Controller image pull policy | `"Always"` |
| [controller.image.registry](./values.yaml#L40) | string | Controller image registry | `"docker.io"` |
| [controller.image.repository](./values.yaml#L42) | string | Controller image repository | `"jenkins/jenkins"` |
| [controller.image.tag](./values.yaml#L45) | string | Controller image tag override; i.e., tag: "2.440.1-jdk21" | `nil` |
| [controller.image.tagLabel](./values.yaml#L48) | string | Controller image tag label | `"jdk21"` |
| [controller.imagePullSecretName](./values.yaml#L52) | string | Controller image pull secret | `nil` |
| [controller.ingress.annotations](./values.yaml#L719) | object | Ingress annotations | `{}` |
| [controller.ingress.apiVersion](./values.yaml#L715) | string | Ingress API version | `"extensions/v1beta1"` |
| [controller.ingress.enabled](./values.yaml#L698) | bool | Enables ingress | `false` |
| [controller.ingress.hostName](./values.yaml#L733) | string | Ingress hostname | `nil` |
| [controller.ingress.labels](./values.yaml#L717) | object | Ingress labels | `{}` |
| [controller.ingress.path](./values.yaml#L729) | string | Ingress path | `nil` |
| [controller.ingress.paths](./values.yaml#L702) | list | Override for the default Ingress paths | `[]` |
| [controller.ingress.resourceRootUrl](./values.yaml#L735) | string | Hostname to serve assets from | `nil` |
| [controller.ingress.tls](./values.yaml#L737) | list | Ingress TLS configuration | `[]` |
| [controller.initConfigMap](./values.yaml#L461) | string | Name of the existing ConfigMap that contains init scripts | `nil` |
| [controller.initContainerEnv](./values.yaml#L149) | list | Environment variables for Init Container | `[]` |
| [controller.initContainerEnvFrom](./values.yaml#L145) | list | Environment variable sources for Init Container | `[]` |
| [controller.initContainerResources](./values.yaml#L136) | object | Resources allocation (Requests and Limits) for Init Container | `{}` |
| [controller.initScripts](./values.yaml#L457) | object | Map of groovy init scripts to be executed during Jenkins controller start | `{}` |
| [controller.initializeOnce](./values.yaml#L429) | bool | Initialize only on first installation. Ensures plugins do not get updated inadvertently. Requires `persistence.enabled` to be set to `true` | `false` |
| [controller.installLatestPlugins](./values.yaml#L418) | bool | Download the minimum required version or latest version of all dependencies | `true` |
| [controller.installLatestSpecifiedPlugins](./values.yaml#L421) | bool | Set to true to download the latest version of any plugin that is requested to have the latest version | `false` |
| [controller.installPlugins](./values.yaml#L410) | list | List of Jenkins plugins to install. If you don't want to install plugins, set it to `false` | `["kubernetes:4358.vcfd9c5a_0a_f51","workflow-aggregator:608.v67378e9d3db_1","git:5.7.0","configuration-as-code:1985.vdda_32d0c4ea_b_"]` |
| [controller.javaOpts](./values.yaml#L164) | string | Append to `JAVA_OPTS` env var | `nil` |
| [controller.jenkinsAdminEmail](./values.yaml#L98) | string | Email address for the administrator of the Jenkins instance | `nil` |
| [controller.jenkinsHome](./values.yaml#L103) | string | Custom Jenkins home path | `"/var/jenkins_home"` |
| [controller.jenkinsOpts](./values.yaml#L166) | string | Append to `JENKINS_OPTS` env var | `nil` |
| [controller.jenkinsRef](./values.yaml#L108) | string | Custom Jenkins reference path | `"/usr/share/jenkins/ref"` |
| [controller.jenkinsUriPrefix](./values.yaml#L181) | string | Root URI Jenkins will be served on | `nil` |
| [controller.jenkinsUrl](./values.yaml#L176) | string | Set Jenkins URL if you are not using the ingress definitions provided by the chart | `nil` |
| [controller.jenkinsUrlProtocol](./values.yaml#L173) | string | Set protocol for Jenkins URL; `https` if `controller.ingress.tls`, `http` otherwise | `nil` |
| [controller.jenkinsWar](./values.yaml#L111) | string |  | `"/usr/share/jenkins/jenkins.war"` |
| [controller.jmxPort](./values.yaml#L400) | string | Open a port, for JMX stats | `nil` |
| [controller.legacyRemotingSecurityEnabled](./values.yaml#L376) | bool | Whether legacy remoting security should be enabled | `false` |
| [controller.lifecycle](./values.yaml#L54) | object | Lifecycle specification for controller-container | `{}` |
| [controller.loadBalancerIP](./values.yaml#L391) | string | Optionally assign a known public LB IP | `nil` |
| [controller.loadBalancerSourceRanges](./values.yaml#L387) | list | Allowed inbound IP addresses | `["0.0.0.0/0"]` |
| [controller.markupFormatter](./values.yaml#L448) | string | Yaml of the markup formatter to use | `"plainText"` |
| [controller.nodePort](./values.yaml#L234) | string | k8s node port. Only used if serviceType is NodePort | `nil` |
| [controller.nodeSelector](./values.yaml#L664) | object | Node labels for pod assignment | `{}` |
| [controller.numExecutors](./values.yaml#L65) | int | Set Number of executors | `0` |
| [controller.overwritePlugins](./values.yaml#L433) | bool | Overwrite installed plugins on start | `false` |
| [controller.overwritePluginsFromImage](./values.yaml#L437) | bool | Overwrite plugins that are already installed in the controller image | `true` |
| [controller.podAnnotations](./values.yaml#L685) | object | Annotations for controller pod | `{}` |
| [controller.podDisruptionBudget.annotations](./values.yaml#L327) | object |  | `{}` |
| [controller.podDisruptionBudget.apiVersion](./values.yaml#L325) | string | Policy API version | `"policy/v1beta1"` |
| [controller.podDisruptionBudget.enabled](./values.yaml#L320) | bool | Enable Kubernetes Pod Disruption Budget configuration | `false` |
| [controller.podDisruptionBudget.labels](./values.yaml#L328) | object |  | `{}` |
| [controller.podDisruptionBudget.maxUnavailable](./values.yaml#L330) | string | Number of pods that can be unavailable. Either an absolute number or a percentage | `"0"` |
| [controller.podLabels](./values.yaml#L256) | object | Custom Pod labels (an object with `label-key: label-value` pairs) | `{}` |
| [controller.podSecurityContextOverride](./values.yaml#L210) | string | Completely overwrites the contents of the pod security context, ignoring the values provided for `runAsUser`, `fsGroup`, and `securityContextCapabilities` | `nil` |
| [controller.priorityClassName](./values.yaml#L682) | string | The name of a `priorityClass` to apply to the controller pod | `nil` |
| [controller.probes.livenessProbe.failureThreshold](./values.yaml#L281) | int | Set the failure threshold for the liveness probe | `5` |
| [controller.probes.livenessProbe.httpGet.path](./values.yaml#L284) | string | Set the Pod's HTTP path for the liveness probe | `"{{ default \"\" .Values.controller.jenkinsUriPrefix }}/login"` |
| [controller.probes.livenessProbe.httpGet.port](./values.yaml#L286) | string | Set the Pod's HTTP port to use for the liveness probe | `"http"` |
| [controller.probes.livenessProbe.initialDelaySeconds](./values.yaml#L295) | string | Set the initial delay for the liveness probe in seconds | `nil` |
| [controller.probes.livenessProbe.periodSeconds](./values.yaml#L288) | int | Set the time interval between two liveness probes executions in seconds | `10` |
| [controller.probes.livenessProbe.timeoutSeconds](./values.yaml#L290) | int | Set the timeout for the liveness probe in seconds | `5` |
| [controller.probes.readinessProbe.failureThreshold](./values.yaml#L299) | int | Set the failure threshold for the readiness probe | `3` |
| [controller.probes.readinessProbe.httpGet.path](./values.yaml#L302) | string | Set the Pod's HTTP path for the liveness probe | `"{{ default \"\" .Values.controller.jenkinsUriPrefix }}/login"` |
| [controller.probes.readinessProbe.httpGet.port](./values.yaml#L304) | string | Set the Pod's HTTP port to use for the readiness probe | `"http"` |
| [controller.probes.readinessProbe.initialDelaySeconds](./values.yaml#L313) | string | Set the initial delay for the readiness probe in seconds | `nil` |
| [controller.probes.readinessProbe.periodSeconds](./values.yaml#L306) | int | Set the time interval between two readiness probes executions in seconds | `10` |
| [controller.probes.readinessProbe.timeoutSeconds](./values.yaml#L308) | int | Set the timeout for the readiness probe in seconds | `5` |
| [controller.probes.startupProbe.failureThreshold](./values.yaml#L268) | int | Set the failure threshold for the startup probe | `12` |
| [controller.probes.startupProbe.httpGet.path](./values.yaml#L271) | string | Set the Pod's HTTP path for the startup probe | `"{{ default \"\" .Values.controller.jenkinsUriPrefix }}/login"` |
| [controller.probes.startupProbe.httpGet.port](./values.yaml#L273) | string | Set the Pod's HTTP port to use for the startup probe | `"http"` |
| [controller.probes.startupProbe.periodSeconds](./values.yaml#L275) | int | Set the time interval between two startup probes executions in seconds | `10` |
| [controller.probes.startupProbe.timeoutSeconds](./values.yaml#L277) | int | Set the timeout for the startup probe in seconds | `5` |
| [controller.projectNamingStrategy](./values.yaml#L440) | string |  | `"standard"` |
| [controller.prometheus.alertingRulesAdditionalLabels](./values.yaml#L830) | object | Additional labels to add to the PrometheusRule object | `{}` |
| [controller.prometheus.alertingrules](./values.yaml#L828) | list | Array of prometheus alerting rules | `[]` |
| [controller.prometheus.enabled](./values.yaml#L813) | bool | Enables prometheus service monitor | `false` |
| [controller.prometheus.metricRelabelings](./values.yaml#L840) | list |  | `[]` |
| [controller.prometheus.prometheusRuleNamespace](./values.yaml#L832) | string | Set a custom namespace where to deploy PrometheusRule resource | `""` |
| [controller.prometheus.relabelings](./values.yaml#L838) | list |  | `[]` |
| [controller.prometheus.scrapeEndpoint](./values.yaml#L823) | string | The endpoint prometheus should get metrics from | `"/prometheus"` |
| [controller.prometheus.scrapeInterval](./values.yaml#L819) | string | How often prometheus should scrape metrics | `"60s"` |
| [controller.prometheus.serviceMonitorAdditionalLabels](./values.yaml#L815) | object | Additional labels to add to the service monitor object | `{}` |
| [controller.prometheus.serviceMonitorNamespace](./values.yaml#L817) | string | Set a custom namespace where to deploy ServiceMonitor resource | `nil` |
| [controller.publishNotReadyAddresses](./values.yaml#L242) | string |  | `nil` |
| [controller.resources](./values.yaml#L117) | object | Resource allocation (Requests and Limits) | `{"limits":{"cpu":"2000m","memory":"4096Mi"},"requests":{"cpu":"50m","memory":"256Mi"}}` |
| [controller.route.annotations](./values.yaml#L792) | object | Route annotations | `{}` |
| [controller.route.enabled](./values.yaml#L788) | bool | Enables openshift route | `false` |
| [controller.route.labels](./values.yaml#L790) | object | Route labels | `{}` |
| [controller.route.path](./values.yaml#L794) | string | Route path | `nil` |
| [controller.runAsUser](./values.yaml#L191) | int | Deprecated in favor of `controller.podSecurityContextOverride`. uid that jenkins runs with. | `1000` |
| [controller.schedulerName](./values.yaml#L660) | string | Name of the Kubernetes scheduler to use | `""` |
| [controller.scriptApproval](./values.yaml#L452) | list | List of groovy functions to approve | `[]` |
| [controller.secondaryingress.annotations](./values.yaml#L755) | object |  | `{}` |
| [controller.secondaryingress.apiVersion](./values.yaml#L753) | string |  | `"extensions/v1beta1"` |
| [controller.secondaryingress.enabled](./values.yaml#L747) | bool |  | `false` |
| [controller.secondaryingress.hostName](./values.yaml#L762) | string |  | `nil` |
| [controller.secondaryingress.labels](./values.yaml#L754) | object |  | `{}` |
| [controller.secondaryingress.paths](./values.yaml#L750) | list |  | `[]` |
| [controller.secondaryingress.tls](./values.yaml#L763) | string |  | `nil` |
| [controller.secretClaims](./values.yaml#L495) | list | List of `SecretClaim` resources to create | `[]` |
| [controller.securityContextCapabilities](./values.yaml#L200) | object |  | `{}` |
| [controller.serviceAnnotations](./values.yaml#L245) | object | Jenkins controller service annotations | `{}` |
| [controller.serviceEnabled](./values.yaml#L220) | bool | enable or disable the controller k8s service | `true` |
| [controller.serviceExternalTrafficPolicy](./values.yaml#L238) | string |  | `nil` |
| [controller.serviceLabels](./values.yaml#L251) | object | Labels for the Jenkins controller-service | `{}` |
| [controller.servicePort](./values.yaml#L230) | int | k8s service port | `8080` |
| [controller.serviceType](./values.yaml#L225) | string | k8s service type | `"ClusterIP"` |
| [controller.shareProcessNamespace](./values.yaml#L126) | bool |  | `false` |
| [controller.sidecars.additionalSidecarContainers](./values.yaml#L642) | list | Configures additional sidecar container(s) for the Jenkins controller | `[]` |
| [controller.sidecars.configAutoReload.additionalVolumeMounts](./values.yaml#L587) | list | Enables additional volume mounts for the config auto-reload container | `[]` |
| [controller.sidecars.configAutoReload.containerSecurityContext](./values.yaml#L637) | object | Enable container security context | `{"allowPrivilegeEscalation":false,"readOnlyRootFilesystem":true}` |
| [controller.sidecars.configAutoReload.enabled](./values.yaml#L569) | bool | Enable Jenkins Config as Code auto-reload | `true` |
| [controller.sidecars.configAutoReload.env](./values.yaml#L619) | list | Environment variables for the Jenkins Config as Code auto-reload container | `[]` |
| [controller.sidecars.configAutoReload.envFrom](./values.yaml#L617) | list | Environment variable sources for the Jenkins Config as Code auto-reload container | `[]` |
| [controller.sidecars.configAutoReload.folder](./values.yaml#L630) | string |  | `"/var/jenkins_home/casc_configs"` |
| [controller.sidecars.configAutoReload.image.registry](./values.yaml#L572) | string | Registry for the image that triggers the reload | `"docker.io"` |
| [controller.sidecars.configAutoReload.image.repository](./values.yaml#L574) | string | Repository of the image that triggers the reload | `"kiwigrid/k8s-sidecar"` |
| [controller.sidecars.configAutoReload.image.tag](./values.yaml#L576) | string | Tag for the image that triggers the reload | `"1.30.3"` |
| [controller.sidecars.configAutoReload.imagePullPolicy](./values.yaml#L577) | string |  | `"IfNotPresent"` |
| [controller.sidecars.configAutoReload.logging](./values.yaml#L594) | object | Config auto-reload logging settings | `{"configuration":{"backupCount":3,"formatter":"JSON","logLevel":"INFO","logToConsole":true,"logToFile":false,"maxBytes":1024,"override":false}}` |
| [controller.sidecars.configAutoReload.logging.configuration.override](./values.yaml#L598) | bool | Enables custom log config utilizing using the settings below. | `false` |
| [controller.sidecars.configAutoReload.reqRetryConnect](./values.yaml#L612) | int | How many connection-related errors to retry on | `10` |
| [controller.sidecars.configAutoReload.resources](./values.yaml#L578) | object |  | `{}` |
| [controller.sidecars.configAutoReload.scheme](./values.yaml#L607) | string | The scheme to use when connecting to the Jenkins configuration as code endpoint | `"http"` |
| [controller.sidecars.configAutoReload.skipTlsVerify](./values.yaml#L609) | bool | Skip TLS verification when connecting to the Jenkins configuration as code endpoint | `false` |
| [controller.sidecars.configAutoReload.sleepTime](./values.yaml#L614) | string | How many seconds to wait before updating config-maps/secrets (sets METHOD=SLEEP on the sidecar) | `nil` |
| [controller.sidecars.configAutoReload.sshTcpPort](./values.yaml#L628) | int |  | `1044` |
| [controller.statefulSetAnnotations](./values.yaml#L687) | object | Annotations for controller StatefulSet | `{}` |
| [controller.statefulSetLabels](./values.yaml#L247) | object | Jenkins controller custom labels for the StatefulSet | `{}` |
| [controller.targetPort](./values.yaml#L232) | int | k8s target port | `8080` |
| [controller.terminationGracePeriodSeconds](./values.yaml#L670) | string | Set TerminationGracePeriodSeconds | `nil` |
| [controller.terminationMessagePath](./values.yaml#L672) | string | Set the termination message path | `nil` |
| [controller.terminationMessagePolicy](./values.yaml#L674) | string | Set the termination message policy | `nil` |
| [controller.testEnabled](./values.yaml#L852) | bool | Can be used to disable rendering controller test resources when using helm template | `true` |
| [controller.tolerations](./values.yaml#L668) | list | Toleration labels for pod assignment | `[]` |
| [controller.topologySpreadConstraints](./values.yaml#L694) | object | Topology spread constraints | `{}` |
| [controller.updateStrategy](./values.yaml#L691) | object | Update strategy for StatefulSet | `{}` |
| [controller.usePodSecurityContext](./values.yaml#L184) | bool | Enable pod security context (must be `true` if podSecurityContextOverride, runAsUser or fsGroup are set) | `true` |
| [credentialsId](./values.yaml#L27) | string | The Jenkins credentials to access the Kubernetes API server. For the default cluster it is not needed. | `nil` |
| [extraLabels](./values.yaml#L33) | object | Configures extra labels for the agent all objects | `{}` |
| [fullnameOverride](./values.yaml#L13) | string | Override the full resource names | `jenkins-(release-name)` or `jenkins` if the release-name is `jenkins` |
| [helmtest.bats.image.registry](./values.yaml#L1381) | string | Registry of the image used to test the framework | `"docker.io"` |
| [helmtest.bats.image.repository](./values.yaml#L1383) | string | Repository of the image used to test the framework | `"bats/bats"` |
| [helmtest.bats.image.tag](./values.yaml#L1385) | string | Tag of the image to test the framework | `"1.12.0"` |
| [kubernetesURL](./values.yaml#L24) | string | The URL of the Kubernetes API server | `"https://kubernetes.default"` |
| [nameOverride](./values.yaml#L10) | string | Override the resource name prefix | `Chart.Name` |
| [namespaceOverride](./values.yaml#L16) | string | Override the deployment namespace | `Release.Namespace` |
| [networkPolicy.apiVersion](./values.yaml#L1304) | string | NetworkPolicy ApiVersion | `"networking.k8s.io/v1"` |
| [networkPolicy.enabled](./values.yaml#L1299) | bool | Enable the creation of NetworkPolicy resources | `false` |
| [networkPolicy.externalAgents.except](./values.yaml#L1319) | list | A list of IP sub-ranges to be excluded from the allowlisted IP range | `[]` |
| [networkPolicy.externalAgents.ipCIDR](./values.yaml#L1317) | string | The IP range from which external agents are allowed to connect to controller, i.e., 172.17.0.0/16 | `nil` |
| [networkPolicy.internalAgents.allowed](./values.yaml#L1308) | bool | Allow internal agents (from the same cluster) to connect to controller. Agent pods will be filtered based on PodLabels | `true` |
| [networkPolicy.internalAgents.namespaceLabels](./values.yaml#L1312) | object | A map of labels (keys/values) that agents namespaces must have to be able to connect to controller | `{}` |
| [networkPolicy.internalAgents.podLabels](./values.yaml#L1310) | object | A map of labels (keys/values) that agent pods must have to be able to connect to controller | `{}` |
| [persistence.accessMode](./values.yaml#L1274) | string | The PVC access mode | `"ReadWriteOnce"` |
| [persistence.annotations](./values.yaml#L1270) | object | Annotations for the PVC | `{}` |
| [persistence.dataSource](./values.yaml#L1280) | object | Existing data source to clone PVC from | `{}` |
| [persistence.enabled](./values.yaml#L1254) | bool | Enable the use of a Jenkins PVC | `true` |
| [persistence.existingClaim](./values.yaml#L1260) | string | Provide the name of a PVC | `nil` |
| [persistence.labels](./values.yaml#L1272) | object | Labels for the PVC | `{}` |
| [persistence.mounts](./values.yaml#L1292) | list | Additional mounts | `[]` |
| [persistence.size](./values.yaml#L1276) | string | The size of the PVC | `"8Gi"` |
| [persistence.storageClass](./values.yaml#L1268) | string | Storage class for the PVC | `nil` |
| [persistence.subPath](./values.yaml#L1285) | string | SubPath for jenkins-home mount | `nil` |
| [persistence.volumes](./values.yaml#L1287) | list | Additional volumes | `[]` |
| [rbac.create](./values.yaml#L1326) | bool | Whether RBAC resources are created | `true` |
| [rbac.readSecrets](./values.yaml#L1328) | bool | Whether the Jenkins service account should be able to read Kubernetes secrets | `false` |
| [rbac.useOpenShiftNonRootSCC](./values.yaml#L1330) | bool | Whether the Jenkins service account should be able to use the OpenShift "nonroot" Security Context Constraints | `false` |
| [renderHelmLabels](./values.yaml#L30) | bool | Enables rendering of the helm.sh/chart label to the annotations | `true` |
| [serviceAccount.annotations](./values.yaml#L1340) | object | Configures annotations for the ServiceAccount | `{}` |
| [serviceAccount.automountServiceAccountToken](./values.yaml#L1346) | bool | Auto-mount ServiceAccount token | `true` |
| [serviceAccount.create](./values.yaml#L1334) | bool | Configures if a ServiceAccount with this name should be created | `true` |
| [serviceAccount.extraLabels](./values.yaml#L1342) | object | Configures extra labels for the ServiceAccount | `{}` |
| [serviceAccount.imagePullSecretName](./values.yaml#L1344) | string | Controller ServiceAccount image pull secret | `nil` |
| [serviceAccount.name](./values.yaml#L1338) | string |  | `nil` |
| [serviceAccountAgent.annotations](./values.yaml#L1356) | object | Configures annotations for the agent ServiceAccount | `{}` |
| [serviceAccountAgent.automountServiceAccountToken](./values.yaml#L1362) | bool | Auto-mount ServiceAccount token | `true` |
| [serviceAccountAgent.create](./values.yaml#L1350) | bool | Configures if an agent ServiceAccount should be created | `false` |
| [serviceAccountAgent.extraLabels](./values.yaml#L1358) | object | Configures extra labels for the agent ServiceAccount | `{}` |
| [serviceAccountAgent.imagePullSecretName](./values.yaml#L1360) | string | Agent ServiceAccount image pull secret | `nil` |
| [serviceAccountAgent.name](./values.yaml#L1354) | string | The name of the agent ServiceAccount to be used by access-controlled resources | `nil` |
