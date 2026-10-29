# Jenkins

## Configuration

The following tables list the configurable parameters of the Jenkins chart and their default values.

## Values

| Key | Type | Description | Default |
|:----|:-----|:---------|:------------|
| [additionalAgents](./values.yaml#L1282) | object | Configure additional | `{}` |
| [additionalClouds](./values.yaml#L1308) | object |  | `{}` |
| [agent.TTYEnabled](./values.yaml#L1187) | bool | Allocate pseudo tty to the side container | `false` |
| [agent.addMasterProxyEnvVars](./values.yaml#L992) | bool | Add the environment proxy settings form jenkins controller to the agents. | `false` |
| [agent.additionalContainers](./values.yaml#L1235) | list | Add additional containers to the agents | `[]` |
| [agent.alwaysPullImage](./values.yaml#L1080) | bool | Always pull agent container image before build | `false` |
| [agent.annotations](./values.yaml#L1231) | object | Annotations to apply to the pod | `{}` |
| [agent.args](./values.yaml#L1181) | string | Arguments passed to command to execute | `"${computer.jnlpmac} ${computer.name}"` |
| [agent.command](./values.yaml#L1179) | string | Command to execute when side container starts | `nil` |
| [agent.componentName](./values.yaml#L1048) | string |  | `"jenkins-agent"` |
| [agent.connectTimeout](./values.yaml#L1229) | int | Timeout in seconds for an agent to be online | `100` |
| [agent.containerCap](./values.yaml#L1189) | int | Max number of agents to launch for a whole cluster. | `10` |
| [agent.customJenkinsLabels](./values.yaml#L1045) | list | Append Jenkins labels to the agent | `[]` |
| [agent.defaultsProviderTemplate](./values.yaml#L997) | string | The name of the pod template to use for providing default values | `""` |
| [agent.directConnection](./values.yaml#L1051) | bool |  | `false` |
| [agent.disableDefaultAgent](./values.yaml#L1253) | bool | Disable the default Jenkins Agent configuration | `false` |
| [agent.enabled](./values.yaml#L995) | bool | Enable Kubernetes plugin jnlp-agent podTemplate | `true` |
| [agent.envVars](./values.yaml#L1162) | list | Environment variables for the agent Pod | `[]` |
| [agent.garbageCollection.enabled](./values.yaml#L1198) | bool | When enabled, Jenkins will periodically check for orphan pods that have not been touched for the given timeout period and delete them. | `false` |
| [agent.garbageCollection.namespaces](./values.yaml#L1200) | string | Namespaces to look at for garbage collection, in addition to the default namespace defined for the cloud. One namespace per line. | `""` |
| [agent.garbageCollection.timeout](./values.yaml#L1205) | int | Timeout value for orphaned pods | `300` |
| [agent.hostNetworking](./values.yaml#L1059) | bool | Enables the agent to use the host network | `false` |
| [agent.idleMinutes](./values.yaml#L1208) | int | Allows the Pod to remain active for reuse until the configured number of minutes has passed since the last step was executed on it | `0` |
| [agent.image.registry](./values.yaml#L1036) | string | Registry to pull the agent jnlp image from | `""` |
| [agent.image.repository](./values.yaml#L1038) | string | Repository to pull the agent jnlp image from | `"jenkins/inbound-agent"` |
| [agent.image.tag](./values.yaml#L1040) | string | Tag of the image to pull | `"3395.v6e5377b_0fb_3c-2-jdk25"` |
| [agent.imagePullSecretName](./values.yaml#L1047) | string | Name of the secret to be used to pull the image | `nil` |
| [agent.inheritYamlMergeStrategy](./values.yaml#L1227) | bool | Controls whether the defined yaml merge strategy will be inherited if another defined pod template is configured to inherit from the current one | `false` |
| [agent.instanceCap](./values.yaml#L1191) | int | Max number of agents to launch for this type of agent | `2147483647` |
| [agent.jenkinsTunnel](./values.yaml#L1013) | string | Overrides the Kubernetes Jenkins tunnel | `nil` |
| [agent.jenkinsUrl](./values.yaml#L1009) | string | Overrides the Kubernetes Jenkins URL | `nil` |
| [agent.jnlpregistry](./values.yaml#L1033) | string | Custom registry used to pull the agent jnlp image from | `nil` |
| [agent.kubernetesConnectTimeout](./values.yaml#L1019) | int | The connection timeout in seconds for connections to Kubernetes API. The minimum value is 5 | `5` |
| [agent.kubernetesReadTimeout](./values.yaml#L1021) | int | The read timeout in seconds for connections to Kubernetes API. The minimum value is 15 | `15` |
| [agent.livenessProbe](./values.yaml#L1070) | object |  | `{}` |
| [agent.maxRequestsPerHostStr](./values.yaml#L1023) | string | The maximum concurrent connections to Kubernetes API | `"32"` |
| [agent.namespace](./values.yaml#L1029) | string | Namespace in which the Kubernetes agents should be launched | `nil` |
| [agent.nodeSelector](./values.yaml#L1173) | object | Node labels for pod assignment | `{}` |
| [agent.nodeUsageMode](./values.yaml#L1043) | string |  | `"NORMAL"` |
| [agent.podLabels](./values.yaml#L1031) | object | Custom Pod labels (an object with `label-key: label-value` pairs) | `{}` |
| [agent.podName](./values.yaml#L1193) | string | Agent Pod base name | `"default"` |
| [agent.podRetention](./values.yaml#L1089) | string |  | `"Never"` |
| [agent.podTemplates](./values.yaml#L1263) | object | Configures extra pod templates for the default kubernetes cloud | `{}` |
| [agent.privileged](./values.yaml#L1053) | bool | Agent privileged container | `false` |
| [agent.resources](./values.yaml#L1061) | object | Resources allocation (Requests and Limits) | `{"limits":{"cpu":"512m","memory":"512Mi"},"requests":{"cpu":"512m","memory":"512Mi"}}` |
| [agent.restrictedPssSecurityContext](./values.yaml#L1086) | bool | Set a restricted securityContext on jnlp containers | `false` |
| [agent.retentionTimeout](./values.yaml#L1025) | int | Time in minutes after which the Kubernetes cloud plugin will clean up an idle worker that has not already terminated | `5` |
| [agent.runAsGroup](./values.yaml#L1057) | string | Configure container group | `nil` |
| [agent.runAsUser](./values.yaml#L1055) | string | Configure container user | `nil` |
| [agent.secretEnvVars](./values.yaml#L1166) | list | Mount a secret as environment variable | `[]` |
| [agent.serviceAccount](./values.yaml#L1005) | string | Override the default service account | `serviceAccountAgent.name` if `agent.useDefaultServiceAccount` is `true` |
| [agent.showRawYaml](./values.yaml#L1093) | bool |  | `true` |
| [agent.sideContainerName](./values.yaml#L1183) | string | Side container name | `"jnlp"` |
| [agent.skipTlsVerify](./values.yaml#L1015) | bool | Disables the verification of the controller certificate on remote connection. This flag correspond to the "Disable https certificate check" flag in kubernetes plugin UI | `false` |
| [agent.usageRestricted](./values.yaml#L1017) | bool | Enable the possibility to restrict the usage of this agent to specific folder. This flag correspond to the "Restrict pipeline support to authorized folders" flag in kubernetes plugin UI | `false` |
| [agent.useDefaultServiceAccount](./values.yaml#L1001) | bool | Use `serviceAccountAgent.name` as the default value for defaults template `serviceAccount` | `true` |
| [agent.volumes](./values.yaml#L1100) | list | Additional volumes | `[]` |
| [agent.waitForPodSec](./values.yaml#L1027) | int | Seconds to wait for pod to be running | `600` |
| [agent.websocket](./values.yaml#L1050) | bool | Enables agent communication via websockets | `false` |
| [agent.workingDir](./values.yaml#L1042) | string | Configure working directory for default agent | `"/home/jenkins/agent"` |
| [agent.workspaceVolume](./values.yaml#L1135) | object | Workspace volume (defaults to EmptyDir) | `{}` |
| [agent.yamlMergeStrategy](./values.yaml#L1225) | string | Defines how the raw yaml field gets merged with yaml definitions from inherited pod templates. Possible values: "merge" or "override" | `"override"` |
| [agent.yamlTemplate](./values.yaml#L1214) | string | The raw yaml of a Pod API Object to merge into the agent spec | `""` |
| [awsSecurityGroupPolicies.enabled](./values.yaml#L1444) | bool |  | `false` |
| [awsSecurityGroupPolicies.policies[0].name](./values.yaml#L1446) | string |  | `""` |
| [awsSecurityGroupPolicies.policies[0].podSelector](./values.yaml#L1448) | object |  | `{}` |
| [awsSecurityGroupPolicies.policies[0].securityGroupIds](./values.yaml#L1447) | list |  | `[]` |
| [checkDeprecation](./values.yaml#L1441) | bool | Checks if any deprecated values are used | `true` |
| [clusterZone](./values.yaml#L21) | string | Override the cluster name for FQDN resolving | `"cluster.local"` |
| [controller.JCasC.authorizationStrategy](./values.yaml#L565) | string | Jenkins Config as Code Authorization Strategy-section | `"loggedInUsersCanDoAnything:\n  allowAnonymousRead: false"` |
| [controller.JCasC.configMapAnnotations](./values.yaml#L570) | object | Annotations for the JCasC ConfigMap | `{}` |
| [controller.JCasC.configScripts](./values.yaml#L539) | object | List of Jenkins Config as Code scripts | `{}` |
| [controller.JCasC.configUrls](./values.yaml#L536) | list | Remote URLs for configuration files. | `[]` |
| [controller.JCasC.defaultConfig](./values.yaml#L530) | bool | Enables default Jenkins configuration via configuration as code plugin | `true` |
| [controller.JCasC.overwriteConfiguration](./values.yaml#L534) | bool | Whether Jenkins Config as Code should overwrite any existing configuration | `false` |
| [controller.JCasC.security](./values.yaml#L546) | object | Jenkins Config as Code security-section | `{"apiToken":{"creationOfLegacyTokenEnabled":false,"tokenGenerationOnCreationEnabled":false,"usageStatisticsEnabled":true}}` |
| [controller.JCasC.securityRealm](./values.yaml#L554) | string | Jenkins Config as Code Security Realm-section | `"local:\n  allowsSignup: false\n  enableCaptcha: false\n  users:\n  - id: \"${chart-admin-username}\"\n    name: \"Jenkins Admin\"\n    password: \"${chart-admin-password}\""` |
| [controller.additionalExistingSecrets](./values.yaml#L489) | list | List of additional existing secrets to mount | `[]` |
| [controller.additionalPlugins](./values.yaml#L439) | list | List of plugins to install in addition to those listed in controller.installPlugins | `[]` |
| [controller.additionalSecrets](./values.yaml#L498) | list | List of additional secrets to create and mount | `[]` |
| [controller.admin.createSecret](./values.yaml#L100) | bool | Create secret for admin user | `true` |
| [controller.admin.existingSecret](./values.yaml#L103) | string | The name of an existing secret containing the admin credentials | `""` |
| [controller.admin.password](./values.yaml#L90) | string | Admin password created as a secret if `controller.admin.createSecret` is true | `<random password>` |
| [controller.admin.passwordKey](./values.yaml#L95) | string | The key in the existing admin secret containing the password | `"jenkins-admin-password"` |
| [controller.admin.userKey](./values.yaml#L93) | string | The key in the existing admin secret containing the username | `"jenkins-admin-user"` |
| [controller.admin.username](./values.yaml#L87) | string | Admin username created as a secret if `controller.admin.createSecret` is true | `"admin"` |
| [controller.affinity](./values.yaml#L701) | object | Affinity settings | `{}` |
| [controller.agentListenerEnabled](./values.yaml#L348) | bool | Create Agent listener service | `true` |
| [controller.agentListenerExternalTrafficPolicy](./values.yaml#L358) | string | Traffic Policy of for the agentListener service | `nil` |
| [controller.agentListenerHostPort](./values.yaml#L352) | string | Host port to listen for agents | `nil` |
| [controller.agentListenerLoadBalancerIP](./values.yaml#L388) | string | Static IP for the agentListener LoadBalancer | `nil` |
| [controller.agentListenerLoadBalancerSourceRanges](./values.yaml#L360) | list | Allowed inbound IP for the agentListener service | `["0.0.0.0/0"]` |
| [controller.agentListenerNodePort](./values.yaml#L354) | string | Node port to listen for agents | `nil` |
| [controller.agentListenerPort](./values.yaml#L350) | int | Listening port for agents | `50000` |
| [controller.agentListenerServiceAnnotations](./values.yaml#L383) | object | Annotations for the agentListener service | `{}` |
| [controller.agentListenerServiceType](./values.yaml#L380) | string | Defines how to expose the agentListener service | `"ClusterIP"` |
| [controller.backendconfig.annotations](./values.yaml#L827) | object | backendconfig annotations | `{}` |
| [controller.backendconfig.apiVersion](./values.yaml#L821) | string | backendconfig API version | `"extensions/v1beta1"` |
| [controller.backendconfig.enabled](./values.yaml#L819) | bool | Enables backendconfig | `false` |
| [controller.backendconfig.labels](./values.yaml#L825) | object | backendconfig labels | `{}` |
| [controller.backendconfig.name](./values.yaml#L823) | string | backendconfig name | `nil` |
| [controller.backendconfig.spec](./values.yaml#L829) | object | backendconfig spec | `{}` |
| [controller.cloudName](./values.yaml#L517) | string | Name of default cloud configuration. | `"kubernetes"` |
| [controller.cloudTraits](./values.yaml#L519) | list | Traits for the chart-generated Kubernetes cloud (for example, `ephemeralContainer`). Additional clouds inherit these unless overridden by `additionalClouds.<name>.controller.cloudTraits`. | `[]` |
| [controller.clusterIp](./values.yaml#L243) | string | k8s service clusterIP. Only used if serviceType is ClusterIP | `nil` |
| [controller.componentName](./values.yaml#L40) | string | Used for label app.kubernetes.io/component | `"jenkins-controller"` |
| [controller.containerEnv](./values.yaml#L165) | list | Environment variables for Jenkins Container | `[]` |
| [controller.containerEnvFrom](./values.yaml#L162) | list | Environment variable sources for Jenkins Container | `[]` |
| [controller.containerSecurityContext](./values.yaml#L223) | object | Allow controlling the securityContext for the jenkins container | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsUser":1000,"seccompProfile":{"type":"RuntimeDefault"}}` |
| [controller.csrf.defaultCrumbIssuer.enabled](./values.yaml#L369) | bool | Enable the default CSRF Crumb issuer | `true` |
| [controller.csrf.defaultCrumbIssuer.proxyCompatability](./values.yaml#L371) | bool | Enable proxy compatibility. This setting is ignored if you are not on the current LTS release and will be dropped with the next LTS. | `true` |
| [controller.customInitContainers](./values.yaml#L573) | list | Custom init-container specification in raw-yaml format | `[]` |
| [controller.customJenkinsLabels](./values.yaml#L78) | list | Append Jenkins labels to the controller | `[]` |
| [controller.disableRememberMe](./values.yaml#L69) | bool | Disable use of remember me | `false` |
| [controller.disabledAgentProtocols](./values.yaml#L363) | list | Disabled agent protocols | `["JNLP-connect","JNLP2-connect"]` |
| [controller.dnsConfig](./values.yaml#L725) | object | DNS config for the pod | `{}` |
| [controller.enableRawHtmlMarkupFormatter](./values.yaml#L459) | bool | Enable HTML parsing using OWASP Markup Formatter Plugin (antisamy-markup-formatter) | `false` |
| [controller.enableServiceLinks](./values.yaml#L139) | bool |  | `false` |
| [controller.executorMode](./values.yaml#L75) | string | Sets the executor mode of the Jenkins node. Possible values are "NORMAL" or "EXCLUSIVE" | `"NORMAL"` |
| [controller.existingSecret](./values.yaml#L486) | string |  | `nil` |
| [controller.extraPorts](./values.yaml#L418) | list | Optionally configure other ports to expose in the controller container | `[]` |
| [controller.fsGroup](./values.yaml#L201) | int | Deprecated in favor of `controller.podSecurityContextOverride`. uid that will be used for persistent volume. | `1000` |
| [controller.fsGroupChangePolicy](./values.yaml#L204) | string |  | `"OnRootMismatch"` |
| [controller.googlePodMonitor.enabled](./values.yaml#L913) | bool |  | `false` |
| [controller.googlePodMonitor.scrapeEndpoint](./values.yaml#L918) | string |  | `"/prometheus"` |
| [controller.googlePodMonitor.scrapeInterval](./values.yaml#L916) | string |  | `"60s"` |
| [controller.healthProbes](./values.yaml#L278) | bool | Enable Kubernetes Probes configuration configured in `controller.probes` | `true` |
| [controller.hostAliases](./values.yaml#L866) | list | Allows for adding entries to Pod /etc/hosts | `[]` |
| [controller.hostNetworking](./values.yaml#L80) | bool |  | `false` |
| [controller.httpRoute.annotations](./values.yaml#L859) | object | HTTPRoute annotations | `{}` |
| [controller.httpRoute.apiVersion](./values.yaml#L846) | string |  | `"gateway.networking.k8s.io/v1"` |
| [controller.httpRoute.enabled](./values.yaml#L845) | bool |  | `false` |
| [controller.httpRoute.extraRules](./values.yaml#L857) | list |  | `[]` |
| [controller.httpRoute.filters](./values.yaml#L861) | list | Filters applied to the default HTTPRoute rule | `[]` |
| [controller.httpRoute.hostnames](./values.yaml#L855) | list |  | `[]` |
| [controller.httpRoute.kind](./values.yaml#L847) | string |  | `"HTTPRoute"` |
| [controller.httpRoute.parentRefs](./values.yaml#L849) | list |  | `[]` |
| [controller.httpRoute.reuseIngressConfiguration](./values.yaml#L853) | bool |  | `false` |
| [controller.httpRoute.timeouts](./values.yaml#L863) | object | Timeouts applied to the default HTTPRoute rule. Requires Gateway API v1.2+ and controller support | `{}` |
| [controller.httpsKeyStore.disableSecretMount](./values.yaml#L934) | bool |  | `false` |
| [controller.httpsKeyStore.enable](./values.yaml#L925) | bool | Enables HTTPS keystore on jenkins controller | `false` |
| [controller.httpsKeyStore.fileName](./values.yaml#L942) | string | Jenkins keystore filename which will appear under controller.httpsKeyStore.path | `"keystore.jks"` |
| [controller.httpsKeyStore.httpPort](./values.yaml#L938) | int | HTTP Port that Jenkins should listen to along with HTTPS, it also serves as the liveness and readiness probes port. | `8081` |
| [controller.httpsKeyStore.jenkinsHttpsJksPasswordSecretKey](./values.yaml#L933) | string | Name of the key in the secret that contains the JKS password | `"https-jks-password"` |
| [controller.httpsKeyStore.jenkinsHttpsJksPasswordSecretName](./values.yaml#L931) | string | Name of the secret that contains the JKS password, if it is not in the same secret as the JKS file | `""` |
| [controller.httpsKeyStore.jenkinsHttpsJksSecretKey](./values.yaml#L929) | string | Name of the key in the secret that already has SSL keystore | `"jenkins-jks-file"` |
| [controller.httpsKeyStore.jenkinsHttpsJksSecretName](./values.yaml#L927) | string | Name of the secret that already has SSL keystore | `""` |
| [controller.httpsKeyStore.jenkinsKeyStoreBase64Encoded](./values.yaml#L947) | string | Base64 encoded Keystore content. Keystore must be converted to base64 then being pasted here | `nil` |
| [controller.httpsKeyStore.password](./values.yaml#L944) | string | Jenkins keystore password | `"password"` |
| [controller.httpsKeyStore.path](./values.yaml#L940) | string | Path of HTTPS keystore file | `"/var/jenkins_keystore"` |
| [controller.image.pullPolicy](./values.yaml#L53) | string | Controller image pull policy | `"Always"` |
| [controller.image.registry](./values.yaml#L43) | string | Controller image registry | `"docker.io"` |
| [controller.image.repository](./values.yaml#L45) | string | Controller image repository | `"jenkins/jenkins"` |
| [controller.image.tag](./values.yaml#L48) | string | Controller image tag override; i.e., tag: "2.440.1-jdk21" | `nil` |
| [controller.image.tagLabel](./values.yaml#L51) | string | Controller image tag label | `"jdk25"` |
| [controller.imagePullSecretName](./values.yaml#L59) | string | Controller image pull secret | `nil` |
| [controller.ingress.annotations](./values.yaml#L753) | object | Primary Ingress annotations | `{}` |
| [controller.ingress.apiVersion](./values.yaml#L749) | string | Primary Ingress API version | `"networking.k8s.io/v1"` |
| [controller.ingress.enabled](./values.yaml#L729) | bool | Enables the Primary ingress | `false` |
| [controller.ingress.hostName](./values.yaml#L769) | string | Primary Ingress hostname | `nil` |
| [controller.ingress.ingressClassName](./values.yaml#L761) | string | Primary Ingress ingressClassName | `nil` |
| [controller.ingress.labels](./values.yaml#L751) | object | Primary Ingress labels | `{}` |
| [controller.ingress.path](./values.yaml#L765) | string | Primary Ingress path | `nil` |
| [controller.ingress.pathType](./values.yaml#L744) | string | Primary Ingress rule pathType, choices are: Exact, ImplementationSpecific, Prefix | `"ImplementationSpecific"` |
| [controller.ingress.paths](./values.yaml#L733) | list | Override for the default Primary Ingress paths | `[]` |
| [controller.ingress.resourceRootUrl](./values.yaml#L771) | string | Primary Hostname to serve assets from | `nil` |
| [controller.ingress.tls](./values.yaml#L773) | list | Primary Ingress TLS configuration | `[]` |
| [controller.initConfigMap](./values.yaml#L476) | string | Name of the existing ConfigMap that contains init scripts | `nil` |
| [controller.initContainerEnv](./values.yaml#L156) | list | Environment variables for Init Container | `[]` |
| [controller.initContainerEnvFrom](./values.yaml#L152) | list | Environment variable sources for Init Container | `[]` |
| [controller.initContainerResources](./values.yaml#L143) | object | Resources allocation (Requests and Limits) for Init Container | `{}` |
| [controller.initScripts](./values.yaml#L472) | object | Map of groovy init scripts to be executed during Jenkins controller start | `{}` |
| [controller.initializeOnce](./values.yaml#L444) | bool | Initialize only on first installation. Ensures plugins do not get updated inadvertently. Requires `persistence.enabled` to be set to `true` | `false` |
| [controller.installLatestPlugins](./values.yaml#L433) | bool | Download the minimum required version or latest version of all dependencies | `true` |
| [controller.installLatestSpecifiedPlugins](./values.yaml#L436) | bool | Set to true to download the latest version of any plugin that is requested to have the latest version | `false` |
| [controller.installPlugins](./values.yaml#L425) | list | List of Jenkins plugins to install. If you don't want to install plugins, set it to `false` | `["kubernetes:4560.vc25b_83890c34","workflow-aggregator:608.v67378e9d3db_1","git:5.11.0","configuration-as-code:2140.v00e72b_047734"]` |
| [controller.javaOpts](./values.yaml#L171) | string | Append to `JAVA_OPTS` env var | `nil` |
| [controller.jenkinsAdminEmail](./values.yaml#L105) | string | Email address for the administrator of the Jenkins instance | `nil` |
| [controller.jenkinsHome](./values.yaml#L110) | string | Custom Jenkins home path | `"/var/jenkins_home"` |
| [controller.jenkinsOpts](./values.yaml#L173) | string | Append to `JENKINS_OPTS` env var | `nil` |
| [controller.jenkinsRef](./values.yaml#L115) | string | Custom Jenkins reference path | `"/usr/share/jenkins/ref"` |
| [controller.jenkinsUriPrefix](./values.yaml#L188) | string | Root URI Jenkins will be served on | `nil` |
| [controller.jenkinsUrl](./values.yaml#L183) | string | Set Jenkins URL if you are not using the ingress definitions provided by the chart | `nil` |
| [controller.jenkinsUrlProtocol](./values.yaml#L180) | string | Set protocol for Jenkins URL; `https` if `controller.ingress.tls`, `http` otherwise | `nil` |
| [controller.jenkinsWar](./values.yaml#L118) | string |  | `"/usr/share/jenkins/jenkins.war"` |
| [controller.jmxPort](./values.yaml#L415) | string | Open a port, for JMX stats | `nil` |
| [controller.legacyRemotingSecurityEnabled](./values.yaml#L391) | bool | Whether legacy remoting security should be enabled | `false` |
| [controller.lifecycle](./values.yaml#L61) | object | Lifecycle specification for controller-container | `{}` |
| [controller.loadBalancerIP](./values.yaml#L406) | string | Optionally assign a known public LB IP | `nil` |
| [controller.loadBalancerSourceRanges](./values.yaml#L402) | list | Allowed inbound IP addresses | `["0.0.0.0/0"]` |
| [controller.markupFormatter](./values.yaml#L463) | string | Yaml of the markup formatter to use | `"plainText"` |
| [controller.nodePort](./values.yaml#L249) | string | k8s node port. Only used if serviceType is NodePort | `nil` |
| [controller.nodeSelector](./values.yaml#L688) | object | Node labels for pod assignment | `{}` |
| [controller.numExecutors](./values.yaml#L72) | int | Set Number of executors | `0` |
| [controller.overwritePlugins](./values.yaml#L448) | bool | Overwrite installed plugins on start | `false` |
| [controller.overwritePluginsFromImage](./values.yaml#L452) | bool | Overwrite plugins that are already installed in the controller image | `true` |
| [controller.podAnnotations](./values.yaml#L709) | object | Annotations for controller pod | `{}` |
| [controller.podDisruptionBudget.annotations](./values.yaml#L342) | object |  | `{}` |
| [controller.podDisruptionBudget.apiVersion](./values.yaml#L340) | string | Policy API version | `"policy/v1beta1"` |
| [controller.podDisruptionBudget.enabled](./values.yaml#L335) | bool | Enable Kubernetes Pod Disruption Budget configuration | `false` |
| [controller.podDisruptionBudget.labels](./values.yaml#L343) | object |  | `{}` |
| [controller.podDisruptionBudget.maxUnavailable](./values.yaml#L345) | string | Number of pods that can be unavailable. Either an absolute number or a percentage | `"0"` |
| [controller.podLabels](./values.yaml#L271) | object | Custom Pod labels (an object with `label-key: label-value` pairs) | `{}` |
| [controller.podSecurityContextOverride](./values.yaml#L220) | string | Completely overwrites the contents of the pod security context, ignoring the values provided for `runAsUser`, `fsGroup`, and `securityContextCapabilities` | `nil` |
| [controller.priorityClassName](./values.yaml#L706) | string | The name of a `priorityClass` to apply to the controller pod | `nil` |
| [controller.probes.livenessProbe.failureThreshold](./values.yaml#L296) | int | Set the failure threshold for the liveness probe | `5` |
| [controller.probes.livenessProbe.httpGet.path](./values.yaml#L299) | string | Set the Pod's HTTP path for the liveness probe | `"{{ default \"\" .Values.controller.jenkinsUriPrefix }}/login"` |
| [controller.probes.livenessProbe.httpGet.port](./values.yaml#L301) | string | Set the Pod's HTTP port to use for the liveness probe | `"http"` |
| [controller.probes.livenessProbe.initialDelaySeconds](./values.yaml#L310) | string | Set the initial delay for the liveness probe in seconds | `nil` |
| [controller.probes.livenessProbe.periodSeconds](./values.yaml#L303) | int | Set the time interval between two liveness probes executions in seconds | `10` |
| [controller.probes.livenessProbe.timeoutSeconds](./values.yaml#L305) | int | Set the timeout for the liveness probe in seconds | `5` |
| [controller.probes.readinessProbe.failureThreshold](./values.yaml#L314) | int | Set the failure threshold for the readiness probe | `3` |
| [controller.probes.readinessProbe.httpGet.path](./values.yaml#L317) | string | Set the Pod's HTTP path for the liveness probe | `"{{ default \"\" .Values.controller.jenkinsUriPrefix }}/login"` |
| [controller.probes.readinessProbe.httpGet.port](./values.yaml#L319) | string | Set the Pod's HTTP port to use for the readiness probe | `"http"` |
| [controller.probes.readinessProbe.initialDelaySeconds](./values.yaml#L328) | string | Set the initial delay for the readiness probe in seconds | `nil` |
| [controller.probes.readinessProbe.periodSeconds](./values.yaml#L321) | int | Set the time interval between two readiness probes executions in seconds | `10` |
| [controller.probes.readinessProbe.timeoutSeconds](./values.yaml#L323) | int | Set the timeout for the readiness probe in seconds | `5` |
| [controller.probes.startupProbe.failureThreshold](./values.yaml#L283) | int | Set the failure threshold for the startup probe | `12` |
| [controller.probes.startupProbe.httpGet.path](./values.yaml#L286) | string | Set the Pod's HTTP path for the startup probe | `"{{ default \"\" .Values.controller.jenkinsUriPrefix }}/login"` |
| [controller.probes.startupProbe.httpGet.port](./values.yaml#L288) | string | Set the Pod's HTTP port to use for the startup probe | `"http"` |
| [controller.probes.startupProbe.periodSeconds](./values.yaml#L290) | int | Set the time interval between two startup probes executions in seconds | `10` |
| [controller.probes.startupProbe.timeoutSeconds](./values.yaml#L292) | int | Set the timeout for the startup probe in seconds | `5` |
| [controller.projectNamingStrategy](./values.yaml#L455) | string |  | `"standard"` |
| [controller.prometheus.alertingRulesAdditionalLabels](./values.yaml#L899) | object | Additional labels to add to the PrometheusRule object | `{}` |
| [controller.prometheus.alertingrules](./values.yaml#L897) | list | Array of prometheus alerting rules | `[]` |
| [controller.prometheus.enabled](./values.yaml#L882) | bool | Enables prometheus service monitor | `false` |
| [controller.prometheus.metricRelabelings](./values.yaml#L909) | list |  | `[]` |
| [controller.prometheus.prometheusRuleNamespace](./values.yaml#L901) | string | Set a custom namespace where to deploy PrometheusRule resource | `""` |
| [controller.prometheus.relabelings](./values.yaml#L907) | list |  | `[]` |
| [controller.prometheus.scrapeEndpoint](./values.yaml#L892) | string | The endpoint prometheus should get metrics from | `"/prometheus"` |
| [controller.prometheus.scrapeInterval](./values.yaml#L888) | string | How often prometheus should scrape metrics | `"60s"` |
| [controller.prometheus.serviceMonitorAdditionalLabels](./values.yaml#L884) | object | Additional labels to add to the service monitor object | `{}` |
| [controller.prometheus.serviceMonitorNamespace](./values.yaml#L886) | string | Set a custom namespace where to deploy ServiceMonitor resource | `nil` |
| [controller.publishNotReadyAddresses](./values.yaml#L257) | string |  | `nil` |
| [controller.replicas](./values.yaml#L56) | int | Number of replicas. Max 1. Can be set to 0 for maintenance scenarios. | `1` |
| [controller.resources](./values.yaml#L124) | object | Resource allocation (Requests and Limits) | `{"limits":{"cpu":"2000m","memory":"4096Mi"},"requests":{"cpu":"50m","memory":"256Mi"}}` |
| [controller.revisionHistoryLimit](./values.yaml#L719) | string | Maximum number of revisions that will be maintained in the StatefulSet's revision history | `nil` |
| [controller.route.annotations](./values.yaml#L838) | object | Route annotations | `{}` |
| [controller.route.enabled](./values.yaml#L834) | bool | Enables openshift route | `false` |
| [controller.route.labels](./values.yaml#L836) | object | Route labels | `{}` |
| [controller.route.path](./values.yaml#L840) | string | Route path | `nil` |
| [controller.runAsUser](./values.yaml#L198) | int | Deprecated in favor of `controller.podSecurityContextOverride`. uid that jenkins runs with. | `1000` |
| [controller.schedulerName](./values.yaml#L684) | string | Name of the Kubernetes scheduler to use | `""` |
| [controller.scriptApproval](./values.yaml#L467) | list | List of groovy functions to approve | `[]` |
| [controller.secondaryingress.annotations](./values.yaml#L798) | object | Secondary Ingress annotations | `{}` |
| [controller.secondaryingress.apiVersion](./values.yaml#L794) | string | Secondary Ingress API version | `"networking.k8s.io/v1"` |
| [controller.secondaryingress.enabled](./values.yaml#L784) | bool | Enables the Secondary Ingress | `false` |
| [controller.secondaryingress.hostName](./values.yaml#L807) | string | Secondary Ingress hostname | `nil` |
| [controller.secondaryingress.ingressClassName](./values.yaml#L804) | string | Secondary Ingress ingressClassName | `nil` |
| [controller.secondaryingress.labels](./values.yaml#L796) | object | Secondary Ingress labels | `{}` |
| [controller.secondaryingress.pathType](./values.yaml#L790) | string | Secondary Ingress rule pathType, choices are: Exact, ImplementationSpecific, Prefix | `"ImplementationSpecific"` |
| [controller.secondaryingress.paths](./values.yaml#L788) | list | Secondary Ingress paths | `[]` |
| [controller.secondaryingress.tls](./values.yaml#L809) | string | Secondary Ingress TLS configuration | `nil` |
| [controller.secretClaims](./values.yaml#L510) | list | List of `SecretClaim` resources to create | `[]` |
| [controller.securityContextCapabilities](./values.yaml#L210) | object |  | `{}` |
| [controller.serviceAnnotations](./values.yaml#L260) | object | Jenkins controller service annotations | `{}` |
| [controller.serviceEnabled](./values.yaml#L235) | bool | enable or disable the controller k8s service | `true` |
| [controller.serviceExternalTrafficPolicy](./values.yaml#L253) | string |  | `nil` |
| [controller.serviceLabels](./values.yaml#L266) | object | Labels for the Jenkins controller-service | `{}` |
| [controller.servicePort](./values.yaml#L245) | int | k8s service port | `8080` |
| [controller.serviceType](./values.yaml#L240) | string | k8s service type | `"ClusterIP"` |
| [controller.shareProcessNamespace](./values.yaml#L133) | bool |  | `false` |
| [controller.sidecars.additionalSidecarContainers](./values.yaml#L666) | list | Configures additional sidecar container(s) for the Jenkins controller | `[]` |
| [controller.sidecars.configAutoReload.additionalVolumeMounts](./values.yaml#L606) | list | Enables additional volume mounts for the config auto-reload container | `[]` |
| [controller.sidecars.configAutoReload.containerSecurityContext](./values.yaml#L656) | object | Enable container security context | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"seccompProfile":{"type":"RuntimeDefault"}}` |
| [controller.sidecars.configAutoReload.enabled](./values.yaml#L586) | bool | Enable Jenkins Config as Code auto-reload | `true` |
| [controller.sidecars.configAutoReload.env](./values.yaml#L638) | list | Environment variables for the Jenkins Config as Code auto-reload container | `[]` |
| [controller.sidecars.configAutoReload.envFrom](./values.yaml#L636) | list | Environment variable sources for the Jenkins Config as Code auto-reload container | `[]` |
| [controller.sidecars.configAutoReload.folder](./values.yaml#L649) | string |  | `"/var/jenkins_home/casc_configs"` |
| [controller.sidecars.configAutoReload.healthPort](./values.yaml#L596) | int | Port for sidecar health probes | `8060` |
| [controller.sidecars.configAutoReload.image.registry](./values.yaml#L589) | string | Registry for the image that triggers the reload | `"docker.io"` |
| [controller.sidecars.configAutoReload.image.repository](./values.yaml#L591) | string | Repository of the image that triggers the reload | `"kiwigrid/k8s-sidecar"` |
| [controller.sidecars.configAutoReload.image.tag](./values.yaml#L593) | string | Tag for the image that triggers the reload | `"2.14.1"` |
| [controller.sidecars.configAutoReload.imagePullPolicy](./values.yaml#L594) | string |  | `"IfNotPresent"` |
| [controller.sidecars.configAutoReload.logging](./values.yaml#L613) | object | Config auto-reload logging settings | `{"configuration":{"backupCount":3,"formatter":"JSON","logLevel":"INFO","logToConsole":true,"logToFile":false,"maxBytes":1024,"override":false}}` |
| [controller.sidecars.configAutoReload.logging.configuration.override](./values.yaml#L617) | bool | Enables custom log config utilizing using the settings below. | `false` |
| [controller.sidecars.configAutoReload.reqRetryConnect](./values.yaml#L631) | int | How many connection-related errors to retry on | `10` |
| [controller.sidecars.configAutoReload.resources](./values.yaml#L597) | object |  | `{}` |
| [controller.sidecars.configAutoReload.scheme](./values.yaml#L626) | string | The scheme to use when connecting to the Jenkins configuration as code endpoint | `"http"` |
| [controller.sidecars.configAutoReload.skipTlsVerify](./values.yaml#L628) | bool | Skip TLS verification when connecting to the Jenkins configuration as code endpoint | `false` |
| [controller.sidecars.configAutoReload.sleepTime](./values.yaml#L633) | string | How many seconds to wait before updating config-maps/secrets (sets METHOD=SLEEP on the sidecar) | `nil` |
| [controller.sidecars.configAutoReload.sshTcpPort](./values.yaml#L647) | int |  | `1044` |
| [controller.statefulSetAnnotations](./values.yaml#L711) | object | Annotations for controller StatefulSet | `{}` |
| [controller.statefulSetLabels](./values.yaml#L262) | object | Jenkins controller custom labels for the StatefulSet | `{}` |
| [controller.targetPort](./values.yaml#L247) | int | k8s target port | `8080` |
| [controller.terminationGracePeriodSeconds](./values.yaml#L694) | string | Set TerminationGracePeriodSeconds | `nil` |
| [controller.terminationMessagePath](./values.yaml#L696) | string | Set the termination message path | `nil` |
| [controller.terminationMessagePolicy](./values.yaml#L698) | string | Set the termination message policy | `nil` |
| [controller.testEnabled](./values.yaml#L921) | bool | Can be used to disable rendering controller test resources when using helm template | `true` |
| [controller.tolerations](./values.yaml#L692) | list | Toleration labels for pod assignment | `[]` |
| [controller.topologySpreadConstraints](./values.yaml#L722) | list | Topology spread constraints | `[]` |
| [controller.updateStrategy](./values.yaml#L715) | object | Update strategy for StatefulSet | `{}` |
| [controller.usePodSecurityContext](./values.yaml#L191) | bool | Enable pod security context (must be `true` if podSecurityContextOverride, runAsUser or fsGroup are set) | `true` |
| [credentialsId](./values.yaml#L27) | string | The Jenkins credentials to access the Kubernetes API server. For the default cluster it is not needed. | `nil` |
| [extraLabels](./values.yaml#L33) | object | Configures extra labels for the agent all objects | `{}` |
| [extraObjects](./values.yaml#L36) | string | Configures extra manifests | `nil` |
| [fullnameOverride](./values.yaml#L13) | string | Override the full resource names | `jenkins-(release-name)` or `jenkins` if the release-name is `jenkins` |
| [helmtest.bats.image.registry](./values.yaml#L1459) | string | Registry of the image used to test the framework | `"docker.io"` |
| [helmtest.bats.image.repository](./values.yaml#L1461) | string | Repository of the image used to test the framework | `"bats/bats"` |
| [helmtest.bats.image.tag](./values.yaml#L1463) | string | Tag of the image to test the framework | `"1.14.0"` |
| [helmtest.bats.imagePullSecretName](./values.yaml#L1456) | string | Name of the secret to be used to pull the image | `""` |
| [kubernetesURL](./values.yaml#L24) | string | The URL of the Kubernetes API server | `"https://kubernetes.default"` |
| [nameOverride](./values.yaml#L10) | string | Override the resource name prefix | `Chart.Name` |
| [namespaceOverride](./values.yaml#L16) | string | Override the deployment namespace | `Release.Namespace` |
| [networkPolicy.apiVersion](./values.yaml#L1380) | string | NetworkPolicy ApiVersion | `"networking.k8s.io/v1"` |
| [networkPolicy.enabled](./values.yaml#L1375) | bool | Enable the creation of NetworkPolicy resources | `false` |
| [networkPolicy.externalAgents.except](./values.yaml#L1395) | list | A list of IP sub-ranges to be excluded from the allowlisted IP range | `[]` |
| [networkPolicy.externalAgents.ipCIDR](./values.yaml#L1393) | string | The IP range from which external agents are allowed to connect to controller, i.e., 172.17.0.0/16 | `nil` |
| [networkPolicy.internalAgents.allowed](./values.yaml#L1384) | bool | Allow internal agents (from the same cluster) to connect to controller. Agent pods will be filtered based on PodLabels | `true` |
| [networkPolicy.internalAgents.namespaceLabels](./values.yaml#L1388) | object | A map of labels (keys/values) that agents namespaces must have to be able to connect to controller | `{}` |
| [networkPolicy.internalAgents.podLabels](./values.yaml#L1386) | object | A map of labels (keys/values) that agent pods must have to be able to connect to controller | `{}` |
| [persistence.accessMode](./values.yaml#L1350) | string | The PVC access mode | `"ReadWriteOnce"` |
| [persistence.annotations](./values.yaml#L1346) | object | Annotations for the PVC | `{}` |
| [persistence.dataSource](./values.yaml#L1356) | object | Existing data source to clone PVC from | `{}` |
| [persistence.enabled](./values.yaml#L1330) | bool | Enable the use of a Jenkins PVC | `true` |
| [persistence.existingClaim](./values.yaml#L1336) | string | Provide the name of a PVC | `nil` |
| [persistence.labels](./values.yaml#L1348) | object | Labels for the PVC | `{}` |
| [persistence.mounts](./values.yaml#L1368) | list | Additional mounts | `[]` |
| [persistence.size](./values.yaml#L1352) | string | The size of the PVC | `"8Gi"` |
| [persistence.storageClass](./values.yaml#L1344) | string | Storage class for the PVC | `nil` |
| [persistence.subPath](./values.yaml#L1361) | string | SubPath for jenkins-home mount | `nil` |
| [persistence.volumes](./values.yaml#L1363) | list | Additional volumes | `[]` |
| [rbac.create](./values.yaml#L1402) | bool | Whether RBAC resources are created | `true` |
| [rbac.readSecrets](./values.yaml#L1404) | bool | Whether the Jenkins service account should be able to read Kubernetes secrets | `false` |
| [rbac.useOpenShiftNonRootSCC](./values.yaml#L1406) | bool | Whether the Jenkins service account should be able to use the OpenShift "nonroot" Security Context Constraints | `false` |
| [renderHelmLabels](./values.yaml#L30) | bool | Enables rendering of the helm.sh/chart label to the annotations | `true` |
| [serviceAccount.annotations](./values.yaml#L1416) | object | Configures annotations for the ServiceAccount | `{}` |
| [serviceAccount.automountServiceAccountToken](./values.yaml#L1422) | bool | Auto-mount ServiceAccount token | `true` |
| [serviceAccount.create](./values.yaml#L1410) | bool | Configures if a ServiceAccount with this name should be created | `true` |
| [serviceAccount.extraLabels](./values.yaml#L1418) | object | Configures extra labels for the ServiceAccount | `{}` |
| [serviceAccount.imagePullSecretName](./values.yaml#L1420) | string | Controller ServiceAccount image pull secret | `nil` |
| [serviceAccount.name](./values.yaml#L1414) | string |  | `nil` |
| [serviceAccountAgent.annotations](./values.yaml#L1432) | object | Configures annotations for the agent ServiceAccount | `{}` |
| [serviceAccountAgent.automountServiceAccountToken](./values.yaml#L1438) | bool | Auto-mount ServiceAccount token | `true` |
| [serviceAccountAgent.create](./values.yaml#L1426) | bool | Configures if an agent ServiceAccount should be created | `false` |
| [serviceAccountAgent.extraLabels](./values.yaml#L1434) | object | Configures extra labels for the agent ServiceAccount | `{}` |
| [serviceAccountAgent.imagePullSecretName](./values.yaml#L1436) | string | Agent ServiceAccount image pull secret | `nil` |
| [serviceAccountAgent.name](./values.yaml#L1430) | string | The name of the agent ServiceAccount to be used by access-controlled resources | `nil` |
