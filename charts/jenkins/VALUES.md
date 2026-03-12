# Jenkins

## Configuration

The following tables list the configurable parameters of the Jenkins chart and their default values.

## Values

| Key | Type | Description | Default |
|:----|:-----|:---------|:------------|
| [additionalAgents](./values.yaml#L1247) | object | Configure additional | `{}` |
| [additionalClouds](./values.yaml#L1272) | object |  | `{}` |
| [agent.TTYEnabled](./values.yaml#L1152) | bool | Allocate pseudo tty to the side container | `false` |
| [agent.additionalContainers](./values.yaml#L1200) | list | Add additional containers to the agents | `[]` |
| [agent.alwaysPullImage](./values.yaml#L1045) | bool | Always pull agent container image before build | `false` |
| [agent.annotations](./values.yaml#L1196) | object | Annotations to apply to the pod | `{}` |
| [agent.args](./values.yaml#L1146) | string | Arguments passed to command to execute | `"${computer.jnlpmac} ${computer.name}"` |
| [agent.command](./values.yaml#L1144) | string | Command to execute when side container starts | `nil` |
| [agent.componentName](./values.yaml#L1013) | string |  | `"jenkins-agent"` |
| [agent.connectTimeout](./values.yaml#L1194) | int | Timeout in seconds for an agent to be online | `100` |
| [agent.containerCap](./values.yaml#L1154) | int | Max number of agents to launch for a whole cluster. | `10` |
| [agent.customJenkinsLabels](./values.yaml#L1010) | list | Append Jenkins labels to the agent | `[]` |
| [agent.defaultsProviderTemplate](./values.yaml#L962) | string | The name of the pod template to use for providing default values | `""` |
| [agent.directConnection](./values.yaml#L1016) | bool |  | `false` |
| [agent.disableDefaultAgent](./values.yaml#L1218) | bool | Disable the default Jenkins Agent configuration | `false` |
| [agent.enabled](./values.yaml#L960) | bool | Enable Kubernetes plugin jnlp-agent podTemplate | `true` |
| [agent.envVars](./values.yaml#L1127) | list | Environment variables for the agent Pod | `[]` |
| [agent.garbageCollection.enabled](./values.yaml#L1163) | bool | When enabled, Jenkins will periodically check for orphan pods that have not been touched for the given timeout period and delete them. | `false` |
| [agent.garbageCollection.namespaces](./values.yaml#L1165) | string | Namespaces to look at for garbage collection, in addition to the default namespace defined for the cloud. One namespace per line. | `""` |
| [agent.garbageCollection.timeout](./values.yaml#L1170) | int | Timeout value for orphaned pods | `300` |
| [agent.hostNetworking](./values.yaml#L1024) | bool | Enables the agent to use the host network | `false` |
| [agent.idleMinutes](./values.yaml#L1173) | int | Allows the Pod to remain active for reuse until the configured number of minutes has passed since the last step was executed on it | `0` |
| [agent.image.registry](./values.yaml#L1001) | string | Registry to pull the agent jnlp image from | `""` |
| [agent.image.repository](./values.yaml#L1003) | string | Repository to pull the agent jnlp image from | `"jenkins/inbound-agent"` |
| [agent.image.tag](./values.yaml#L1005) | string | Tag of the image to pull | `"3355.v388858a_47b_33-16"` |
| [agent.imagePullSecretName](./values.yaml#L1012) | string | Name of the secret to be used to pull the image | `nil` |
| [agent.inheritYamlMergeStrategy](./values.yaml#L1192) | bool | Controls whether the defined yaml merge strategy will be inherited if another defined pod template is configured to inherit from the current one | `false` |
| [agent.instanceCap](./values.yaml#L1156) | int | Max number of agents to launch for this type of agent | `2147483647` |
| [agent.jenkinsTunnel](./values.yaml#L978) | string | Overrides the Kubernetes Jenkins tunnel | `nil` |
| [agent.jenkinsUrl](./values.yaml#L974) | string | Overrides the Kubernetes Jenkins URL | `nil` |
| [agent.jnlpregistry](./values.yaml#L998) | string | Custom registry used to pull the agent jnlp image from | `nil` |
| [agent.kubernetesConnectTimeout](./values.yaml#L984) | int | The connection timeout in seconds for connections to Kubernetes API. The minimum value is 5 | `5` |
| [agent.kubernetesReadTimeout](./values.yaml#L986) | int | The read timeout in seconds for connections to Kubernetes API. The minimum value is 15 | `15` |
| [agent.livenessProbe](./values.yaml#L1035) | object |  | `{}` |
| [agent.maxRequestsPerHostStr](./values.yaml#L988) | string | The maximum concurrent connections to Kubernetes API | `"32"` |
| [agent.namespace](./values.yaml#L994) | string | Namespace in which the Kubernetes agents should be launched | `nil` |
| [agent.nodeSelector](./values.yaml#L1138) | object | Node labels for pod assignment | `{}` |
| [agent.nodeUsageMode](./values.yaml#L1008) | string |  | `"NORMAL"` |
| [agent.podLabels](./values.yaml#L996) | object | Custom Pod labels (an object with `label-key: label-value` pairs) | `{}` |
| [agent.podName](./values.yaml#L1158) | string | Agent Pod base name | `"default"` |
| [agent.podRetention](./values.yaml#L1054) | string |  | `"Never"` |
| [agent.podTemplates](./values.yaml#L1228) | object | Configures extra pod templates for the default kubernetes cloud | `{}` |
| [agent.privileged](./values.yaml#L1018) | bool | Agent privileged container | `false` |
| [agent.resources](./values.yaml#L1026) | object | Resources allocation (Requests and Limits) | `{"limits":{"cpu":"512m","memory":"512Mi"},"requests":{"cpu":"512m","memory":"512Mi"}}` |
| [agent.restrictedPssSecurityContext](./values.yaml#L1051) | bool | Set a restricted securityContext on jnlp containers | `false` |
| [agent.retentionTimeout](./values.yaml#L990) | int | Time in minutes after which the Kubernetes cloud plugin will clean up an idle worker that has not already terminated | `5` |
| [agent.runAsGroup](./values.yaml#L1022) | string | Configure container group | `nil` |
| [agent.runAsUser](./values.yaml#L1020) | string | Configure container user | `nil` |
| [agent.secretEnvVars](./values.yaml#L1131) | list | Mount a secret as environment variable | `[]` |
| [agent.serviceAccount](./values.yaml#L970) | string | Override the default service account | `serviceAccountAgent.name` if `agent.useDefaultServiceAccount` is `true` |
| [agent.showRawYaml](./values.yaml#L1058) | bool |  | `true` |
| [agent.sideContainerName](./values.yaml#L1148) | string | Side container name | `"jnlp"` |
| [agent.skipTlsVerify](./values.yaml#L980) | bool | Disables the verification of the controller certificate on remote connection. This flag correspond to the "Disable https certificate check" flag in kubernetes plugin UI | `false` |
| [agent.usageRestricted](./values.yaml#L982) | bool | Enable the possibility to restrict the usage of this agent to specific folder. This flag correspond to the "Restrict pipeline support to authorized folders" flag in kubernetes plugin UI | `false` |
| [agent.useDefaultServiceAccount](./values.yaml#L966) | bool | Use `serviceAccountAgent.name` as the default value for defaults template `serviceAccount` | `true` |
| [agent.volumes](./values.yaml#L1065) | list | Additional volumes | `[]` |
| [agent.waitForPodSec](./values.yaml#L992) | int | Seconds to wait for pod to be running | `600` |
| [agent.websocket](./values.yaml#L1015) | bool | Enables agent communication via websockets | `false` |
| [agent.workingDir](./values.yaml#L1007) | string | Configure working directory for default agent | `"/home/jenkins/agent"` |
| [agent.workspaceVolume](./values.yaml#L1100) | object | Workspace volume (defaults to EmptyDir) | `{}` |
| [agent.yamlMergeStrategy](./values.yaml#L1190) | string | Defines how the raw yaml field gets merged with yaml definitions from inherited pod templates. Possible values: "merge" or "override" | `"override"` |
| [agent.yamlTemplate](./values.yaml#L1179) | string | The raw yaml of a Pod API Object to merge into the agent spec | `""` |
| [awsSecurityGroupPolicies.enabled](./values.yaml#L1405) | bool |  | `false` |
| [awsSecurityGroupPolicies.policies[0].name](./values.yaml#L1407) | string |  | `""` |
| [awsSecurityGroupPolicies.policies[0].podSelector](./values.yaml#L1409) | object |  | `{}` |
| [awsSecurityGroupPolicies.policies[0].securityGroupIds](./values.yaml#L1408) | list |  | `[]` |
| [checkDeprecation](./values.yaml#L1402) | bool | Checks if any deprecated values are used | `true` |
| [clusterZone](./values.yaml#L21) | string | Override the cluster name for FQDN resolving | `"cluster.local"` |
| [controller.JCasC.authorizationStrategy](./values.yaml#L558) | string | Jenkins Config as Code Authorization Strategy-section | `"loggedInUsersCanDoAnything:\n  allowAnonymousRead: false"` |
| [controller.JCasC.configMapAnnotations](./values.yaml#L563) | object | Annotations for the JCasC ConfigMap | `{}` |
| [controller.JCasC.configScripts](./values.yaml#L532) | object | List of Jenkins Config as Code scripts | `{}` |
| [controller.JCasC.configUrls](./values.yaml#L529) | list | Remote URLs for configuration files. | `[]` |
| [controller.JCasC.defaultConfig](./values.yaml#L523) | bool | Enables default Jenkins configuration via configuration as code plugin | `true` |
| [controller.JCasC.overwriteConfiguration](./values.yaml#L527) | bool | Whether Jenkins Config as Code should overwrite any existing configuration | `false` |
| [controller.JCasC.security](./values.yaml#L539) | object | Jenkins Config as Code security-section | `{"apiToken":{"creationOfLegacyTokenEnabled":false,"tokenGenerationOnCreationEnabled":false,"usageStatisticsEnabled":true}}` |
| [controller.JCasC.securityRealm](./values.yaml#L547) | string | Jenkins Config as Code Security Realm-section | `"local:\n  allowsSignup: false\n  enableCaptcha: false\n  users:\n  - id: \"${chart-admin-username}\"\n    name: \"Jenkins Admin\"\n    password: \"${chart-admin-password}\""` |
| [controller.additionalExistingSecrets](./values.yaml#L484) | list | List of additional existing secrets to mount | `[]` |
| [controller.additionalPlugins](./values.yaml#L434) | list | List of plugins to install in addition to those listed in controller.installPlugins | `[]` |
| [controller.additionalSecrets](./values.yaml#L493) | list | List of additional secrets to create and mount | `[]` |
| [controller.admin.createSecret](./values.yaml#L100) | bool | Create secret for admin user | `true` |
| [controller.admin.existingSecret](./values.yaml#L103) | string | The name of an existing secret containing the admin credentials | `""` |
| [controller.admin.password](./values.yaml#L90) | string | Admin password created as a secret if `controller.admin.createSecret` is true | `<random password>` |
| [controller.admin.passwordKey](./values.yaml#L95) | string | The key in the existing admin secret containing the password | `"jenkins-admin-password"` |
| [controller.admin.userKey](./values.yaml#L93) | string | The key in the existing admin secret containing the username | `"jenkins-admin-user"` |
| [controller.admin.username](./values.yaml#L87) | string | Admin username created as a secret if `controller.admin.createSecret` is true | `"admin"` |
| [controller.affinity](./values.yaml#L689) | object | Affinity settings | `{}` |
| [controller.agentListenerEnabled](./values.yaml#L343) | bool | Create Agent listener service | `true` |
| [controller.agentListenerExternalTrafficPolicy](./values.yaml#L353) | string | Traffic Policy of for the agentListener service | `nil` |
| [controller.agentListenerHostPort](./values.yaml#L347) | string | Host port to listen for agents | `nil` |
| [controller.agentListenerLoadBalancerIP](./values.yaml#L383) | string | Static IP for the agentListener LoadBalancer | `nil` |
| [controller.agentListenerLoadBalancerSourceRanges](./values.yaml#L355) | list | Allowed inbound IP for the agentListener service | `["0.0.0.0/0"]` |
| [controller.agentListenerNodePort](./values.yaml#L349) | string | Node port to listen for agents | `nil` |
| [controller.agentListenerPort](./values.yaml#L345) | int | Listening port for agents | `50000` |
| [controller.agentListenerServiceAnnotations](./values.yaml#L378) | object | Annotations for the agentListener service | `{}` |
| [controller.agentListenerServiceType](./values.yaml#L375) | string | Defines how to expose the agentListener service | `"ClusterIP"` |
| [controller.backendconfig.annotations](./values.yaml#L799) | object | backendconfig annotations | `{}` |
| [controller.backendconfig.apiVersion](./values.yaml#L793) | string | backendconfig API version | `"extensions/v1beta1"` |
| [controller.backendconfig.enabled](./values.yaml#L791) | bool | Enables backendconfig | `false` |
| [controller.backendconfig.labels](./values.yaml#L797) | object | backendconfig labels | `{}` |
| [controller.backendconfig.name](./values.yaml#L795) | string | backendconfig name | `nil` |
| [controller.backendconfig.spec](./values.yaml#L801) | object | backendconfig spec | `{}` |
| [controller.cloudName](./values.yaml#L512) | string | Name of default cloud configuration. | `"kubernetes"` |
| [controller.clusterIp](./values.yaml#L238) | string | k8s service clusterIP. Only used if serviceType is ClusterIP | `nil` |
| [controller.componentName](./values.yaml#L40) | string | Used for label app.kubernetes.io/component | `"jenkins-controller"` |
| [controller.containerEnv](./values.yaml#L165) | list | Environment variables for Jenkins Container | `[]` |
| [controller.containerEnvFrom](./values.yaml#L162) | list | Environment variable sources for Jenkins Container | `[]` |
| [controller.containerSecurityContext](./values.yaml#L223) | object | Allow controlling the securityContext for the jenkins container | `{"allowPrivilegeEscalation":false,"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsUser":1000}` |
| [controller.csrf.defaultCrumbIssuer.enabled](./values.yaml#L364) | bool | Enable the default CSRF Crumb issuer | `true` |
| [controller.csrf.defaultCrumbIssuer.proxyCompatability](./values.yaml#L366) | bool | Enable proxy compatibility. This setting is ignored if you are not on the current LTS release and will be dropped with the next LTS. | `true` |
| [controller.customInitContainers](./values.yaml#L566) | list | Custom init-container specification in raw-yaml format | `[]` |
| [controller.customJenkinsLabels](./values.yaml#L78) | list | Append Jenkins labels to the controller | `[]` |
| [controller.disableRememberMe](./values.yaml#L69) | bool | Disable use of remember me | `false` |
| [controller.disabledAgentProtocols](./values.yaml#L358) | list | Disabled agent protocols | `["JNLP-connect","JNLP2-connect"]` |
| [controller.dnsConfig](./values.yaml#L709) | object | DNS config for the pod | `{}` |
| [controller.enableRawHtmlMarkupFormatter](./values.yaml#L454) | bool | Enable HTML parsing using OWASP Markup Formatter Plugin (antisamy-markup-formatter) | `false` |
| [controller.enableServiceLinks](./values.yaml#L139) | bool |  | `false` |
| [controller.executorMode](./values.yaml#L75) | string | Sets the executor mode of the Jenkins node. Possible values are "NORMAL" or "EXCLUSIVE" | `"NORMAL"` |
| [controller.existingSecret](./values.yaml#L481) | string |  | `nil` |
| [controller.extraPorts](./values.yaml#L413) | list | Optionally configure other ports to expose in the controller container | `[]` |
| [controller.fsGroup](./values.yaml#L201) | int | Deprecated in favor of `controller.podSecurityContextOverride`. uid that will be used for persistent volume. | `1000` |
| [controller.fsGroupChangePolicy](./values.yaml#L204) | string |  | `"OnRootMismatch"` |
| [controller.googlePodMonitor.enabled](./values.yaml#L881) | bool |  | `false` |
| [controller.googlePodMonitor.scrapeEndpoint](./values.yaml#L886) | string |  | `"/prometheus"` |
| [controller.googlePodMonitor.scrapeInterval](./values.yaml#L884) | string |  | `"60s"` |
| [controller.healthProbes](./values.yaml#L273) | bool | Enable Kubernetes Probes configuration configured in `controller.probes` | `true` |
| [controller.hostAliases](./values.yaml#L834) | list | Allows for adding entries to Pod /etc/hosts | `[]` |
| [controller.hostNetworking](./values.yaml#L80) | bool |  | `false` |
| [controller.httpRoute.annotations](./values.yaml#L831) | object | HTTPRoute annotations | `{}` |
| [controller.httpRoute.apiVersion](./values.yaml#L818) | string |  | `"gateway.networking.k8s.io/v1"` |
| [controller.httpRoute.enabled](./values.yaml#L817) | bool |  | `false` |
| [controller.httpRoute.extraRules](./values.yaml#L829) | list |  | `[]` |
| [controller.httpRoute.hostnames](./values.yaml#L827) | list |  | `[]` |
| [controller.httpRoute.kind](./values.yaml#L819) | string |  | `"HTTPRoute"` |
| [controller.httpRoute.parentRefs](./values.yaml#L821) | list |  | `[]` |
| [controller.httpRoute.reuseIngressConfiguration](./values.yaml#L825) | bool |  | `false` |
| [controller.httpsKeyStore.disableSecretMount](./values.yaml#L902) | bool |  | `false` |
| [controller.httpsKeyStore.enable](./values.yaml#L893) | bool | Enables HTTPS keystore on jenkins controller | `false` |
| [controller.httpsKeyStore.fileName](./values.yaml#L910) | string | Jenkins keystore filename which will appear under controller.httpsKeyStore.path | `"keystore.jks"` |
| [controller.httpsKeyStore.httpPort](./values.yaml#L906) | int | HTTP Port that Jenkins should listen to along with HTTPS, it also serves as the liveness and readiness probes port. | `8081` |
| [controller.httpsKeyStore.jenkinsHttpsJksPasswordSecretKey](./values.yaml#L901) | string | Name of the key in the secret that contains the JKS password | `"https-jks-password"` |
| [controller.httpsKeyStore.jenkinsHttpsJksPasswordSecretName](./values.yaml#L899) | string | Name of the secret that contains the JKS password, if it is not in the same secret as the JKS file | `""` |
| [controller.httpsKeyStore.jenkinsHttpsJksSecretKey](./values.yaml#L897) | string | Name of the key in the secret that already has SSL keystore | `"jenkins-jks-file"` |
| [controller.httpsKeyStore.jenkinsHttpsJksSecretName](./values.yaml#L895) | string | Name of the secret that already has SSL keystore | `""` |
| [controller.httpsKeyStore.jenkinsKeyStoreBase64Encoded](./values.yaml#L915) | string | Base64 encoded Keystore content. Keystore must be converted to base64 then being pasted here | `nil` |
| [controller.httpsKeyStore.password](./values.yaml#L912) | string | Jenkins keystore password | `"password"` |
| [controller.httpsKeyStore.path](./values.yaml#L908) | string | Path of HTTPS keystore file | `"/var/jenkins_keystore"` |
| [controller.image.pullPolicy](./values.yaml#L53) | string | Controller image pull policy | `"Always"` |
| [controller.image.registry](./values.yaml#L43) | string | Controller image registry | `"docker.io"` |
| [controller.image.repository](./values.yaml#L45) | string | Controller image repository | `"jenkins/jenkins"` |
| [controller.image.tag](./values.yaml#L48) | string | Controller image tag override; i.e., tag: "2.440.1-jdk21" | `nil` |
| [controller.image.tagLabel](./values.yaml#L51) | string | Controller image tag label | `"jdk21"` |
| [controller.imagePullSecretName](./values.yaml#L59) | string | Controller image pull secret | `nil` |
| [controller.ingress.annotations](./values.yaml#L737) | object | Ingress annotations | `{}` |
| [controller.ingress.apiVersion](./values.yaml#L733) | string | Ingress API version | `"extensions/v1beta1"` |
| [controller.ingress.enabled](./values.yaml#L713) | bool | Enables ingress | `false` |
| [controller.ingress.hostName](./values.yaml#L751) | string | Ingress hostname | `nil` |
| [controller.ingress.labels](./values.yaml#L735) | object | Ingress labels | `{}` |
| [controller.ingress.path](./values.yaml#L747) | string | Ingress path | `nil` |
| [controller.ingress.pathType](./values.yaml#L728) | string | Ingress rule pathType, choices are: Exact, ImplementationSpecific, Prefix | `"ImplementationSpecific"` |
| [controller.ingress.paths](./values.yaml#L717) | list | Override for the default Ingress paths | `[]` |
| [controller.ingress.resourceRootUrl](./values.yaml#L753) | string | Hostname to serve assets from | `nil` |
| [controller.ingress.tls](./values.yaml#L755) | list | Ingress TLS configuration | `[]` |
| [controller.initConfigMap](./values.yaml#L471) | string | Name of the existing ConfigMap that contains init scripts | `nil` |
| [controller.initContainerEnv](./values.yaml#L156) | list | Environment variables for Init Container | `[]` |
| [controller.initContainerEnvFrom](./values.yaml#L152) | list | Environment variable sources for Init Container | `[]` |
| [controller.initContainerResources](./values.yaml#L143) | object | Resources allocation (Requests and Limits) for Init Container | `{}` |
| [controller.initScripts](./values.yaml#L467) | object | Map of groovy init scripts to be executed during Jenkins controller start | `{}` |
| [controller.initializeOnce](./values.yaml#L439) | bool | Initialize only on first installation. Ensures plugins do not get updated inadvertently. Requires `persistence.enabled` to be set to `true` | `false` |
| [controller.installLatestPlugins](./values.yaml#L428) | bool | Download the minimum required version or latest version of all dependencies | `true` |
| [controller.installLatestSpecifiedPlugins](./values.yaml#L431) | bool | Set to true to download the latest version of any plugin that is requested to have the latest version | `false` |
| [controller.installPlugins](./values.yaml#L420) | list | List of Jenkins plugins to install. If you don't want to install plugins, set it to `false` | `["kubernetes:4423.vb_59f230b_ce53","workflow-aggregator:608.v67378e9d3db_1","git:5.10.0","configuration-as-code:2053.vb_0da_47381a_25"]` |
| [controller.javaOpts](./values.yaml#L171) | string | Append to `JAVA_OPTS` env var | `nil` |
| [controller.jenkinsAdminEmail](./values.yaml#L105) | string | Email address for the administrator of the Jenkins instance | `nil` |
| [controller.jenkinsHome](./values.yaml#L110) | string | Custom Jenkins home path | `"/var/jenkins_home"` |
| [controller.jenkinsOpts](./values.yaml#L173) | string | Append to `JENKINS_OPTS` env var | `nil` |
| [controller.jenkinsRef](./values.yaml#L115) | string | Custom Jenkins reference path | `"/usr/share/jenkins/ref"` |
| [controller.jenkinsUriPrefix](./values.yaml#L188) | string | Root URI Jenkins will be served on | `nil` |
| [controller.jenkinsUrl](./values.yaml#L183) | string | Set Jenkins URL if you are not using the ingress definitions provided by the chart | `nil` |
| [controller.jenkinsUrlProtocol](./values.yaml#L180) | string | Set protocol for Jenkins URL; `https` if `controller.ingress.tls`, `http` otherwise | `nil` |
| [controller.jenkinsWar](./values.yaml#L118) | string |  | `"/usr/share/jenkins/jenkins.war"` |
| [controller.jmxPort](./values.yaml#L410) | string | Open a port, for JMX stats | `nil` |
| [controller.legacyRemotingSecurityEnabled](./values.yaml#L386) | bool | Whether legacy remoting security should be enabled | `false` |
| [controller.lifecycle](./values.yaml#L61) | object | Lifecycle specification for controller-container | `{}` |
| [controller.loadBalancerIP](./values.yaml#L401) | string | Optionally assign a known public LB IP | `nil` |
| [controller.loadBalancerSourceRanges](./values.yaml#L397) | list | Allowed inbound IP addresses | `["0.0.0.0/0"]` |
| [controller.markupFormatter](./values.yaml#L458) | string | Yaml of the markup formatter to use | `"plainText"` |
| [controller.nodePort](./values.yaml#L244) | string | k8s node port. Only used if serviceType is NodePort | `nil` |
| [controller.nodeSelector](./values.yaml#L676) | object | Node labels for pod assignment | `{}` |
| [controller.numExecutors](./values.yaml#L72) | int | Set Number of executors | `0` |
| [controller.overwritePlugins](./values.yaml#L443) | bool | Overwrite installed plugins on start | `false` |
| [controller.overwritePluginsFromImage](./values.yaml#L447) | bool | Overwrite plugins that are already installed in the controller image | `true` |
| [controller.podAnnotations](./values.yaml#L697) | object | Annotations for controller pod | `{}` |
| [controller.podDisruptionBudget.annotations](./values.yaml#L337) | object |  | `{}` |
| [controller.podDisruptionBudget.apiVersion](./values.yaml#L335) | string | Policy API version | `"policy/v1beta1"` |
| [controller.podDisruptionBudget.enabled](./values.yaml#L330) | bool | Enable Kubernetes Pod Disruption Budget configuration | `false` |
| [controller.podDisruptionBudget.labels](./values.yaml#L338) | object |  | `{}` |
| [controller.podDisruptionBudget.maxUnavailable](./values.yaml#L340) | string | Number of pods that can be unavailable. Either an absolute number or a percentage | `"0"` |
| [controller.podLabels](./values.yaml#L266) | object | Custom Pod labels (an object with `label-key: label-value` pairs) | `{}` |
| [controller.podSecurityContextOverride](./values.yaml#L220) | string | Completely overwrites the contents of the pod security context, ignoring the values provided for `runAsUser`, `fsGroup`, and `securityContextCapabilities` | `nil` |
| [controller.priorityClassName](./values.yaml#L694) | string | The name of a `priorityClass` to apply to the controller pod | `nil` |
| [controller.probes.livenessProbe.failureThreshold](./values.yaml#L291) | int | Set the failure threshold for the liveness probe | `5` |
| [controller.probes.livenessProbe.httpGet.path](./values.yaml#L294) | string | Set the Pod's HTTP path for the liveness probe | `"{{ default \"\" .Values.controller.jenkinsUriPrefix }}/login"` |
| [controller.probes.livenessProbe.httpGet.port](./values.yaml#L296) | string | Set the Pod's HTTP port to use for the liveness probe | `"http"` |
| [controller.probes.livenessProbe.initialDelaySeconds](./values.yaml#L305) | string | Set the initial delay for the liveness probe in seconds | `nil` |
| [controller.probes.livenessProbe.periodSeconds](./values.yaml#L298) | int | Set the time interval between two liveness probes executions in seconds | `10` |
| [controller.probes.livenessProbe.timeoutSeconds](./values.yaml#L300) | int | Set the timeout for the liveness probe in seconds | `5` |
| [controller.probes.readinessProbe.failureThreshold](./values.yaml#L309) | int | Set the failure threshold for the readiness probe | `3` |
| [controller.probes.readinessProbe.httpGet.path](./values.yaml#L312) | string | Set the Pod's HTTP path for the liveness probe | `"{{ default \"\" .Values.controller.jenkinsUriPrefix }}/login"` |
| [controller.probes.readinessProbe.httpGet.port](./values.yaml#L314) | string | Set the Pod's HTTP port to use for the readiness probe | `"http"` |
| [controller.probes.readinessProbe.initialDelaySeconds](./values.yaml#L323) | string | Set the initial delay for the readiness probe in seconds | `nil` |
| [controller.probes.readinessProbe.periodSeconds](./values.yaml#L316) | int | Set the time interval between two readiness probes executions in seconds | `10` |
| [controller.probes.readinessProbe.timeoutSeconds](./values.yaml#L318) | int | Set the timeout for the readiness probe in seconds | `5` |
| [controller.probes.startupProbe.failureThreshold](./values.yaml#L278) | int | Set the failure threshold for the startup probe | `12` |
| [controller.probes.startupProbe.httpGet.path](./values.yaml#L281) | string | Set the Pod's HTTP path for the startup probe | `"{{ default \"\" .Values.controller.jenkinsUriPrefix }}/login"` |
| [controller.probes.startupProbe.httpGet.port](./values.yaml#L283) | string | Set the Pod's HTTP port to use for the startup probe | `"http"` |
| [controller.probes.startupProbe.periodSeconds](./values.yaml#L285) | int | Set the time interval between two startup probes executions in seconds | `10` |
| [controller.probes.startupProbe.timeoutSeconds](./values.yaml#L287) | int | Set the timeout for the startup probe in seconds | `5` |
| [controller.projectNamingStrategy](./values.yaml#L450) | string |  | `"standard"` |
| [controller.prometheus.alertingRulesAdditionalLabels](./values.yaml#L867) | object | Additional labels to add to the PrometheusRule object | `{}` |
| [controller.prometheus.alertingrules](./values.yaml#L865) | list | Array of prometheus alerting rules | `[]` |
| [controller.prometheus.enabled](./values.yaml#L850) | bool | Enables prometheus service monitor | `false` |
| [controller.prometheus.metricRelabelings](./values.yaml#L877) | list |  | `[]` |
| [controller.prometheus.prometheusRuleNamespace](./values.yaml#L869) | string | Set a custom namespace where to deploy PrometheusRule resource | `""` |
| [controller.prometheus.relabelings](./values.yaml#L875) | list |  | `[]` |
| [controller.prometheus.scrapeEndpoint](./values.yaml#L860) | string | The endpoint prometheus should get metrics from | `"/prometheus"` |
| [controller.prometheus.scrapeInterval](./values.yaml#L856) | string | How often prometheus should scrape metrics | `"60s"` |
| [controller.prometheus.serviceMonitorAdditionalLabels](./values.yaml#L852) | object | Additional labels to add to the service monitor object | `{}` |
| [controller.prometheus.serviceMonitorNamespace](./values.yaml#L854) | string | Set a custom namespace where to deploy ServiceMonitor resource | `nil` |
| [controller.publishNotReadyAddresses](./values.yaml#L252) | string |  | `nil` |
| [controller.replicas](./values.yaml#L56) | int | Number of replicas. Max 1. Can be set to 0 for maintenance scenarios. | `1` |
| [controller.resources](./values.yaml#L124) | object | Resource allocation (Requests and Limits) | `{"limits":{"cpu":"2000m","memory":"4096Mi"},"requests":{"cpu":"50m","memory":"256Mi"}}` |
| [controller.route.annotations](./values.yaml#L810) | object | Route annotations | `{}` |
| [controller.route.enabled](./values.yaml#L806) | bool | Enables openshift route | `false` |
| [controller.route.labels](./values.yaml#L808) | object | Route labels | `{}` |
| [controller.route.path](./values.yaml#L812) | string | Route path | `nil` |
| [controller.runAsUser](./values.yaml#L198) | int | Deprecated in favor of `controller.podSecurityContextOverride`. uid that jenkins runs with. | `1000` |
| [controller.schedulerName](./values.yaml#L672) | string | Name of the Kubernetes scheduler to use | `""` |
| [controller.scriptApproval](./values.yaml#L462) | list | List of groovy functions to approve | `[]` |
| [controller.secondaryingress.annotations](./values.yaml#L773) | object |  | `{}` |
| [controller.secondaryingress.apiVersion](./values.yaml#L771) | string |  | `"extensions/v1beta1"` |
| [controller.secondaryingress.enabled](./values.yaml#L765) | bool |  | `false` |
| [controller.secondaryingress.hostName](./values.yaml#L780) | string |  | `nil` |
| [controller.secondaryingress.labels](./values.yaml#L772) | object |  | `{}` |
| [controller.secondaryingress.paths](./values.yaml#L768) | list |  | `[]` |
| [controller.secondaryingress.tls](./values.yaml#L781) | string |  | `nil` |
| [controller.secretClaims](./values.yaml#L505) | list | List of `SecretClaim` resources to create | `[]` |
| [controller.securityContextCapabilities](./values.yaml#L210) | object |  | `{}` |
| [controller.serviceAnnotations](./values.yaml#L255) | object | Jenkins controller service annotations | `{}` |
| [controller.serviceEnabled](./values.yaml#L230) | bool | enable or disable the controller k8s service | `true` |
| [controller.serviceExternalTrafficPolicy](./values.yaml#L248) | string |  | `nil` |
| [controller.serviceLabels](./values.yaml#L261) | object | Labels for the Jenkins controller-service | `{}` |
| [controller.servicePort](./values.yaml#L240) | int | k8s service port | `8080` |
| [controller.serviceType](./values.yaml#L235) | string | k8s service type | `"ClusterIP"` |
| [controller.shareProcessNamespace](./values.yaml#L133) | bool |  | `false` |
| [controller.sidecars.additionalSidecarContainers](./values.yaml#L654) | list | Configures additional sidecar container(s) for the Jenkins controller | `[]` |
| [controller.sidecars.configAutoReload.additionalVolumeMounts](./values.yaml#L599) | list | Enables additional volume mounts for the config auto-reload container | `[]` |
| [controller.sidecars.configAutoReload.containerSecurityContext](./values.yaml#L649) | object | Enable container security context | `{"allowPrivilegeEscalation":false,"readOnlyRootFilesystem":true}` |
| [controller.sidecars.configAutoReload.enabled](./values.yaml#L579) | bool | Enable Jenkins Config as Code auto-reload | `true` |
| [controller.sidecars.configAutoReload.env](./values.yaml#L631) | list | Environment variables for the Jenkins Config as Code auto-reload container | `[]` |
| [controller.sidecars.configAutoReload.envFrom](./values.yaml#L629) | list | Environment variable sources for the Jenkins Config as Code auto-reload container | `[]` |
| [controller.sidecars.configAutoReload.folder](./values.yaml#L642) | string |  | `"/var/jenkins_home/casc_configs"` |
| [controller.sidecars.configAutoReload.healthPort](./values.yaml#L589) | int | Port for sidecar health probes | `8060` |
| [controller.sidecars.configAutoReload.image.registry](./values.yaml#L582) | string | Registry for the image that triggers the reload | `"docker.io"` |
| [controller.sidecars.configAutoReload.image.repository](./values.yaml#L584) | string | Repository of the image that triggers the reload | `"kiwigrid/k8s-sidecar"` |
| [controller.sidecars.configAutoReload.image.tag](./values.yaml#L586) | string | Tag for the image that triggers the reload | `"2.5.0"` |
| [controller.sidecars.configAutoReload.imagePullPolicy](./values.yaml#L587) | string |  | `"IfNotPresent"` |
| [controller.sidecars.configAutoReload.logging](./values.yaml#L606) | object | Config auto-reload logging settings | `{"configuration":{"backupCount":3,"formatter":"JSON","logLevel":"INFO","logToConsole":true,"logToFile":false,"maxBytes":1024,"override":false}}` |
| [controller.sidecars.configAutoReload.logging.configuration.override](./values.yaml#L610) | bool | Enables custom log config utilizing using the settings below. | `false` |
| [controller.sidecars.configAutoReload.reqRetryConnect](./values.yaml#L624) | int | How many connection-related errors to retry on | `10` |
| [controller.sidecars.configAutoReload.resources](./values.yaml#L590) | object |  | `{}` |
| [controller.sidecars.configAutoReload.scheme](./values.yaml#L619) | string | The scheme to use when connecting to the Jenkins configuration as code endpoint | `"http"` |
| [controller.sidecars.configAutoReload.skipTlsVerify](./values.yaml#L621) | bool | Skip TLS verification when connecting to the Jenkins configuration as code endpoint | `false` |
| [controller.sidecars.configAutoReload.sleepTime](./values.yaml#L626) | string | How many seconds to wait before updating config-maps/secrets (sets METHOD=SLEEP on the sidecar) | `nil` |
| [controller.sidecars.configAutoReload.sshTcpPort](./values.yaml#L640) | int |  | `1044` |
| [controller.statefulSetAnnotations](./values.yaml#L699) | object | Annotations for controller StatefulSet | `{}` |
| [controller.statefulSetLabels](./values.yaml#L257) | object | Jenkins controller custom labels for the StatefulSet | `{}` |
| [controller.targetPort](./values.yaml#L242) | int | k8s target port | `8080` |
| [controller.terminationGracePeriodSeconds](./values.yaml#L682) | string | Set TerminationGracePeriodSeconds | `nil` |
| [controller.terminationMessagePath](./values.yaml#L684) | string | Set the termination message path | `nil` |
| [controller.terminationMessagePolicy](./values.yaml#L686) | string | Set the termination message policy | `nil` |
| [controller.testEnabled](./values.yaml#L889) | bool | Can be used to disable rendering controller test resources when using helm template | `true` |
| [controller.tolerations](./values.yaml#L680) | list | Toleration labels for pod assignment | `[]` |
| [controller.topologySpreadConstraints](./values.yaml#L706) | object | Topology spread constraints | `{}` |
| [controller.updateStrategy](./values.yaml#L703) | object | Update strategy for StatefulSet | `{}` |
| [controller.usePodSecurityContext](./values.yaml#L191) | bool | Enable pod security context (must be `true` if podSecurityContextOverride, runAsUser or fsGroup are set) | `true` |
| [credentialsId](./values.yaml#L27) | string | The Jenkins credentials to access the Kubernetes API server. For the default cluster it is not needed. | `nil` |
| [extraLabels](./values.yaml#L33) | object | Configures extra labels for the agent all objects | `{}` |
| [extraObjects](./values.yaml#L36) | string | Configures extra manifests | `nil` |
| [fullnameOverride](./values.yaml#L13) | string | Override the full resource names | `jenkins-(release-name)` or `jenkins` if the release-name is `jenkins` |
| [helmtest.bats.image.registry](./values.yaml#L1418) | string | Registry of the image used to test the framework | `"docker.io"` |
| [helmtest.bats.image.repository](./values.yaml#L1420) | string | Repository of the image used to test the framework | `"bats/bats"` |
| [helmtest.bats.image.tag](./values.yaml#L1422) | string | Tag of the image to test the framework | `"1.13.0"` |
| [kubernetesURL](./values.yaml#L24) | string | The URL of the Kubernetes API server | `"https://kubernetes.default"` |
| [nameOverride](./values.yaml#L10) | string | Override the resource name prefix | `Chart.Name` |
| [namespaceOverride](./values.yaml#L16) | string | Override the deployment namespace | `Release.Namespace` |
| [networkPolicy.apiVersion](./values.yaml#L1341) | string | NetworkPolicy ApiVersion | `"networking.k8s.io/v1"` |
| [networkPolicy.enabled](./values.yaml#L1336) | bool | Enable the creation of NetworkPolicy resources | `false` |
| [networkPolicy.externalAgents.except](./values.yaml#L1356) | list | A list of IP sub-ranges to be excluded from the allowlisted IP range | `[]` |
| [networkPolicy.externalAgents.ipCIDR](./values.yaml#L1354) | string | The IP range from which external agents are allowed to connect to controller, i.e., 172.17.0.0/16 | `nil` |
| [networkPolicy.internalAgents.allowed](./values.yaml#L1345) | bool | Allow internal agents (from the same cluster) to connect to controller. Agent pods will be filtered based on PodLabels | `true` |
| [networkPolicy.internalAgents.namespaceLabels](./values.yaml#L1349) | object | A map of labels (keys/values) that agents namespaces must have to be able to connect to controller | `{}` |
| [networkPolicy.internalAgents.podLabels](./values.yaml#L1347) | object | A map of labels (keys/values) that agent pods must have to be able to connect to controller | `{}` |
| [persistence.accessMode](./values.yaml#L1311) | string | The PVC access mode | `"ReadWriteOnce"` |
| [persistence.annotations](./values.yaml#L1307) | object | Annotations for the PVC | `{}` |
| [persistence.dataSource](./values.yaml#L1317) | object | Existing data source to clone PVC from | `{}` |
| [persistence.enabled](./values.yaml#L1291) | bool | Enable the use of a Jenkins PVC | `true` |
| [persistence.existingClaim](./values.yaml#L1297) | string | Provide the name of a PVC | `nil` |
| [persistence.labels](./values.yaml#L1309) | object | Labels for the PVC | `{}` |
| [persistence.mounts](./values.yaml#L1329) | list | Additional mounts | `[]` |
| [persistence.size](./values.yaml#L1313) | string | The size of the PVC | `"8Gi"` |
| [persistence.storageClass](./values.yaml#L1305) | string | Storage class for the PVC | `nil` |
| [persistence.subPath](./values.yaml#L1322) | string | SubPath for jenkins-home mount | `nil` |
| [persistence.volumes](./values.yaml#L1324) | list | Additional volumes | `[]` |
| [rbac.create](./values.yaml#L1363) | bool | Whether RBAC resources are created | `true` |
| [rbac.readSecrets](./values.yaml#L1365) | bool | Whether the Jenkins service account should be able to read Kubernetes secrets | `false` |
| [rbac.useOpenShiftNonRootSCC](./values.yaml#L1367) | bool | Whether the Jenkins service account should be able to use the OpenShift "nonroot" Security Context Constraints | `false` |
| [renderHelmLabels](./values.yaml#L30) | bool | Enables rendering of the helm.sh/chart label to the annotations | `true` |
| [serviceAccount.annotations](./values.yaml#L1377) | object | Configures annotations for the ServiceAccount | `{}` |
| [serviceAccount.automountServiceAccountToken](./values.yaml#L1383) | bool | Auto-mount ServiceAccount token | `true` |
| [serviceAccount.create](./values.yaml#L1371) | bool | Configures if a ServiceAccount with this name should be created | `true` |
| [serviceAccount.extraLabels](./values.yaml#L1379) | object | Configures extra labels for the ServiceAccount | `{}` |
| [serviceAccount.imagePullSecretName](./values.yaml#L1381) | string | Controller ServiceAccount image pull secret | `nil` |
| [serviceAccount.name](./values.yaml#L1375) | string |  | `nil` |
| [serviceAccountAgent.annotations](./values.yaml#L1393) | object | Configures annotations for the agent ServiceAccount | `{}` |
| [serviceAccountAgent.automountServiceAccountToken](./values.yaml#L1399) | bool | Auto-mount ServiceAccount token | `true` |
| [serviceAccountAgent.create](./values.yaml#L1387) | bool | Configures if an agent ServiceAccount should be created | `false` |
| [serviceAccountAgent.extraLabels](./values.yaml#L1395) | object | Configures extra labels for the agent ServiceAccount | `{}` |
| [serviceAccountAgent.imagePullSecretName](./values.yaml#L1397) | string | Agent ServiceAccount image pull secret | `nil` |
| [serviceAccountAgent.name](./values.yaml#L1391) | string | The name of the agent ServiceAccount to be used by access-controlled resources | `nil` |
