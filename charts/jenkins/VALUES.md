# Jenkins

## Configuration

The following tables list the configurable parameters of the Jenkins chart and their default values.

## Values

| Key | Type | Description | Default |
|:----|:-----|:---------|:------------|
| [additionalAgents](./values.yaml#L1216) | object | Configure additional | `{}` |
| [additionalClouds](./values.yaml#L1241) | object |  | `{}` |
| [agent.TTYEnabled](./values.yaml#L1121) | bool | Allocate pseudo tty to the side container | `false` |
| [agent.additionalContainers](./values.yaml#L1169) | list | Add additional containers to the agents | `[]` |
| [agent.alwaysPullImage](./values.yaml#L1014) | bool | Always pull agent container image before build | `false` |
| [agent.annotations](./values.yaml#L1165) | object | Annotations to apply to the pod | `{}` |
| [agent.args](./values.yaml#L1115) | string | Arguments passed to command to execute | `"${computer.jnlpmac} ${computer.name}"` |
| [agent.command](./values.yaml#L1113) | string | Command to execute when side container starts | `nil` |
| [agent.componentName](./values.yaml#L982) | string |  | `"jenkins-agent"` |
| [agent.connectTimeout](./values.yaml#L1163) | int | Timeout in seconds for an agent to be online | `100` |
| [agent.containerCap](./values.yaml#L1123) | int | Max number of agents to launch for a whole cluster. | `10` |
| [agent.customJenkinsLabels](./values.yaml#L979) | list | Append Jenkins labels to the agent | `[]` |
| [agent.defaultsProviderTemplate](./values.yaml#L931) | string | The name of the pod template to use for providing default values | `""` |
| [agent.directConnection](./values.yaml#L985) | bool |  | `false` |
| [agent.disableDefaultAgent](./values.yaml#L1187) | bool | Disable the default Jenkins Agent configuration | `false` |
| [agent.enabled](./values.yaml#L929) | bool | Enable Kubernetes plugin jnlp-agent podTemplate | `true` |
| [agent.envVars](./values.yaml#L1096) | list | Environment variables for the agent Pod | `[]` |
| [agent.garbageCollection.enabled](./values.yaml#L1132) | bool | When enabled, Jenkins will periodically check for orphan pods that have not been touched for the given timeout period and delete them. | `false` |
| [agent.garbageCollection.namespaces](./values.yaml#L1134) | string | Namespaces to look at for garbage collection, in addition to the default namespace defined for the cloud. One namespace per line. | `""` |
| [agent.garbageCollection.timeout](./values.yaml#L1139) | int | Timeout value for orphaned pods | `300` |
| [agent.hostNetworking](./values.yaml#L993) | bool | Enables the agent to use the host network | `false` |
| [agent.idleMinutes](./values.yaml#L1142) | int | Allows the Pod to remain active for reuse until the configured number of minutes has passed since the last step was executed on it | `0` |
| [agent.image.registry](./values.yaml#L970) | string | Registry to pull the agent jnlp image from | `""` |
| [agent.image.repository](./values.yaml#L972) | string | Repository to pull the agent jnlp image from | `"jenkins/inbound-agent"` |
| [agent.image.tag](./values.yaml#L974) | string | Tag of the image to pull | `"3355.v388858a_47b_33-3"` |
| [agent.imagePullSecretName](./values.yaml#L981) | string | Name of the secret to be used to pull the image | `nil` |
| [agent.inheritYamlMergeStrategy](./values.yaml#L1161) | bool | Controls whether the defined yaml merge strategy will be inherited if another defined pod template is configured to inherit from the current one | `false` |
| [agent.instanceCap](./values.yaml#L1125) | int | Max number of agents to launch for this type of agent | `2147483647` |
| [agent.jenkinsTunnel](./values.yaml#L947) | string | Overrides the Kubernetes Jenkins tunnel | `nil` |
| [agent.jenkinsUrl](./values.yaml#L943) | string | Overrides the Kubernetes Jenkins URL | `nil` |
| [agent.jnlpregistry](./values.yaml#L967) | string | Custom registry used to pull the agent jnlp image from | `nil` |
| [agent.kubernetesConnectTimeout](./values.yaml#L953) | int | The connection timeout in seconds for connections to Kubernetes API. The minimum value is 5 | `5` |
| [agent.kubernetesReadTimeout](./values.yaml#L955) | int | The read timeout in seconds for connections to Kubernetes API. The minimum value is 15 | `15` |
| [agent.livenessProbe](./values.yaml#L1004) | object |  | `{}` |
| [agent.maxRequestsPerHostStr](./values.yaml#L957) | string | The maximum concurrent connections to Kubernetes API | `"32"` |
| [agent.namespace](./values.yaml#L963) | string | Namespace in which the Kubernetes agents should be launched | `nil` |
| [agent.nodeSelector](./values.yaml#L1107) | object | Node labels for pod assignment | `{}` |
| [agent.nodeUsageMode](./values.yaml#L977) | string |  | `"NORMAL"` |
| [agent.podLabels](./values.yaml#L965) | object | Custom Pod labels (an object with `label-key: label-value` pairs) | `{}` |
| [agent.podName](./values.yaml#L1127) | string | Agent Pod base name | `"default"` |
| [agent.podRetention](./values.yaml#L1023) | string |  | `"Never"` |
| [agent.podTemplates](./values.yaml#L1197) | object | Configures extra pod templates for the default kubernetes cloud | `{}` |
| [agent.privileged](./values.yaml#L987) | bool | Agent privileged container | `false` |
| [agent.resources](./values.yaml#L995) | object | Resources allocation (Requests and Limits) | `{"limits":{"cpu":"512m","memory":"512Mi"},"requests":{"cpu":"512m","memory":"512Mi"}}` |
| [agent.restrictedPssSecurityContext](./values.yaml#L1020) | bool | Set a restricted securityContext on jnlp containers | `false` |
| [agent.retentionTimeout](./values.yaml#L959) | int | Time in minutes after which the Kubernetes cloud plugin will clean up an idle worker that has not already terminated | `5` |
| [agent.runAsGroup](./values.yaml#L991) | string | Configure container group | `nil` |
| [agent.runAsUser](./values.yaml#L989) | string | Configure container user | `nil` |
| [agent.secretEnvVars](./values.yaml#L1100) | list | Mount a secret as environment variable | `[]` |
| [agent.serviceAccount](./values.yaml#L939) | string | Override the default service account | `serviceAccountAgent.name` if `agent.useDefaultServiceAccount` is `true` |
| [agent.showRawYaml](./values.yaml#L1027) | bool |  | `true` |
| [agent.sideContainerName](./values.yaml#L1117) | string | Side container name | `"jnlp"` |
| [agent.skipTlsVerify](./values.yaml#L949) | bool | Disables the verification of the controller certificate on remote connection. This flag correspond to the "Disable https certificate check" flag in kubernetes plugin UI | `false` |
| [agent.usageRestricted](./values.yaml#L951) | bool | Enable the possibility to restrict the usage of this agent to specific folder. This flag correspond to the "Restrict pipeline support to authorized folders" flag in kubernetes plugin UI | `false` |
| [agent.useDefaultServiceAccount](./values.yaml#L935) | bool | Use `serviceAccountAgent.name` as the default value for defaults template `serviceAccount` | `true` |
| [agent.volumes](./values.yaml#L1034) | list | Additional volumes | `[]` |
| [agent.waitForPodSec](./values.yaml#L961) | int | Seconds to wait for pod to be running | `600` |
| [agent.websocket](./values.yaml#L984) | bool | Enables agent communication via websockets | `false` |
| [agent.workingDir](./values.yaml#L976) | string | Configure working directory for default agent | `"/home/jenkins/agent"` |
| [agent.workspaceVolume](./values.yaml#L1069) | object | Workspace volume (defaults to EmptyDir) | `{}` |
| [agent.yamlMergeStrategy](./values.yaml#L1159) | string | Defines how the raw yaml field gets merged with yaml definitions from inherited pod templates. Possible values: "merge" or "override" | `"override"` |
| [agent.yamlTemplate](./values.yaml#L1148) | string | The raw yaml of a Pod API Object to merge into the agent spec | `""` |
| [awsSecurityGroupPolicies.enabled](./values.yaml#L1374) | bool |  | `false` |
| [awsSecurityGroupPolicies.policies[0].name](./values.yaml#L1376) | string |  | `""` |
| [awsSecurityGroupPolicies.policies[0].podSelector](./values.yaml#L1378) | object |  | `{}` |
| [awsSecurityGroupPolicies.policies[0].securityGroupIds](./values.yaml#L1377) | list |  | `[]` |
| [checkDeprecation](./values.yaml#L1371) | bool | Checks if any deprecated values are used | `true` |
| [clusterZone](./values.yaml#L21) | string | Override the cluster name for FQDN resolving | `"cluster.local"` |
| [controller.JCasC.authorizationStrategy](./values.yaml#L551) | string | Jenkins Config as Code Authorization Strategy-section | `"loggedInUsersCanDoAnything:\n  allowAnonymousRead: false"` |
| [controller.JCasC.configMapAnnotations](./values.yaml#L556) | object | Annotations for the JCasC ConfigMap | `{}` |
| [controller.JCasC.configScripts](./values.yaml#L525) | object | List of Jenkins Config as Code scripts | `{}` |
| [controller.JCasC.configUrls](./values.yaml#L522) | list | Remote URLs for configuration files. | `[]` |
| [controller.JCasC.defaultConfig](./values.yaml#L516) | bool | Enables default Jenkins configuration via configuration as code plugin | `true` |
| [controller.JCasC.overwriteConfiguration](./values.yaml#L520) | bool | Whether Jenkins Config as Code should overwrite any existing configuration | `false` |
| [controller.JCasC.security](./values.yaml#L532) | object | Jenkins Config as Code security-section | `{"apiToken":{"creationOfLegacyTokenEnabled":false,"tokenGenerationOnCreationEnabled":false,"usageStatisticsEnabled":true}}` |
| [controller.JCasC.securityRealm](./values.yaml#L540) | string | Jenkins Config as Code Security Realm-section | `"local:\n  allowsSignup: false\n  enableCaptcha: false\n  users:\n  - id: \"${chart-admin-username}\"\n    name: \"Jenkins Admin\"\n    password: \"${chart-admin-password}\""` |
| [controller.additionalExistingSecrets](./values.yaml#L477) | list | List of additional existing secrets to mount | `[]` |
| [controller.additionalPlugins](./values.yaml#L427) | list | List of plugins to install in addition to those listed in controller.installPlugins | `[]` |
| [controller.additionalSecrets](./values.yaml#L486) | list | List of additional secrets to create and mount | `[]` |
| [controller.admin.createSecret](./values.yaml#L93) | bool | Create secret for admin user | `true` |
| [controller.admin.existingSecret](./values.yaml#L96) | string | The name of an existing secret containing the admin credentials | `""` |
| [controller.admin.password](./values.yaml#L83) | string | Admin password created as a secret if `controller.admin.createSecret` is true | `<random password>` |
| [controller.admin.passwordKey](./values.yaml#L88) | string | The key in the existing admin secret containing the password | `"jenkins-admin-password"` |
| [controller.admin.userKey](./values.yaml#L86) | string | The key in the existing admin secret containing the username | `"jenkins-admin-user"` |
| [controller.admin.username](./values.yaml#L80) | string | Admin username created as a secret if `controller.admin.createSecret` is true | `"admin"` |
| [controller.affinity](./values.yaml#L680) | object | Affinity settings | `{}` |
| [controller.agentListenerEnabled](./values.yaml#L336) | bool | Create Agent listener service | `true` |
| [controller.agentListenerExternalTrafficPolicy](./values.yaml#L346) | string | Traffic Policy of for the agentListener service | `nil` |
| [controller.agentListenerHostPort](./values.yaml#L340) | string | Host port to listen for agents | `nil` |
| [controller.agentListenerLoadBalancerIP](./values.yaml#L376) | string | Static IP for the agentListener LoadBalancer | `nil` |
| [controller.agentListenerLoadBalancerSourceRanges](./values.yaml#L348) | list | Allowed inbound IP for the agentListener service | `["0.0.0.0/0"]` |
| [controller.agentListenerNodePort](./values.yaml#L342) | string | Node port to listen for agents | `nil` |
| [controller.agentListenerPort](./values.yaml#L338) | int | Listening port for agents | `50000` |
| [controller.agentListenerServiceAnnotations](./values.yaml#L371) | object | Annotations for the agentListener service | `{}` |
| [controller.agentListenerServiceType](./values.yaml#L368) | string | Defines how to expose the agentListener service | `"ClusterIP"` |
| [controller.backendconfig.annotations](./values.yaml#L787) | object | backendconfig annotations | `{}` |
| [controller.backendconfig.apiVersion](./values.yaml#L781) | string | backendconfig API version | `"extensions/v1beta1"` |
| [controller.backendconfig.enabled](./values.yaml#L779) | bool | Enables backendconfig | `false` |
| [controller.backendconfig.labels](./values.yaml#L785) | object | backendconfig labels | `{}` |
| [controller.backendconfig.name](./values.yaml#L783) | string | backendconfig name | `nil` |
| [controller.backendconfig.spec](./values.yaml#L789) | object | backendconfig spec | `{}` |
| [controller.cloudName](./values.yaml#L505) | string | Name of default cloud configuration. | `"kubernetes"` |
| [controller.clusterIp](./values.yaml#L231) | string | k8s service clusterIP. Only used if serviceType is ClusterIP | `nil` |
| [controller.componentName](./values.yaml#L37) | string | Used for label app.kubernetes.io/component | `"jenkins-controller"` |
| [controller.containerEnv](./values.yaml#L158) | list | Environment variables for Jenkins Container | `[]` |
| [controller.containerEnvFrom](./values.yaml#L155) | list | Environment variable sources for Jenkins Container | `[]` |
| [controller.containerSecurityContext](./values.yaml#L216) | object | Allow controlling the securityContext for the jenkins container | `{"allowPrivilegeEscalation":false,"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsUser":1000}` |
| [controller.csrf.defaultCrumbIssuer.enabled](./values.yaml#L357) | bool | Enable the default CSRF Crumb issuer | `true` |
| [controller.csrf.defaultCrumbIssuer.proxyCompatability](./values.yaml#L359) | bool | Enable proxy compatibility. This setting is ignored if you are not on the current LTS release and will be dropped with the next LTS. | `true` |
| [controller.customInitContainers](./values.yaml#L559) | list | Custom init-container specification in raw-yaml format | `[]` |
| [controller.customJenkinsLabels](./values.yaml#L71) | list | Append Jenkins labels to the controller | `[]` |
| [controller.disableRememberMe](./values.yaml#L62) | bool | Disable use of remember me | `false` |
| [controller.disabledAgentProtocols](./values.yaml#L351) | list | Disabled agent protocols | `["JNLP-connect","JNLP2-connect"]` |
| [controller.dnsConfig](./values.yaml#L700) | object | DNS config for the pod | `{}` |
| [controller.enableRawHtmlMarkupFormatter](./values.yaml#L447) | bool | Enable HTML parsing using OWASP Markup Formatter Plugin (antisamy-markup-formatter) | `false` |
| [controller.enableServiceLinks](./values.yaml#L132) | bool |  | `false` |
| [controller.executorMode](./values.yaml#L68) | string | Sets the executor mode of the Jenkins node. Possible values are "NORMAL" or "EXCLUSIVE" | `"NORMAL"` |
| [controller.existingSecret](./values.yaml#L474) | string |  | `nil` |
| [controller.extraPorts](./values.yaml#L406) | list | Optionally configure other ports to expose in the controller container | `[]` |
| [controller.fsGroup](./values.yaml#L194) | int | Deprecated in favor of `controller.podSecurityContextOverride`. uid that will be used for persistent volume. | `1000` |
| [controller.fsGroupChangePolicy](./values.yaml#L197) | string |  | `"OnRootMismatch"` |
| [controller.googlePodMonitor.enabled](./values.yaml#L850) | bool |  | `false` |
| [controller.googlePodMonitor.scrapeEndpoint](./values.yaml#L855) | string |  | `"/prometheus"` |
| [controller.googlePodMonitor.scrapeInterval](./values.yaml#L853) | string |  | `"60s"` |
| [controller.healthProbes](./values.yaml#L266) | bool | Enable Kubernetes Probes configuration configured in `controller.probes` | `true` |
| [controller.hostAliases](./values.yaml#L803) | list | Allows for adding entries to Pod /etc/hosts | `[]` |
| [controller.hostNetworking](./values.yaml#L73) | bool |  | `false` |
| [controller.httpsKeyStore.disableSecretMount](./values.yaml#L871) | bool |  | `false` |
| [controller.httpsKeyStore.enable](./values.yaml#L862) | bool | Enables HTTPS keystore on jenkins controller | `false` |
| [controller.httpsKeyStore.fileName](./values.yaml#L879) | string | Jenkins keystore filename which will appear under controller.httpsKeyStore.path | `"keystore.jks"` |
| [controller.httpsKeyStore.httpPort](./values.yaml#L875) | int | HTTP Port that Jenkins should listen to along with HTTPS, it also serves as the liveness and readiness probes port. | `8081` |
| [controller.httpsKeyStore.jenkinsHttpsJksPasswordSecretKey](./values.yaml#L870) | string | Name of the key in the secret that contains the JKS password | `"https-jks-password"` |
| [controller.httpsKeyStore.jenkinsHttpsJksPasswordSecretName](./values.yaml#L868) | string | Name of the secret that contains the JKS password, if it is not in the same secret as the JKS file | `""` |
| [controller.httpsKeyStore.jenkinsHttpsJksSecretKey](./values.yaml#L866) | string | Name of the key in the secret that already has SSL keystore | `"jenkins-jks-file"` |
| [controller.httpsKeyStore.jenkinsHttpsJksSecretName](./values.yaml#L864) | string | Name of the secret that already has SSL keystore | `""` |
| [controller.httpsKeyStore.jenkinsKeyStoreBase64Encoded](./values.yaml#L884) | string | Base64 encoded Keystore content. Keystore must be converted to base64 then being pasted here | `nil` |
| [controller.httpsKeyStore.password](./values.yaml#L881) | string | Jenkins keystore password | `"password"` |
| [controller.httpsKeyStore.path](./values.yaml#L877) | string | Path of HTTPS keystore file | `"/var/jenkins_keystore"` |
| [controller.image.pullPolicy](./values.yaml#L50) | string | Controller image pull policy | `"Always"` |
| [controller.image.registry](./values.yaml#L40) | string | Controller image registry | `"docker.io"` |
| [controller.image.repository](./values.yaml#L42) | string | Controller image repository | `"jenkins/jenkins"` |
| [controller.image.tag](./values.yaml#L45) | string | Controller image tag override; i.e., tag: "2.440.1-jdk21" | `nil` |
| [controller.image.tagLabel](./values.yaml#L48) | string | Controller image tag label | `"jdk21"` |
| [controller.imagePullSecretName](./values.yaml#L52) | string | Controller image pull secret | `nil` |
| [controller.ingress.annotations](./values.yaml#L725) | object | Ingress annotations | `{}` |
| [controller.ingress.apiVersion](./values.yaml#L721) | string | Ingress API version | `"extensions/v1beta1"` |
| [controller.ingress.enabled](./values.yaml#L704) | bool | Enables ingress | `false` |
| [controller.ingress.hostName](./values.yaml#L739) | string | Ingress hostname | `nil` |
| [controller.ingress.labels](./values.yaml#L723) | object | Ingress labels | `{}` |
| [controller.ingress.path](./values.yaml#L735) | string | Ingress path | `nil` |
| [controller.ingress.paths](./values.yaml#L708) | list | Override for the default Ingress paths | `[]` |
| [controller.ingress.resourceRootUrl](./values.yaml#L741) | string | Hostname to serve assets from | `nil` |
| [controller.ingress.tls](./values.yaml#L743) | list | Ingress TLS configuration | `[]` |
| [controller.initConfigMap](./values.yaml#L464) | string | Name of the existing ConfigMap that contains init scripts | `nil` |
| [controller.initContainerEnv](./values.yaml#L149) | list | Environment variables for Init Container | `[]` |
| [controller.initContainerEnvFrom](./values.yaml#L145) | list | Environment variable sources for Init Container | `[]` |
| [controller.initContainerResources](./values.yaml#L136) | object | Resources allocation (Requests and Limits) for Init Container | `{}` |
| [controller.initScripts](./values.yaml#L460) | object | Map of groovy init scripts to be executed during Jenkins controller start | `{}` |
| [controller.initializeOnce](./values.yaml#L432) | bool | Initialize only on first installation. Ensures plugins do not get updated inadvertently. Requires `persistence.enabled` to be set to `true` | `false` |
| [controller.installLatestPlugins](./values.yaml#L421) | bool | Download the minimum required version or latest version of all dependencies | `true` |
| [controller.installLatestSpecifiedPlugins](./values.yaml#L424) | bool | Set to true to download the latest version of any plugin that is requested to have the latest version | `false` |
| [controller.installPlugins](./values.yaml#L413) | list | List of Jenkins plugins to install. If you don't want to install plugins, set it to `false` | `["kubernetes:4398.vb_b_33d9e7fe23","workflow-aggregator:608.v67378e9d3db_1","git:5.8.1","configuration-as-code:2006.v001a_2ca_6b_574"]` |
| [controller.javaOpts](./values.yaml#L164) | string | Append to `JAVA_OPTS` env var | `nil` |
| [controller.jenkinsAdminEmail](./values.yaml#L98) | string | Email address for the administrator of the Jenkins instance | `nil` |
| [controller.jenkinsHome](./values.yaml#L103) | string | Custom Jenkins home path | `"/var/jenkins_home"` |
| [controller.jenkinsOpts](./values.yaml#L166) | string | Append to `JENKINS_OPTS` env var | `nil` |
| [controller.jenkinsRef](./values.yaml#L108) | string | Custom Jenkins reference path | `"/usr/share/jenkins/ref"` |
| [controller.jenkinsUriPrefix](./values.yaml#L181) | string | Root URI Jenkins will be served on | `nil` |
| [controller.jenkinsUrl](./values.yaml#L176) | string | Set Jenkins URL if you are not using the ingress definitions provided by the chart | `nil` |
| [controller.jenkinsUrlProtocol](./values.yaml#L173) | string | Set protocol for Jenkins URL; `https` if `controller.ingress.tls`, `http` otherwise | `nil` |
| [controller.jenkinsWar](./values.yaml#L111) | string |  | `"/usr/share/jenkins/jenkins.war"` |
| [controller.jmxPort](./values.yaml#L403) | string | Open a port, for JMX stats | `nil` |
| [controller.legacyRemotingSecurityEnabled](./values.yaml#L379) | bool | Whether legacy remoting security should be enabled | `false` |
| [controller.lifecycle](./values.yaml#L54) | object | Lifecycle specification for controller-container | `{}` |
| [controller.loadBalancerIP](./values.yaml#L394) | string | Optionally assign a known public LB IP | `nil` |
| [controller.loadBalancerSourceRanges](./values.yaml#L390) | list | Allowed inbound IP addresses | `["0.0.0.0/0"]` |
| [controller.markupFormatter](./values.yaml#L451) | string | Yaml of the markup formatter to use | `"plainText"` |
| [controller.nodePort](./values.yaml#L237) | string | k8s node port. Only used if serviceType is NodePort | `nil` |
| [controller.nodeSelector](./values.yaml#L667) | object | Node labels for pod assignment | `{}` |
| [controller.numExecutors](./values.yaml#L65) | int | Set Number of executors | `0` |
| [controller.overwritePlugins](./values.yaml#L436) | bool | Overwrite installed plugins on start | `false` |
| [controller.overwritePluginsFromImage](./values.yaml#L440) | bool | Overwrite plugins that are already installed in the controller image | `true` |
| [controller.podAnnotations](./values.yaml#L688) | object | Annotations for controller pod | `{}` |
| [controller.podDisruptionBudget.annotations](./values.yaml#L330) | object |  | `{}` |
| [controller.podDisruptionBudget.apiVersion](./values.yaml#L328) | string | Policy API version | `"policy/v1beta1"` |
| [controller.podDisruptionBudget.enabled](./values.yaml#L323) | bool | Enable Kubernetes Pod Disruption Budget configuration | `false` |
| [controller.podDisruptionBudget.labels](./values.yaml#L331) | object |  | `{}` |
| [controller.podDisruptionBudget.maxUnavailable](./values.yaml#L333) | string | Number of pods that can be unavailable. Either an absolute number or a percentage | `"0"` |
| [controller.podLabels](./values.yaml#L259) | object | Custom Pod labels (an object with `label-key: label-value` pairs) | `{}` |
| [controller.podSecurityContextOverride](./values.yaml#L213) | string | Completely overwrites the contents of the pod security context, ignoring the values provided for `runAsUser`, `fsGroup`, and `securityContextCapabilities` | `nil` |
| [controller.priorityClassName](./values.yaml#L685) | string | The name of a `priorityClass` to apply to the controller pod | `nil` |
| [controller.probes.livenessProbe.failureThreshold](./values.yaml#L284) | int | Set the failure threshold for the liveness probe | `5` |
| [controller.probes.livenessProbe.httpGet.path](./values.yaml#L287) | string | Set the Pod's HTTP path for the liveness probe | `"{{ default \"\" .Values.controller.jenkinsUriPrefix }}/login"` |
| [controller.probes.livenessProbe.httpGet.port](./values.yaml#L289) | string | Set the Pod's HTTP port to use for the liveness probe | `"http"` |
| [controller.probes.livenessProbe.initialDelaySeconds](./values.yaml#L298) | string | Set the initial delay for the liveness probe in seconds | `nil` |
| [controller.probes.livenessProbe.periodSeconds](./values.yaml#L291) | int | Set the time interval between two liveness probes executions in seconds | `10` |
| [controller.probes.livenessProbe.timeoutSeconds](./values.yaml#L293) | int | Set the timeout for the liveness probe in seconds | `5` |
| [controller.probes.readinessProbe.failureThreshold](./values.yaml#L302) | int | Set the failure threshold for the readiness probe | `3` |
| [controller.probes.readinessProbe.httpGet.path](./values.yaml#L305) | string | Set the Pod's HTTP path for the liveness probe | `"{{ default \"\" .Values.controller.jenkinsUriPrefix }}/login"` |
| [controller.probes.readinessProbe.httpGet.port](./values.yaml#L307) | string | Set the Pod's HTTP port to use for the readiness probe | `"http"` |
| [controller.probes.readinessProbe.initialDelaySeconds](./values.yaml#L316) | string | Set the initial delay for the readiness probe in seconds | `nil` |
| [controller.probes.readinessProbe.periodSeconds](./values.yaml#L309) | int | Set the time interval between two readiness probes executions in seconds | `10` |
| [controller.probes.readinessProbe.timeoutSeconds](./values.yaml#L311) | int | Set the timeout for the readiness probe in seconds | `5` |
| [controller.probes.startupProbe.failureThreshold](./values.yaml#L271) | int | Set the failure threshold for the startup probe | `12` |
| [controller.probes.startupProbe.httpGet.path](./values.yaml#L274) | string | Set the Pod's HTTP path for the startup probe | `"{{ default \"\" .Values.controller.jenkinsUriPrefix }}/login"` |
| [controller.probes.startupProbe.httpGet.port](./values.yaml#L276) | string | Set the Pod's HTTP port to use for the startup probe | `"http"` |
| [controller.probes.startupProbe.periodSeconds](./values.yaml#L278) | int | Set the time interval between two startup probes executions in seconds | `10` |
| [controller.probes.startupProbe.timeoutSeconds](./values.yaml#L280) | int | Set the timeout for the startup probe in seconds | `5` |
| [controller.projectNamingStrategy](./values.yaml#L443) | string |  | `"standard"` |
| [controller.prometheus.alertingRulesAdditionalLabels](./values.yaml#L836) | object | Additional labels to add to the PrometheusRule object | `{}` |
| [controller.prometheus.alertingrules](./values.yaml#L834) | list | Array of prometheus alerting rules | `[]` |
| [controller.prometheus.enabled](./values.yaml#L819) | bool | Enables prometheus service monitor | `false` |
| [controller.prometheus.metricRelabelings](./values.yaml#L846) | list |  | `[]` |
| [controller.prometheus.prometheusRuleNamespace](./values.yaml#L838) | string | Set a custom namespace where to deploy PrometheusRule resource | `""` |
| [controller.prometheus.relabelings](./values.yaml#L844) | list |  | `[]` |
| [controller.prometheus.scrapeEndpoint](./values.yaml#L829) | string | The endpoint prometheus should get metrics from | `"/prometheus"` |
| [controller.prometheus.scrapeInterval](./values.yaml#L825) | string | How often prometheus should scrape metrics | `"60s"` |
| [controller.prometheus.serviceMonitorAdditionalLabels](./values.yaml#L821) | object | Additional labels to add to the service monitor object | `{}` |
| [controller.prometheus.serviceMonitorNamespace](./values.yaml#L823) | string | Set a custom namespace where to deploy ServiceMonitor resource | `nil` |
| [controller.publishNotReadyAddresses](./values.yaml#L245) | string |  | `nil` |
| [controller.resources](./values.yaml#L117) | object | Resource allocation (Requests and Limits) | `{"limits":{"cpu":"2000m","memory":"4096Mi"},"requests":{"cpu":"50m","memory":"256Mi"}}` |
| [controller.route.annotations](./values.yaml#L798) | object | Route annotations | `{}` |
| [controller.route.enabled](./values.yaml#L794) | bool | Enables openshift route | `false` |
| [controller.route.labels](./values.yaml#L796) | object | Route labels | `{}` |
| [controller.route.path](./values.yaml#L800) | string | Route path | `nil` |
| [controller.runAsUser](./values.yaml#L191) | int | Deprecated in favor of `controller.podSecurityContextOverride`. uid that jenkins runs with. | `1000` |
| [controller.schedulerName](./values.yaml#L663) | string | Name of the Kubernetes scheduler to use | `""` |
| [controller.scriptApproval](./values.yaml#L455) | list | List of groovy functions to approve | `[]` |
| [controller.secondaryingress.annotations](./values.yaml#L761) | object |  | `{}` |
| [controller.secondaryingress.apiVersion](./values.yaml#L759) | string |  | `"extensions/v1beta1"` |
| [controller.secondaryingress.enabled](./values.yaml#L753) | bool |  | `false` |
| [controller.secondaryingress.hostName](./values.yaml#L768) | string |  | `nil` |
| [controller.secondaryingress.labels](./values.yaml#L760) | object |  | `{}` |
| [controller.secondaryingress.paths](./values.yaml#L756) | list |  | `[]` |
| [controller.secondaryingress.tls](./values.yaml#L769) | string |  | `nil` |
| [controller.secretClaims](./values.yaml#L498) | list | List of `SecretClaim` resources to create | `[]` |
| [controller.securityContextCapabilities](./values.yaml#L203) | object |  | `{}` |
| [controller.serviceAnnotations](./values.yaml#L248) | object | Jenkins controller service annotations | `{}` |
| [controller.serviceEnabled](./values.yaml#L223) | bool | enable or disable the controller k8s service | `true` |
| [controller.serviceExternalTrafficPolicy](./values.yaml#L241) | string |  | `nil` |
| [controller.serviceLabels](./values.yaml#L254) | object | Labels for the Jenkins controller-service | `{}` |
| [controller.servicePort](./values.yaml#L233) | int | k8s service port | `8080` |
| [controller.serviceType](./values.yaml#L228) | string | k8s service type | `"ClusterIP"` |
| [controller.shareProcessNamespace](./values.yaml#L126) | bool |  | `false` |
| [controller.sidecars.additionalSidecarContainers](./values.yaml#L645) | list | Configures additional sidecar container(s) for the Jenkins controller | `[]` |
| [controller.sidecars.configAutoReload.additionalVolumeMounts](./values.yaml#L590) | list | Enables additional volume mounts for the config auto-reload container | `[]` |
| [controller.sidecars.configAutoReload.containerSecurityContext](./values.yaml#L640) | object | Enable container security context | `{"allowPrivilegeEscalation":false,"readOnlyRootFilesystem":true}` |
| [controller.sidecars.configAutoReload.enabled](./values.yaml#L572) | bool | Enable Jenkins Config as Code auto-reload | `true` |
| [controller.sidecars.configAutoReload.env](./values.yaml#L622) | list | Environment variables for the Jenkins Config as Code auto-reload container | `[]` |
| [controller.sidecars.configAutoReload.envFrom](./values.yaml#L620) | list | Environment variable sources for the Jenkins Config as Code auto-reload container | `[]` |
| [controller.sidecars.configAutoReload.folder](./values.yaml#L633) | string |  | `"/var/jenkins_home/casc_configs"` |
| [controller.sidecars.configAutoReload.image.registry](./values.yaml#L575) | string | Registry for the image that triggers the reload | `"docker.io"` |
| [controller.sidecars.configAutoReload.image.repository](./values.yaml#L577) | string | Repository of the image that triggers the reload | `"kiwigrid/k8s-sidecar"` |
| [controller.sidecars.configAutoReload.image.tag](./values.yaml#L579) | string | Tag for the image that triggers the reload | `"1.30.7"` |
| [controller.sidecars.configAutoReload.imagePullPolicy](./values.yaml#L580) | string |  | `"IfNotPresent"` |
| [controller.sidecars.configAutoReload.logging](./values.yaml#L597) | object | Config auto-reload logging settings | `{"configuration":{"backupCount":3,"formatter":"JSON","logLevel":"INFO","logToConsole":true,"logToFile":false,"maxBytes":1024,"override":false}}` |
| [controller.sidecars.configAutoReload.logging.configuration.override](./values.yaml#L601) | bool | Enables custom log config utilizing using the settings below. | `false` |
| [controller.sidecars.configAutoReload.reqRetryConnect](./values.yaml#L615) | int | How many connection-related errors to retry on | `10` |
| [controller.sidecars.configAutoReload.resources](./values.yaml#L581) | object |  | `{}` |
| [controller.sidecars.configAutoReload.scheme](./values.yaml#L610) | string | The scheme to use when connecting to the Jenkins configuration as code endpoint | `"http"` |
| [controller.sidecars.configAutoReload.skipTlsVerify](./values.yaml#L612) | bool | Skip TLS verification when connecting to the Jenkins configuration as code endpoint | `false` |
| [controller.sidecars.configAutoReload.sleepTime](./values.yaml#L617) | string | How many seconds to wait before updating config-maps/secrets (sets METHOD=SLEEP on the sidecar) | `nil` |
| [controller.sidecars.configAutoReload.sshTcpPort](./values.yaml#L631) | int |  | `1044` |
| [controller.statefulSetAnnotations](./values.yaml#L690) | object | Annotations for controller StatefulSet | `{}` |
| [controller.statefulSetLabels](./values.yaml#L250) | object | Jenkins controller custom labels for the StatefulSet | `{}` |
| [controller.targetPort](./values.yaml#L235) | int | k8s target port | `8080` |
| [controller.terminationGracePeriodSeconds](./values.yaml#L673) | string | Set TerminationGracePeriodSeconds | `nil` |
| [controller.terminationMessagePath](./values.yaml#L675) | string | Set the termination message path | `nil` |
| [controller.terminationMessagePolicy](./values.yaml#L677) | string | Set the termination message policy | `nil` |
| [controller.testEnabled](./values.yaml#L858) | bool | Can be used to disable rendering controller test resources when using helm template | `true` |
| [controller.tolerations](./values.yaml#L671) | list | Toleration labels for pod assignment | `[]` |
| [controller.topologySpreadConstraints](./values.yaml#L697) | object | Topology spread constraints | `{}` |
| [controller.updateStrategy](./values.yaml#L694) | object | Update strategy for StatefulSet | `{}` |
| [controller.usePodSecurityContext](./values.yaml#L184) | bool | Enable pod security context (must be `true` if podSecurityContextOverride, runAsUser or fsGroup are set) | `true` |
| [credentialsId](./values.yaml#L27) | string | The Jenkins credentials to access the Kubernetes API server. For the default cluster it is not needed. | `nil` |
| [extraLabels](./values.yaml#L33) | object | Configures extra labels for the agent all objects | `{}` |
| [fullnameOverride](./values.yaml#L13) | string | Override the full resource names | `jenkins-(release-name)` or `jenkins` if the release-name is `jenkins` |
| [helmtest.bats.image.registry](./values.yaml#L1387) | string | Registry of the image used to test the framework | `"docker.io"` |
| [helmtest.bats.image.repository](./values.yaml#L1389) | string | Repository of the image used to test the framework | `"bats/bats"` |
| [helmtest.bats.image.tag](./values.yaml#L1391) | string | Tag of the image to test the framework | `"1.13.0"` |
| [kubernetesURL](./values.yaml#L24) | string | The URL of the Kubernetes API server | `"https://kubernetes.default"` |
| [nameOverride](./values.yaml#L10) | string | Override the resource name prefix | `Chart.Name` |
| [namespaceOverride](./values.yaml#L16) | string | Override the deployment namespace | `Release.Namespace` |
| [networkPolicy.apiVersion](./values.yaml#L1310) | string | NetworkPolicy ApiVersion | `"networking.k8s.io/v1"` |
| [networkPolicy.enabled](./values.yaml#L1305) | bool | Enable the creation of NetworkPolicy resources | `false` |
| [networkPolicy.externalAgents.except](./values.yaml#L1325) | list | A list of IP sub-ranges to be excluded from the allowlisted IP range | `[]` |
| [networkPolicy.externalAgents.ipCIDR](./values.yaml#L1323) | string | The IP range from which external agents are allowed to connect to controller, i.e., 172.17.0.0/16 | `nil` |
| [networkPolicy.internalAgents.allowed](./values.yaml#L1314) | bool | Allow internal agents (from the same cluster) to connect to controller. Agent pods will be filtered based on PodLabels | `true` |
| [networkPolicy.internalAgents.namespaceLabels](./values.yaml#L1318) | object | A map of labels (keys/values) that agents namespaces must have to be able to connect to controller | `{}` |
| [networkPolicy.internalAgents.podLabels](./values.yaml#L1316) | object | A map of labels (keys/values) that agent pods must have to be able to connect to controller | `{}` |
| [persistence.accessMode](./values.yaml#L1280) | string | The PVC access mode | `"ReadWriteOnce"` |
| [persistence.annotations](./values.yaml#L1276) | object | Annotations for the PVC | `{}` |
| [persistence.dataSource](./values.yaml#L1286) | object | Existing data source to clone PVC from | `{}` |
| [persistence.enabled](./values.yaml#L1260) | bool | Enable the use of a Jenkins PVC | `true` |
| [persistence.existingClaim](./values.yaml#L1266) | string | Provide the name of a PVC | `nil` |
| [persistence.labels](./values.yaml#L1278) | object | Labels for the PVC | `{}` |
| [persistence.mounts](./values.yaml#L1298) | list | Additional mounts | `[]` |
| [persistence.size](./values.yaml#L1282) | string | The size of the PVC | `"8Gi"` |
| [persistence.storageClass](./values.yaml#L1274) | string | Storage class for the PVC | `nil` |
| [persistence.subPath](./values.yaml#L1291) | string | SubPath for jenkins-home mount | `nil` |
| [persistence.volumes](./values.yaml#L1293) | list | Additional volumes | `[]` |
| [rbac.create](./values.yaml#L1332) | bool | Whether RBAC resources are created | `true` |
| [rbac.readSecrets](./values.yaml#L1334) | bool | Whether the Jenkins service account should be able to read Kubernetes secrets | `false` |
| [rbac.useOpenShiftNonRootSCC](./values.yaml#L1336) | bool | Whether the Jenkins service account should be able to use the OpenShift "nonroot" Security Context Constraints | `false` |
| [renderHelmLabels](./values.yaml#L30) | bool | Enables rendering of the helm.sh/chart label to the annotations | `true` |
| [serviceAccount.annotations](./values.yaml#L1346) | object | Configures annotations for the ServiceAccount | `{}` |
| [serviceAccount.automountServiceAccountToken](./values.yaml#L1352) | bool | Auto-mount ServiceAccount token | `true` |
| [serviceAccount.create](./values.yaml#L1340) | bool | Configures if a ServiceAccount with this name should be created | `true` |
| [serviceAccount.extraLabels](./values.yaml#L1348) | object | Configures extra labels for the ServiceAccount | `{}` |
| [serviceAccount.imagePullSecretName](./values.yaml#L1350) | string | Controller ServiceAccount image pull secret | `nil` |
| [serviceAccount.name](./values.yaml#L1344) | string |  | `nil` |
| [serviceAccountAgent.annotations](./values.yaml#L1362) | object | Configures annotations for the agent ServiceAccount | `{}` |
| [serviceAccountAgent.automountServiceAccountToken](./values.yaml#L1368) | bool | Auto-mount ServiceAccount token | `true` |
| [serviceAccountAgent.create](./values.yaml#L1356) | bool | Configures if an agent ServiceAccount should be created | `false` |
| [serviceAccountAgent.extraLabels](./values.yaml#L1364) | object | Configures extra labels for the agent ServiceAccount | `{}` |
| [serviceAccountAgent.imagePullSecretName](./values.yaml#L1366) | string | Agent ServiceAccount image pull secret | `nil` |
| [serviceAccountAgent.name](./values.yaml#L1360) | string | The name of the agent ServiceAccount to be used by access-controlled resources | `nil` |
