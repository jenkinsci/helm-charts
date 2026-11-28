# Jenkins

## Configuration

The following tables list the configurable parameters of the Jenkins chart and their default values.

## Values

| Key | Type | Description | Default |
|:----|:-----|:---------|:------------|
| [additionalAgents](./values.yaml#L1285) | object | Configure additional | `{}` |
| [additionalClouds](./values.yaml#L1312) | object |  | `{}` |
| [agent.TTYEnabled](./values.yaml#L1190) | bool | Allocate pseudo tty to the side container | `false` |
| [agent.addMasterProxyEnvVars](./values.yaml#L991) | bool | Add the environment proxy settings form jenkins controller to the agents. | `false` |
| [agent.additionalContainers](./values.yaml#L1238) | list | Add additional containers to the agents | `[]` |
| [agent.agentInjection](./values.yaml#L1018) | bool | Inject the agent into the pod at runtime instead of running a dedicated jnlp container. This flag corresponds to the "Inject Jenkins agent in agent container" flag of the pod template in kubernetes plugin UI | `false` |
| [agent.alwaysPullImage](./values.yaml#L1083) | bool | Always pull agent container image before build | `false` |
| [agent.annotations](./values.yaml#L1234) | object | Annotations to apply to the pod | `{}` |
| [agent.args](./values.yaml#L1184) | string | Arguments passed to command to execute | `"${computer.jnlpmac} ${computer.name}"` |
| [agent.command](./values.yaml#L1182) | string | Command to execute when side container starts | `nil` |
| [agent.componentName](./values.yaml#L1051) | string |  | `"jenkins-agent"` |
| [agent.connectTimeout](./values.yaml#L1232) | int | Timeout in seconds for an agent to be online | `100` |
| [agent.containerCap](./values.yaml#L1192) | int | Max number of agents to launch for a whole cluster. | `10` |
| [agent.customJenkinsLabels](./values.yaml#L1048) | list | Append Jenkins labels to the agent | `[]` |
| [agent.defaultsProviderTemplate](./values.yaml#L996) | string | The name of the pod template to use for providing default values | `""` |
| [agent.directConnection](./values.yaml#L1054) | bool |  | `false` |
| [agent.disableDefaultAgent](./values.yaml#L1256) | bool | Disable the default Jenkins Agent configuration | `false` |
| [agent.enabled](./values.yaml#L994) | bool | Enable Kubernetes plugin jnlp-agent podTemplate | `true` |
| [agent.envVars](./values.yaml#L1165) | list | Environment variables for the agent Pod | `[]` |
| [agent.garbageCollection.enabled](./values.yaml#L1201) | bool | When enabled, Jenkins will periodically check for orphan pods that have not been touched for the given timeout period and delete them. | `false` |
| [agent.garbageCollection.namespaces](./values.yaml#L1203) | string | Namespaces to look at for garbage collection, in addition to the default namespace defined for the cloud. One namespace per line. | `""` |
| [agent.garbageCollection.timeout](./values.yaml#L1208) | int | Timeout value for orphaned pods | `300` |
| [agent.hostNetworking](./values.yaml#L1062) | bool | Enables the agent to use the host network | `false` |
| [agent.idleMinutes](./values.yaml#L1211) | int | Allows the Pod to remain active for reuse until the configured number of minutes has passed since the last step was executed on it | `0` |
| [agent.image.registry](./values.yaml#L1039) | string | Registry to pull the agent jnlp image from | `""` |
| [agent.image.repository](./values.yaml#L1041) | string | Repository to pull the agent jnlp image from | `"jenkins/inbound-agent"` |
| [agent.image.tag](./values.yaml#L1043) | string | Tag of the image to pull | `"3396.ve02b_5cde31b_2-5-jdk25"` |
| [agent.imagePullSecretName](./values.yaml#L1050) | string | Name of the secret to be used to pull the image | `nil` |
| [agent.inheritYamlMergeStrategy](./values.yaml#L1230) | bool | Controls whether the defined yaml merge strategy will be inherited if another defined pod template is configured to inherit from the current one | `false` |
| [agent.instanceCap](./values.yaml#L1194) | int | Max number of agents to launch for this type of agent | `2147483647` |
| [agent.jenkinsTunnel](./values.yaml#L1012) | string | Overrides the Kubernetes Jenkins tunnel | `nil` |
| [agent.jenkinsUrl](./values.yaml#L1008) | string | Overrides the Kubernetes Jenkins URL | `nil` |
| [agent.jnlpregistry](./values.yaml#L1036) | string | Custom registry used to pull the agent jnlp image from | `nil` |
| [agent.kubernetesConnectTimeout](./values.yaml#L1022) | int | The connection timeout in seconds for connections to Kubernetes API. The minimum value is 5 | `5` |
| [agent.kubernetesReadTimeout](./values.yaml#L1024) | int | The read timeout in seconds for connections to Kubernetes API. The minimum value is 15 | `15` |
| [agent.livenessProbe](./values.yaml#L1073) | object |  | `{}` |
| [agent.maxRequestsPerHostStr](./values.yaml#L1026) | string | The maximum concurrent connections to Kubernetes API | `"32"` |
| [agent.namespace](./values.yaml#L1032) | string | Namespace in which the Kubernetes agents should be launched | `nil` |
| [agent.nodeSelector](./values.yaml#L1176) | object | Node labels for pod assignment | `{}` |
| [agent.nodeUsageMode](./values.yaml#L1046) | string |  | `"NORMAL"` |
| [agent.podLabels](./values.yaml#L1034) | object | Custom Pod labels (an object with `label-key: label-value` pairs) | `{}` |
| [agent.podName](./values.yaml#L1196) | string | Agent Pod base name | `"default"` |
| [agent.podRetention](./values.yaml#L1092) | string |  | `"Never"` |
| [agent.podTemplates](./values.yaml#L1266) | object | Configures extra pod templates for the default kubernetes cloud | `{}` |
| [agent.privileged](./values.yaml#L1056) | bool | Agent privileged container | `false` |
| [agent.resources](./values.yaml#L1064) | object | Resources allocation (Requests and Limits) | `{"limits":{"cpu":"512m","memory":"512Mi"},"requests":{"cpu":"512m","memory":"512Mi"}}` |
| [agent.restrictedPssSecurityContext](./values.yaml#L1089) | bool | Set a restricted securityContext on jnlp containers | `false` |
| [agent.retentionTimeout](./values.yaml#L1028) | int | Time in minutes after which the Kubernetes cloud plugin will clean up an idle worker that has not already terminated | `5` |
| [agent.runAsGroup](./values.yaml#L1060) | string | Configure container group | `nil` |
| [agent.runAsUser](./values.yaml#L1058) | string | Configure container user | `nil` |
| [agent.secretEnvVars](./values.yaml#L1169) | list | Mount a secret as environment variable | `[]` |
| [agent.serviceAccount](./values.yaml#L1004) | string | Override the default service account | `serviceAccountAgent.name` if `agent.useDefaultServiceAccount` is `true` |
| [agent.showRawYaml](./values.yaml#L1096) | bool |  | `true` |
| [agent.sideContainerName](./values.yaml#L1186) | string | Side container name | `"jnlp"` |
| [agent.skipTlsVerify](./values.yaml#L1014) | bool | Disables the verification of the controller certificate on remote connection. This flag correspond to the "Disable https certificate check" flag in kubernetes plugin UI | `false` |
| [agent.usageRestricted](./values.yaml#L1016) | bool | Enable the possibility to restrict the usage of this agent to specific folder. This flag correspond to the "Restrict pipeline support to authorized folders" flag in kubernetes plugin UI | `false` |
| [agent.useDefaultServiceAccount](./values.yaml#L1000) | bool | Use `serviceAccountAgent.name` as the default value for defaults template `serviceAccount` | `true` |
| [agent.useJenkinsProxy](./values.yaml#L1020) | bool | Connect to the Kubernetes API through the proxy configured in Jenkins (Manage Jenkins > System > HTTP Proxy). This flag corresponds to the "Use Jenkins Proxy" flag in kubernetes plugin UI | `false` |
| [agent.volumes](./values.yaml#L1103) | list | Additional volumes | `[]` |
| [agent.waitForPodSec](./values.yaml#L1030) | int | Seconds to wait for pod to be running | `600` |
| [agent.websocket](./values.yaml#L1053) | bool | Enables agent communication via websockets | `false` |
| [agent.workingDir](./values.yaml#L1045) | string | Configure working directory for default agent | `"/home/jenkins/agent"` |
| [agent.workspaceVolume](./values.yaml#L1138) | object | Workspace volume (defaults to EmptyDir) | `{}` |
| [agent.yamlMergeStrategy](./values.yaml#L1228) | string | Defines how the raw yaml field gets merged with yaml definitions from inherited pod templates. Possible values: "merge" or "override" | `"override"` |
| [agent.yamlTemplate](./values.yaml#L1217) | string | The raw yaml of a Pod API Object to merge into the agent spec | `""` |
| [awsSecurityGroupPolicies.enabled](./values.yaml#L1448) | bool |  | `false` |
| [awsSecurityGroupPolicies.policies[0].name](./values.yaml#L1450) | string |  | `""` |
| [awsSecurityGroupPolicies.policies[0].podSelector](./values.yaml#L1452) | object |  | `{}` |
| [awsSecurityGroupPolicies.policies[0].securityGroupIds](./values.yaml#L1451) | list |  | `[]` |
| [checkDeprecation](./values.yaml#L1445) | bool | Checks if any deprecated values are used | `true` |
| [clusterZone](./values.yaml#L21) | string | Override the cluster name for FQDN resolving | `"cluster.local"` |
| [controller.JCasC.authorizationStrategy](./values.yaml#L564) | string | Jenkins Config as Code Authorization Strategy-section | `"loggedInUsersCanDoAnything:\n  allowAnonymousRead: false"` |
| [controller.JCasC.configMapAnnotations](./values.yaml#L569) | object | Annotations for the JCasC ConfigMap | `{}` |
| [controller.JCasC.configScripts](./values.yaml#L538) | object | List of Jenkins Config as Code scripts | `{}` |
| [controller.JCasC.configUrls](./values.yaml#L535) | list | Remote URLs for configuration files. | `[]` |
| [controller.JCasC.defaultConfig](./values.yaml#L529) | bool | Enables default Jenkins configuration via configuration as code plugin | `true` |
| [controller.JCasC.overwriteConfiguration](./values.yaml#L533) | bool | Whether Jenkins Config as Code should overwrite any existing configuration | `false` |
| [controller.JCasC.security](./values.yaml#L545) | object | Jenkins Config as Code security-section | `{"apiToken":{"creationOfLegacyTokenEnabled":false,"tokenGenerationOnCreationEnabled":false,"usageStatisticsEnabled":true}}` |
| [controller.JCasC.securityRealm](./values.yaml#L553) | string | Jenkins Config as Code Security Realm-section | `"local:\n  allowsSignup: false\n  enableCaptcha: false\n  users:\n  - id: \"${chart-admin-username}\"\n    name: \"Jenkins Admin\"\n    password: \"${chart-admin-password}\""` |
| [controller.additionalExistingSecrets](./values.yaml#L488) | list | List of additional existing secrets to mount | `[]` |
| [controller.additionalPlugins](./values.yaml#L438) | list | List of plugins to install in addition to those listed in controller.installPlugins | `[]` |
| [controller.additionalSecrets](./values.yaml#L497) | list | List of additional secrets to create and mount | `[]` |
| [controller.admin.createSecret](./values.yaml#L103) | bool | Create secret for admin user | `true` |
| [controller.admin.existingSecret](./values.yaml#L106) | string | The name of an existing secret containing the admin credentials | `""` |
| [controller.admin.password](./values.yaml#L93) | string | Admin password created as a secret if `controller.admin.createSecret` is true | `<random password>` |
| [controller.admin.passwordKey](./values.yaml#L98) | string | The key in the existing admin secret containing the password | `"jenkins-admin-password"` |
| [controller.admin.userKey](./values.yaml#L96) | string | The key in the existing admin secret containing the username | `"jenkins-admin-user"` |
| [controller.admin.username](./values.yaml#L90) | string | Admin username created as a secret if `controller.admin.createSecret` is true | `"admin"` |
| [controller.affinity](./values.yaml#L700) | object | Affinity settings | `{}` |
| [controller.agentListenerEnabled](./values.yaml#L347) | bool | Create Agent listener service | `true` |
| [controller.agentListenerExternalTrafficPolicy](./values.yaml#L357) | string | Traffic Policy of for the agentListener service | `nil` |
| [controller.agentListenerHostPort](./values.yaml#L351) | string | Host port to listen for agents | `nil` |
| [controller.agentListenerLoadBalancerIP](./values.yaml#L387) | string | Static IP for the agentListener LoadBalancer | `nil` |
| [controller.agentListenerLoadBalancerSourceRanges](./values.yaml#L359) | list | Allowed inbound IP for the agentListener service | `["0.0.0.0/0"]` |
| [controller.agentListenerNodePort](./values.yaml#L353) | string | Node port to listen for agents | `nil` |
| [controller.agentListenerPort](./values.yaml#L349) | int | Listening port for agents | `50000` |
| [controller.agentListenerServiceAnnotations](./values.yaml#L382) | object | Annotations for the agentListener service | `{}` |
| [controller.agentListenerServiceType](./values.yaml#L379) | string | Defines how to expose the agentListener service | `"ClusterIP"` |
| [controller.backendconfig.annotations](./values.yaml#L826) | object | backendconfig annotations | `{}` |
| [controller.backendconfig.apiVersion](./values.yaml#L820) | string | backendconfig API version | `"extensions/v1beta1"` |
| [controller.backendconfig.enabled](./values.yaml#L818) | bool | Enables backendconfig | `false` |
| [controller.backendconfig.labels](./values.yaml#L824) | object | backendconfig labels | `{}` |
| [controller.backendconfig.name](./values.yaml#L822) | string | backendconfig name | `nil` |
| [controller.backendconfig.spec](./values.yaml#L828) | object | backendconfig spec | `{}` |
| [controller.cloudName](./values.yaml#L516) | string | Name of default cloud configuration. | `"kubernetes"` |
| [controller.cloudTraits](./values.yaml#L518) | list | Traits for the chart-generated Kubernetes cloud (for example, `ephemeralContainer`). Additional clouds inherit these unless overridden by `additionalClouds.<name>.controller.cloudTraits`. | `[]` |
| [controller.clusterIP](./values.yaml#L242) | string | k8s service clusterIP. Only used if serviceType is ClusterIP | `nil` |
| [controller.componentName](./values.yaml#L43) | string | Used for label app.kubernetes.io/component | `"jenkins-controller"` |
| [controller.containerEnv](./values.yaml#L168) | list | Environment variables for Jenkins Container | `[]` |
| [controller.containerEnvFrom](./values.yaml#L165) | list | Environment variable sources for Jenkins Container | `[]` |
| [controller.containerSecurityContext](./values.yaml#L222) | object | Allow controlling the securityContext for the jenkins container | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsUser":1000,"seccompProfile":{"type":"RuntimeDefault"}}` |
| [controller.csrf.defaultCrumbIssuer.enabled](./values.yaml#L368) | bool | Enable the default CSRF Crumb issuer | `true` |
| [controller.csrf.defaultCrumbIssuer.proxyCompatability](./values.yaml#L370) | bool | Enable proxy compatibility. This setting is ignored if you are not on the current LTS release and will be dropped with the next LTS. | `true` |
| [controller.customInitContainers](./values.yaml#L572) | list | Custom init-container specification in raw-yaml format | `[]` |
| [controller.customJenkinsLabels](./values.yaml#L81) | list | Append Jenkins labels to the controller | `[]` |
| [controller.disableRememberMe](./values.yaml#L72) | bool | Disable use of remember me | `false` |
| [controller.disabledAgentProtocols](./values.yaml#L362) | list | Disabled agent protocols | `["JNLP-connect","JNLP2-connect"]` |
| [controller.dnsConfig](./values.yaml#L724) | object | DNS config for the pod | `{}` |
| [controller.enableRawHtmlMarkupFormatter](./values.yaml#L458) | bool | Enable HTML parsing using OWASP Markup Formatter Plugin (antisamy-markup-formatter) | `false` |
| [controller.enableServiceLinks](./values.yaml#L142) | bool |  | `false` |
| [controller.executorMode](./values.yaml#L78) | string | Sets the executor mode of the Jenkins node. Possible values are "NORMAL" or "EXCLUSIVE" | `"NORMAL"` |
| [controller.existingSecret](./values.yaml#L485) | string |  | `nil` |
| [controller.extraPorts](./values.yaml#L417) | list | Optionally configure other ports to expose in the controller container | `[]` |
| [controller.fsGroup](./values.yaml#L204) | int | Deprecated in favor of `controller.podSecurityContextOverride`. uid that will be used for persistent volume. | `1000` |
| [controller.fsGroupChangePolicy](./values.yaml#L207) | string |  | `"OnRootMismatch"` |
| [controller.googlePodMonitor.enabled](./values.yaml#L912) | bool |  | `false` |
| [controller.googlePodMonitor.scrapeEndpoint](./values.yaml#L917) | string |  | `"/prometheus"` |
| [controller.googlePodMonitor.scrapeInterval](./values.yaml#L915) | string |  | `"60s"` |
| [controller.healthProbes](./values.yaml#L277) | bool | Enable Kubernetes Probes configuration configured in `controller.probes` | `true` |
| [controller.hostAliases](./values.yaml#L865) | list | Allows for adding entries to Pod /etc/hosts | `[]` |
| [controller.hostNetworking](./values.yaml#L83) | bool |  | `false` |
| [controller.httpRoute.annotations](./values.yaml#L858) | object | HTTPRoute annotations | `{}` |
| [controller.httpRoute.apiVersion](./values.yaml#L845) | string |  | `"gateway.networking.k8s.io/v1"` |
| [controller.httpRoute.enabled](./values.yaml#L844) | bool |  | `false` |
| [controller.httpRoute.extraRules](./values.yaml#L856) | list |  | `[]` |
| [controller.httpRoute.filters](./values.yaml#L860) | list | Filters applied to the default HTTPRoute rule | `[]` |
| [controller.httpRoute.hostnames](./values.yaml#L854) | list |  | `[]` |
| [controller.httpRoute.kind](./values.yaml#L846) | string |  | `"HTTPRoute"` |
| [controller.httpRoute.parentRefs](./values.yaml#L848) | list |  | `[]` |
| [controller.httpRoute.reuseIngressConfiguration](./values.yaml#L852) | bool |  | `false` |
| [controller.httpRoute.timeouts](./values.yaml#L862) | object | Timeouts applied to the default HTTPRoute rule. Requires Gateway API v1.2+ and controller support | `{}` |
| [controller.httpsKeyStore.disableSecretMount](./values.yaml#L933) | bool |  | `false` |
| [controller.httpsKeyStore.enable](./values.yaml#L924) | bool | Enables HTTPS keystore on jenkins controller | `false` |
| [controller.httpsKeyStore.fileName](./values.yaml#L941) | string | Jenkins keystore filename which will appear under controller.httpsKeyStore.path | `"keystore.jks"` |
| [controller.httpsKeyStore.httpPort](./values.yaml#L937) | int | HTTP Port that Jenkins should listen to along with HTTPS, it also serves as the liveness and readiness probes port. | `8081` |
| [controller.httpsKeyStore.jenkinsHttpsJksPasswordSecretKey](./values.yaml#L932) | string | Name of the key in the secret that contains the JKS password | `"https-jks-password"` |
| [controller.httpsKeyStore.jenkinsHttpsJksPasswordSecretName](./values.yaml#L930) | string | Name of the secret that contains the JKS password, if it is not in the same secret as the JKS file | `""` |
| [controller.httpsKeyStore.jenkinsHttpsJksSecretKey](./values.yaml#L928) | string | Name of the key in the secret that already has SSL keystore | `"jenkins-jks-file"` |
| [controller.httpsKeyStore.jenkinsHttpsJksSecretName](./values.yaml#L926) | string | Name of the secret that already has SSL keystore | `""` |
| [controller.httpsKeyStore.jenkinsKeyStoreBase64Encoded](./values.yaml#L946) | string | Base64 encoded Keystore content. Keystore must be converted to base64 then being pasted here | `nil` |
| [controller.httpsKeyStore.password](./values.yaml#L943) | string | Jenkins keystore password | `"password"` |
| [controller.httpsKeyStore.path](./values.yaml#L939) | string | Path of HTTPS keystore file | `"/var/jenkins_keystore"` |
| [controller.image.pullPolicy](./values.yaml#L56) | string | Controller image pull policy | `"Always"` |
| [controller.image.registry](./values.yaml#L46) | string | Controller image registry | `"docker.io"` |
| [controller.image.repository](./values.yaml#L48) | string | Controller image repository | `"jenkins/jenkins"` |
| [controller.image.tag](./values.yaml#L51) | string | Controller image tag override; i.e., tag: "2.440.1-jdk21" | `nil` |
| [controller.image.tagLabel](./values.yaml#L54) | string | Controller image tag label | `"jdk25"` |
| [controller.imagePullSecretName](./values.yaml#L62) | string | Controller image pull secret | `nil` |
| [controller.ingress.annotations](./values.yaml#L752) | object | Primary Ingress annotations | `{}` |
| [controller.ingress.apiVersion](./values.yaml#L748) | string | Primary Ingress API version | `"networking.k8s.io/v1"` |
| [controller.ingress.enabled](./values.yaml#L728) | bool | Enables the Primary ingress | `false` |
| [controller.ingress.hostName](./values.yaml#L768) | string | Primary Ingress hostname | `nil` |
| [controller.ingress.ingressClassName](./values.yaml#L760) | string | Primary Ingress ingressClassName | `nil` |
| [controller.ingress.labels](./values.yaml#L750) | object | Primary Ingress labels | `{}` |
| [controller.ingress.path](./values.yaml#L764) | string | Primary Ingress path | `nil` |
| [controller.ingress.pathType](./values.yaml#L743) | string | Primary Ingress rule pathType, choices are: Exact, ImplementationSpecific, Prefix | `"ImplementationSpecific"` |
| [controller.ingress.paths](./values.yaml#L732) | list | Override for the default Primary Ingress paths | `[]` |
| [controller.ingress.resourceRootUrl](./values.yaml#L770) | string | Primary Hostname to serve assets from | `nil` |
| [controller.ingress.tls](./values.yaml#L772) | list | Primary Ingress TLS configuration | `[]` |
| [controller.initConfigMap](./values.yaml#L475) | string | Name of the existing ConfigMap that contains init scripts | `nil` |
| [controller.initContainerEnv](./values.yaml#L159) | list | Environment variables for Init Container | `[]` |
| [controller.initContainerEnvFrom](./values.yaml#L155) | list | Environment variable sources for Init Container | `[]` |
| [controller.initContainerResources](./values.yaml#L146) | object | Resources allocation (Requests and Limits) for Init Container | `{}` |
| [controller.initScripts](./values.yaml#L471) | object | Map of groovy init scripts to be executed during Jenkins controller start | `{}` |
| [controller.initializeOnce](./values.yaml#L443) | bool | Initialize only on first installation. Ensures plugins do not get updated inadvertently. Requires `persistence.enabled` to be set to `true` | `false` |
| [controller.installLatestPlugins](./values.yaml#L432) | bool | Download the minimum required version or latest version of all dependencies | `true` |
| [controller.installLatestSpecifiedPlugins](./values.yaml#L435) | bool | Set to true to download the latest version of any plugin that is requested to have the latest version | `false` |
| [controller.installPlugins](./values.yaml#L424) | list | List of Jenkins plugins to install. If you don't want to install plugins, set it to `false` | `["kubernetes:4560.vc25b_83890c34","workflow-aggregator:608.v67378e9d3db_1","git:5.11.0","configuration-as-code:2151.va_012b_08f3cc4"]` |
| [controller.javaOpts](./values.yaml#L174) | string | Append to `JAVA_OPTS` env var. Put JVM options and system properties (`-D...`) here. Line breaks are replaced with spaces | `nil` |
| [controller.jenkinsAdminEmail](./values.yaml#L108) | string | Email address for the administrator of the Jenkins instance | `nil` |
| [controller.jenkinsHome](./values.yaml#L113) | string | Custom Jenkins home path | `"/var/jenkins_home"` |
| [controller.jenkinsOpts](./values.yaml#L176) | string | Append to `JENKINS_OPTS` env var. These are Jenkins command line arguments (`--...`), so system properties (`-D...`) belong in `javaOpts`. Line breaks are replaced with spaces | `nil` |
| [controller.jenkinsRef](./values.yaml#L118) | string | Custom Jenkins reference path | `"/usr/share/jenkins/ref"` |
| [controller.jenkinsUriPrefix](./values.yaml#L191) | string | Root URI Jenkins will be served on | `nil` |
| [controller.jenkinsUrl](./values.yaml#L186) | string | Set Jenkins URL if you are not using the ingress definitions provided by the chart | `nil` |
| [controller.jenkinsUrlProtocol](./values.yaml#L183) | string | Set protocol for Jenkins URL; `https` if `controller.ingress.tls`, `http` otherwise | `nil` |
| [controller.jenkinsWar](./values.yaml#L121) | string |  | `"/usr/share/jenkins/jenkins.war"` |
| [controller.jmxPort](./values.yaml#L414) | string | Open a port, for JMX stats | `nil` |
| [controller.legacyRemotingSecurityEnabled](./values.yaml#L390) | bool | Whether legacy remoting security should be enabled | `false` |
| [controller.lifecycle](./values.yaml#L64) | object | Lifecycle specification for controller-container | `{}` |
| [controller.loadBalancerIP](./values.yaml#L405) | string | Optionally assign a known public LB IP | `nil` |
| [controller.loadBalancerSourceRanges](./values.yaml#L401) | list | Allowed inbound IP addresses | `["0.0.0.0/0"]` |
| [controller.markupFormatter](./values.yaml#L462) | string | Yaml of the markup formatter to use | `"plainText"` |
| [controller.nodePort](./values.yaml#L248) | string | k8s node port. Only used if serviceType is NodePort | `nil` |
| [controller.nodeSelector](./values.yaml#L687) | object | Node labels for pod assignment | `{}` |
| [controller.numExecutors](./values.yaml#L75) | int | Set Number of executors | `0` |
| [controller.overwritePlugins](./values.yaml#L447) | bool | Overwrite installed plugins on start | `false` |
| [controller.overwritePluginsFromImage](./values.yaml#L451) | bool | Overwrite plugins that are already installed in the controller image | `true` |
| [controller.podAnnotations](./values.yaml#L708) | object | Annotations for controller pod | `{}` |
| [controller.podDisruptionBudget.annotations](./values.yaml#L341) | object |  | `{}` |
| [controller.podDisruptionBudget.apiVersion](./values.yaml#L339) | string | Policy API version | `"policy/v1beta1"` |
| [controller.podDisruptionBudget.enabled](./values.yaml#L334) | bool | Enable Kubernetes Pod Disruption Budget configuration | `false` |
| [controller.podDisruptionBudget.labels](./values.yaml#L342) | object |  | `{}` |
| [controller.podDisruptionBudget.maxUnavailable](./values.yaml#L344) | string | Number of pods that can be unavailable. Either an absolute number or a percentage | `"0"` |
| [controller.podLabels](./values.yaml#L270) | object | Custom Pod labels (an object with `label-key: label-value` pairs) | `{}` |
| [controller.podSecurityContextOverride](./values.yaml#L219) | string | Completely overwrites the contents of the pod security context, ignoring the values provided for `runAsUser` and `fsGroup` | `nil` |
| [controller.priorityClassName](./values.yaml#L705) | string | The name of a `priorityClass` to apply to the controller pod | `nil` |
| [controller.probes.livenessProbe.failureThreshold](./values.yaml#L295) | int | Set the failure threshold for the liveness probe | `5` |
| [controller.probes.livenessProbe.httpGet.path](./values.yaml#L298) | string | Set the Pod's HTTP path for the liveness probe | `"{{ default \"\" .Values.controller.jenkinsUriPrefix }}/login"` |
| [controller.probes.livenessProbe.httpGet.port](./values.yaml#L300) | string | Set the Pod's HTTP port to use for the liveness probe | `"http"` |
| [controller.probes.livenessProbe.initialDelaySeconds](./values.yaml#L309) | string | Set the initial delay for the liveness probe in seconds | `nil` |
| [controller.probes.livenessProbe.periodSeconds](./values.yaml#L302) | int | Set the time interval between two liveness probes executions in seconds | `10` |
| [controller.probes.livenessProbe.timeoutSeconds](./values.yaml#L304) | int | Set the timeout for the liveness probe in seconds | `5` |
| [controller.probes.readinessProbe.failureThreshold](./values.yaml#L313) | int | Set the failure threshold for the readiness probe | `3` |
| [controller.probes.readinessProbe.httpGet.path](./values.yaml#L316) | string | Set the Pod's HTTP path for the liveness probe | `"{{ default \"\" .Values.controller.jenkinsUriPrefix }}/login"` |
| [controller.probes.readinessProbe.httpGet.port](./values.yaml#L318) | string | Set the Pod's HTTP port to use for the readiness probe | `"http"` |
| [controller.probes.readinessProbe.initialDelaySeconds](./values.yaml#L327) | string | Set the initial delay for the readiness probe in seconds | `nil` |
| [controller.probes.readinessProbe.periodSeconds](./values.yaml#L320) | int | Set the time interval between two readiness probes executions in seconds | `10` |
| [controller.probes.readinessProbe.timeoutSeconds](./values.yaml#L322) | int | Set the timeout for the readiness probe in seconds | `5` |
| [controller.probes.startupProbe.failureThreshold](./values.yaml#L282) | int | Set the failure threshold for the startup probe | `12` |
| [controller.probes.startupProbe.httpGet.path](./values.yaml#L285) | string | Set the Pod's HTTP path for the startup probe | `"{{ default \"\" .Values.controller.jenkinsUriPrefix }}/login"` |
| [controller.probes.startupProbe.httpGet.port](./values.yaml#L287) | string | Set the Pod's HTTP port to use for the startup probe | `"http"` |
| [controller.probes.startupProbe.periodSeconds](./values.yaml#L289) | int | Set the time interval between two startup probes executions in seconds | `10` |
| [controller.probes.startupProbe.timeoutSeconds](./values.yaml#L291) | int | Set the timeout for the startup probe in seconds | `5` |
| [controller.projectNamingStrategy](./values.yaml#L454) | string |  | `"standard"` |
| [controller.prometheus.alertingRulesAdditionalLabels](./values.yaml#L898) | object | Additional labels to add to the PrometheusRule object | `{}` |
| [controller.prometheus.alertingrules](./values.yaml#L896) | list | Array of prometheus alerting rules | `[]` |
| [controller.prometheus.enabled](./values.yaml#L881) | bool | Enables prometheus service monitor | `false` |
| [controller.prometheus.metricRelabelings](./values.yaml#L908) | list |  | `[]` |
| [controller.prometheus.prometheusRuleNamespace](./values.yaml#L900) | string | Set a custom namespace where to deploy PrometheusRule resource | `""` |
| [controller.prometheus.relabelings](./values.yaml#L906) | list |  | `[]` |
| [controller.prometheus.scrapeEndpoint](./values.yaml#L891) | string | The endpoint prometheus should get metrics from | `"/prometheus"` |
| [controller.prometheus.scrapeInterval](./values.yaml#L887) | string | How often prometheus should scrape metrics | `"60s"` |
| [controller.prometheus.serviceMonitorAdditionalLabels](./values.yaml#L883) | object | Additional labels to add to the service monitor object | `{}` |
| [controller.prometheus.serviceMonitorNamespace](./values.yaml#L885) | string | Set a custom namespace where to deploy ServiceMonitor resource | `nil` |
| [controller.publishNotReadyAddresses](./values.yaml#L256) | string |  | `nil` |
| [controller.replicas](./values.yaml#L59) | int | Number of replicas. Max 1. Can be set to 0 for maintenance scenarios. | `1` |
| [controller.resources](./values.yaml#L127) | object | Resource allocation (Requests and Limits) | `{"limits":{"cpu":"2000m","memory":"4096Mi"},"requests":{"cpu":"50m","memory":"256Mi"}}` |
| [controller.revisionHistoryLimit](./values.yaml#L718) | string | Maximum number of revisions that will be maintained in the StatefulSet's revision history | `nil` |
| [controller.route.annotations](./values.yaml#L837) | object | Route annotations | `{}` |
| [controller.route.enabled](./values.yaml#L833) | bool | Enables openshift route | `false` |
| [controller.route.labels](./values.yaml#L835) | object | Route labels | `{}` |
| [controller.route.path](./values.yaml#L839) | string | Route host. When `controller.ingress.hostName` and `controller.jenkinsUrl` are not set, it is also used for the Jenkins URL (`https://<path>`, the Route terminates TLS at the edge) | `nil` |
| [controller.runAsUser](./values.yaml#L201) | int | Deprecated in favor of `controller.podSecurityContextOverride`. uid that jenkins runs with. | `1000` |
| [controller.schedulerName](./values.yaml#L683) | string | Name of the Kubernetes scheduler to use | `""` |
| [controller.scriptApproval](./values.yaml#L466) | list | List of groovy functions to approve | `[]` |
| [controller.secondaryingress.annotations](./values.yaml#L797) | object | Secondary Ingress annotations | `{}` |
| [controller.secondaryingress.apiVersion](./values.yaml#L793) | string | Secondary Ingress API version | `"networking.k8s.io/v1"` |
| [controller.secondaryingress.enabled](./values.yaml#L783) | bool | Enables the Secondary Ingress | `false` |
| [controller.secondaryingress.hostName](./values.yaml#L806) | string | Secondary Ingress hostname | `nil` |
| [controller.secondaryingress.ingressClassName](./values.yaml#L803) | string | Secondary Ingress ingressClassName | `nil` |
| [controller.secondaryingress.labels](./values.yaml#L795) | object | Secondary Ingress labels | `{}` |
| [controller.secondaryingress.pathType](./values.yaml#L789) | string | Secondary Ingress rule pathType, choices are: Exact, ImplementationSpecific, Prefix | `"ImplementationSpecific"` |
| [controller.secondaryingress.paths](./values.yaml#L787) | list | Secondary Ingress paths | `[]` |
| [controller.secondaryingress.tls](./values.yaml#L808) | string | Secondary Ingress TLS configuration | `nil` |
| [controller.secretClaims](./values.yaml#L509) | list | List of `SecretClaim` resources to create | `[]` |
| [controller.securityContextCapabilities](./values.yaml#L210) | object | Deprecated and ignored, because Kubernetes does not allow `capabilities` in the pod security context. Set capabilities with `controller.containerSecurityContext.capabilities` instead. | `{}` |
| [controller.serviceAnnotations](./values.yaml#L259) | object | Jenkins controller service annotations | `{}` |
| [controller.serviceEnabled](./values.yaml#L234) | bool | enable or disable the controller k8s service | `true` |
| [controller.serviceExternalTrafficPolicy](./values.yaml#L252) | string |  | `nil` |
| [controller.serviceLabels](./values.yaml#L265) | object | Labels for the Jenkins controller-service | `{}` |
| [controller.servicePort](./values.yaml#L244) | int | k8s service port | `8080` |
| [controller.serviceType](./values.yaml#L239) | string | k8s service type | `"ClusterIP"` |
| [controller.shareProcessNamespace](./values.yaml#L136) | bool |  | `false` |
| [controller.sidecars.additionalSidecarContainers](./values.yaml#L665) | list | Configures additional sidecar container(s) for the Jenkins controller | `[]` |
| [controller.sidecars.configAutoReload.additionalVolumeMounts](./values.yaml#L605) | list | Enables additional volume mounts for the config auto-reload container | `[]` |
| [controller.sidecars.configAutoReload.containerSecurityContext](./values.yaml#L655) | object | Enable container security context | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"seccompProfile":{"type":"RuntimeDefault"}}` |
| [controller.sidecars.configAutoReload.enabled](./values.yaml#L585) | bool | Enable Jenkins Config as Code auto-reload | `true` |
| [controller.sidecars.configAutoReload.env](./values.yaml#L637) | list | Environment variables for the Jenkins Config as Code auto-reload container | `[]` |
| [controller.sidecars.configAutoReload.envFrom](./values.yaml#L635) | list | Environment variable sources for the Jenkins Config as Code auto-reload container | `[]` |
| [controller.sidecars.configAutoReload.folder](./values.yaml#L648) | string |  | `"/var/jenkins_home/casc_configs"` |
| [controller.sidecars.configAutoReload.healthPort](./values.yaml#L595) | int | Port for sidecar health probes | `8060` |
| [controller.sidecars.configAutoReload.image.registry](./values.yaml#L588) | string | Registry for the image that triggers the reload | `"docker.io"` |
| [controller.sidecars.configAutoReload.image.repository](./values.yaml#L590) | string | Repository of the image that triggers the reload | `"kiwigrid/k8s-sidecar"` |
| [controller.sidecars.configAutoReload.image.tag](./values.yaml#L592) | string | Tag for the image that triggers the reload | `"2.14.3"` |
| [controller.sidecars.configAutoReload.imagePullPolicy](./values.yaml#L593) | string |  | `"IfNotPresent"` |
| [controller.sidecars.configAutoReload.logging](./values.yaml#L612) | object | Config auto-reload logging settings | `{"configuration":{"backupCount":3,"formatter":"JSON","logLevel":"INFO","logToConsole":true,"logToFile":false,"maxBytes":1024,"override":false}}` |
| [controller.sidecars.configAutoReload.logging.configuration.override](./values.yaml#L616) | bool | Enables custom log config utilizing using the settings below. | `false` |
| [controller.sidecars.configAutoReload.reqRetryConnect](./values.yaml#L630) | int | How many connection-related errors to retry on | `10` |
| [controller.sidecars.configAutoReload.resources](./values.yaml#L596) | object |  | `{}` |
| [controller.sidecars.configAutoReload.scheme](./values.yaml#L625) | string | The scheme to use when connecting to the Jenkins configuration as code endpoint | `"http"` |
| [controller.sidecars.configAutoReload.skipTlsVerify](./values.yaml#L627) | bool | Skip TLS verification when connecting to the Jenkins configuration as code endpoint | `false` |
| [controller.sidecars.configAutoReload.sleepTime](./values.yaml#L632) | string | How many seconds to wait before updating config-maps/secrets (sets METHOD=SLEEP on the sidecar) | `nil` |
| [controller.sidecars.configAutoReload.sshTcpPort](./values.yaml#L646) | int |  | `1044` |
| [controller.statefulSetAnnotations](./values.yaml#L710) | object | Annotations for controller StatefulSet | `{}` |
| [controller.statefulSetLabels](./values.yaml#L261) | object | Jenkins controller custom labels for the StatefulSet | `{}` |
| [controller.targetPort](./values.yaml#L246) | int | k8s target port | `8080` |
| [controller.terminationGracePeriodSeconds](./values.yaml#L693) | string | Set TerminationGracePeriodSeconds | `nil` |
| [controller.terminationMessagePath](./values.yaml#L695) | string | Set the termination message path | `nil` |
| [controller.terminationMessagePolicy](./values.yaml#L697) | string | Set the termination message policy | `nil` |
| [controller.testEnabled](./values.yaml#L920) | bool | Can be used to disable rendering controller test resources when using helm template | `true` |
| [controller.tolerations](./values.yaml#L691) | list | Toleration labels for pod assignment | `[]` |
| [controller.topologySpreadConstraints](./values.yaml#L721) | list | Topology spread constraints | `[]` |
| [controller.updateStrategy](./values.yaml#L714) | object | Update strategy for StatefulSet | `{}` |
| [controller.usePodSecurityContext](./values.yaml#L194) | bool | Enable pod security context (must be `true` if podSecurityContextOverride, runAsUser or fsGroup are set) | `true` |
| [credentialsId](./values.yaml#L27) | string | The Jenkins credentials to access the Kubernetes API server. For the default cluster it is not needed. | `nil` |
| [extraLabels](./values.yaml#L36) | object | Configures extra labels for the agent all objects | `{}` |
| [extraObjects](./values.yaml#L39) | string | Configures extra manifests | `nil` |
| [fullnameOverride](./values.yaml#L13) | string | Override the full resource names | `jenkins-(release-name)` or `jenkins` if the release-name is `jenkins` |
| [helmtest.bats.image.registry](./values.yaml#L1463) | string | Registry of the image used to test the framework | `"docker.io"` |
| [helmtest.bats.image.repository](./values.yaml#L1465) | string | Repository of the image used to test the framework | `"bats/bats"` |
| [helmtest.bats.image.tag](./values.yaml#L1467) | string | Tag of the image to test the framework | `"1.14.0"` |
| [helmtest.bats.imagePullSecretName](./values.yaml#L1460) | string | Name of the secret to be used to pull the image | `""` |
| [kubernetesServerCertificate](./values.yaml#L30) | string | PEM encoded CA certificate used to verify the Kubernetes API server, for example a remote cluster signed by a private CA. This corresponds to the "Kubernetes server certificate key" field in the kubernetes plugin UI. It is ignored when `agent.skipTlsVerify` is `true`. Never put a private key here. | `nil` |
| [kubernetesURL](./values.yaml#L24) | string | The URL of the Kubernetes API server | `"https://kubernetes.default"` |
| [nameOverride](./values.yaml#L10) | string | Override the resource name prefix | `Chart.Name` |
| [namespaceOverride](./values.yaml#L16) | string | Override the deployment namespace | `Release.Namespace` |
| [networkPolicy.apiVersion](./values.yaml#L1384) | string | NetworkPolicy ApiVersion | `"networking.k8s.io/v1"` |
| [networkPolicy.enabled](./values.yaml#L1379) | bool | Enable the creation of NetworkPolicy resources | `false` |
| [networkPolicy.externalAgents.except](./values.yaml#L1399) | list | A list of IP sub-ranges to be excluded from the allowlisted IP range | `[]` |
| [networkPolicy.externalAgents.ipCIDR](./values.yaml#L1397) | string | The IP range from which external agents are allowed to connect to controller, i.e., 172.17.0.0/16 | `nil` |
| [networkPolicy.internalAgents.allowed](./values.yaml#L1388) | bool | Allow internal agents (from the same cluster) to connect to controller. Agent pods will be filtered based on PodLabels | `true` |
| [networkPolicy.internalAgents.namespaceLabels](./values.yaml#L1392) | object | A map of labels (keys/values) that agents namespaces must have to be able to connect to controller | `{}` |
| [networkPolicy.internalAgents.podLabels](./values.yaml#L1390) | object | A map of labels (keys/values) that agent pods must have to be able to connect to controller | `{}` |
| [persistence.accessMode](./values.yaml#L1354) | string | The PVC access mode | `"ReadWriteOnce"` |
| [persistence.annotations](./values.yaml#L1350) | object | Annotations for the PVC | `{}` |
| [persistence.dataSource](./values.yaml#L1360) | object | Existing data source to clone PVC from | `{}` |
| [persistence.enabled](./values.yaml#L1334) | bool | Enable the use of a Jenkins PVC | `true` |
| [persistence.existingClaim](./values.yaml#L1340) | string | Provide the name of a PVC | `nil` |
| [persistence.labels](./values.yaml#L1352) | object | Labels for the PVC | `{}` |
| [persistence.mounts](./values.yaml#L1372) | list | Additional mounts | `[]` |
| [persistence.size](./values.yaml#L1356) | string | The size of the PVC | `"8Gi"` |
| [persistence.storageClass](./values.yaml#L1348) | string | Storage class for the PVC | `nil` |
| [persistence.subPath](./values.yaml#L1365) | string | SubPath for jenkins-home mount | `nil` |
| [persistence.volumes](./values.yaml#L1367) | list | Additional volumes | `[]` |
| [rbac.create](./values.yaml#L1406) | bool | Whether RBAC resources are created | `true` |
| [rbac.readSecrets](./values.yaml#L1408) | bool | Whether the Jenkins service account should be able to read Kubernetes secrets | `false` |
| [rbac.useOpenShiftNonRootSCC](./values.yaml#L1410) | bool | Whether the Jenkins service account should be able to use the OpenShift "nonroot" Security Context Constraints | `false` |
| [renderHelmLabels](./values.yaml#L33) | bool | Enables rendering of the helm.sh/chart label to the annotations | `true` |
| [serviceAccount.annotations](./values.yaml#L1420) | object | Configures annotations for the ServiceAccount | `{}` |
| [serviceAccount.automountServiceAccountToken](./values.yaml#L1426) | bool | Auto-mount ServiceAccount token | `true` |
| [serviceAccount.create](./values.yaml#L1414) | bool | Configures if a ServiceAccount with this name should be created | `true` |
| [serviceAccount.extraLabels](./values.yaml#L1422) | object | Configures extra labels for the ServiceAccount | `{}` |
| [serviceAccount.imagePullSecretName](./values.yaml#L1424) | string | Controller ServiceAccount image pull secret | `nil` |
| [serviceAccount.name](./values.yaml#L1418) | string |  | `nil` |
| [serviceAccountAgent.annotations](./values.yaml#L1436) | object | Configures annotations for the agent ServiceAccount | `{}` |
| [serviceAccountAgent.automountServiceAccountToken](./values.yaml#L1442) | bool | Auto-mount ServiceAccount token | `true` |
| [serviceAccountAgent.create](./values.yaml#L1430) | bool | Configures if an agent ServiceAccount should be created | `false` |
| [serviceAccountAgent.extraLabels](./values.yaml#L1438) | object | Configures extra labels for the agent ServiceAccount | `{}` |
| [serviceAccountAgent.imagePullSecretName](./values.yaml#L1440) | string | Agent ServiceAccount image pull secret | `nil` |
| [serviceAccountAgent.name](./values.yaml#L1434) | string | The name of the agent ServiceAccount to be used by access-controlled resources | `nil` |
