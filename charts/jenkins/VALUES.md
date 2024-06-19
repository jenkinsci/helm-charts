# Jenkins

## Configuration

The following tables list the configurable parameters of the Jenkins chart and their default values.

## Values

| Key | Type | Description | Default |
|:----|:-----|:---------|:------------|
| [additionalAgents](./values.yaml#L1147) | object | Configure additional | `{}` |
| [additionalClouds](./values.yaml#L1172) | object |  | `{}` |
| [agent.TTYEnabled](./values.yaml#L1065) | bool | Allocate pseudo tty to the side container | `false` |
| [agent.additionalContainers](./values.yaml#L1100) | list | Add additional containers to the agents | `[]` |
| [agent.alwaysPullImage](./values.yaml#L958) | bool | Always pull agent container image before build | `false` |
| [agent.annotations](./values.yaml#L1096) | object | Annotations to apply to the pod | `{}` |
| [agent.args](./values.yaml#L1059) | string | Arguments passed to command to execute | `"${computer.jnlpmac} ${computer.name}"` |
| [agent.command](./values.yaml#L1057) | string | Command to execute when side container starts | `nil` |
| [agent.componentName](./values.yaml#L926) | string |  | `"jenkins-agent"` |
| [agent.connectTimeout](./values.yaml#L1094) | int | Timeout in seconds for an agent to be online | `100` |
| [agent.containerCap](./values.yaml#L1067) | int | Max number of agents to launch | `10` |
| [agent.customJenkinsLabels](./values.yaml#L923) | list | Append Jenkins labels to the agent | `[]` |
| [agent.defaultsProviderTemplate](./values.yaml#L889) | string | The name of the pod template to use for providing default values | `""` |
| [agent.directConnection](./values.yaml#L929) | bool |  | `false` |
| [agent.disableDefaultAgent](./values.yaml#L1118) | bool | Disable the default Jenkins Agent configuration | `false` |
| [agent.enabled](./values.yaml#L887) | bool | Enable Kubernetes plugin jnlp-agent podTemplate | `true` |
| [agent.envVars](./values.yaml#L1040) | list | Environment variables for the agent Pod | `[]` |
| [agent.hostNetworking](./values.yaml#L937) | bool | Enables the agent to use the host network | `false` |
| [agent.idleMinutes](./values.yaml#L1072) | int | Allows the Pod to remain active for reuse until the configured number of minutes has passed since the last step was executed on it | `0` |
| [agent.image.repository](./values.yaml#L916) | string | Repository to pull the agent jnlp image from | `"jenkins/inbound-agent"` |
| [agent.image.tag](./values.yaml#L918) | string | Tag of the image to pull | `"3248.v65ecb_254c298-1"` |
| [agent.imagePullSecretName](./values.yaml#L925) | string | Name of the secret to be used to pull the image | `nil` |
| [agent.inheritYamlMergeStrategy](./values.yaml#L1092) | bool | Controls whether the defined yaml merge strategy will be inherited if another defined pod template is configured to inherit from the current one | `false` |
| [agent.jenkinsTunnel](./values.yaml#L897) | string | Overrides the Kubernetes Jenkins tunnel | `nil` |
| [agent.jenkinsUrl](./values.yaml#L893) | string | Overrides the Kubernetes Jenkins URL | `nil` |
| [agent.jnlpregistry](./values.yaml#L913) | string | Custom registry used to pull the agent jnlp image from | `nil` |
| [agent.kubernetesConnectTimeout](./values.yaml#L899) | int | The connection timeout in seconds for connections to Kubernetes API. The minimum value is 5 | `5` |
| [agent.kubernetesReadTimeout](./values.yaml#L901) | int | The read timeout in seconds for connections to Kubernetes API. The minimum value is 15 | `15` |
| [agent.livenessProbe](./values.yaml#L948) | object |  | `{}` |
| [agent.maxRequestsPerHostStr](./values.yaml#L903) | string | The maximum concurrent connections to Kubernetes API | `"32"` |
| [agent.namespace](./values.yaml#L909) | string | Namespace in which the Kubernetes agents should be launched | `nil` |
| [agent.nodeSelector](./values.yaml#L1051) | object | Node labels for pod assignment | `{}` |
| [agent.nodeUsageMode](./values.yaml#L921) | string |  | `"NORMAL"` |
| [agent.podLabels](./values.yaml#L911) | object | Custom Pod labels (an object with `label-key: label-value` pairs) | `{}` |
| [agent.podName](./values.yaml#L1069) | string | Agent Pod base name | `"default"` |
| [agent.podRetention](./values.yaml#L967) | string |  | `"Never"` |
| [agent.podTemplates](./values.yaml#L1128) | object | Configures extra pod templates for the default kubernetes cloud | `{}` |
| [agent.privileged](./values.yaml#L931) | bool | Agent privileged container | `false` |
| [agent.resources](./values.yaml#L939) | object | Resources allocation (Requests and Limits) | `{"limits":{"cpu":"512m","memory":"512Mi"},"requests":{"cpu":"512m","memory":"512Mi"}}` |
| [agent.restrictedPssSecurityContext](./values.yaml#L964) | bool | Set a restricted securityContext on jnlp containers | `false` |
| [agent.retentionTimeout](./values.yaml#L905) | int | Time in minutes after which the Kubernetes cloud plugin will clean up an idle worker that has not already terminated | `5` |
| [agent.runAsGroup](./values.yaml#L935) | string | Configure container group | `nil` |
| [agent.runAsUser](./values.yaml#L933) | string | Configure container user | `nil` |
| [agent.secretEnvVars](./values.yaml#L1044) | list | Mount a secret as environment variable | `[]` |
| [agent.showRawYaml](./values.yaml#L971) | bool |  | `true` |
| [agent.sideContainerName](./values.yaml#L1061) | string | Side container name | `"jnlp"` |
| [agent.volumes](./values.yaml#L978) | list | Additional volumes | `[]` |
| [agent.waitForPodSec](./values.yaml#L907) | int | Seconds to wait for pod to be running | `600` |
| [agent.websocket](./values.yaml#L928) | bool | Enables agent communication via websockets | `false` |
| [agent.workingDir](./values.yaml#L920) | string | Configure working directory for default agent | `"/home/jenkins/agent"` |
| [agent.workspaceVolume](./values.yaml#L1013) | object | Workspace volume (defaults to EmptyDir) | `{}` |
| [agent.yamlMergeStrategy](./values.yaml#L1090) | string | Defines how the raw yaml field gets merged with yaml definitions from inherited pod templates. Possible values: "merge" or "override" | `"override"` |
| [agent.yamlTemplate](./values.yaml#L1079) | string | The raw yaml of a Pod API Object to merge into the agent spec | `""` |
| [awsSecurityGroupPolicies.enabled](./values.yaml#L1298) | bool |  | `false` |
| [awsSecurityGroupPolicies.policies[0].name](./values.yaml#L1300) | string |  | `""` |
| [awsSecurityGroupPolicies.policies[0].podSelector](./values.yaml#L1302) | object |  | `{}` |
| [awsSecurityGroupPolicies.policies[0].securityGroupIds](./values.yaml#L1301) | list |  | `[]` |
| [checkDeprecation](./values.yaml#L1295) | bool | Checks if any deprecated values are used | `true` |
| [clusterZone](./values.yaml#L21) | string | Override the cluster name for FQDN resolving | `"cluster.local"` |
| [controller.JCasC.authorizationStrategy](./values.yaml#L533) | string | Jenkins Config as Code Authorization Strategy-section | `"loggedInUsersCanDoAnything:\n  allowAnonymousRead: false"` |
| [controller.JCasC.configMapAnnotations](./values.yaml#L538) | object | Annotations for the JCasC ConfigMap | `{}` |
| [controller.JCasC.configScripts](./values.yaml#L507) | object | List of Jenkins Config as Code scripts | `{}` |
| [controller.JCasC.configUrls](./values.yaml#L504) | list | Remote URLs for configuration files. | `[]` |
| [controller.JCasC.defaultConfig](./values.yaml#L498) | bool | Enables default Jenkins configuration via configuration as code plugin | `true` |
| [controller.JCasC.overwriteConfiguration](./values.yaml#L502) | bool | Whether Jenkins Config as Code should overwrite any existing configuration | `false` |
| [controller.JCasC.security](./values.yaml#L514) | object | Jenkins Config as Code security-section | `{"apiToken":{"creationOfLegacyTokenEnabled":false,"tokenGenerationOnCreationEnabled":false,"usageStatisticsEnabled":true}}` |
| [controller.JCasC.securityRealm](./values.yaml#L522) | string | Jenkins Config as Code Security Realm-section | `"local:\n  allowsSignup: false\n  enableCaptcha: false\n  users:\n  - id: \"${chart-admin-username}\"\n    name: \"Jenkins Admin\"\n    password: \"${chart-admin-password}\""` |
| [controller.additionalExistingSecrets](./values.yaml#L459) | list | List of additional existing secrets to mount | `[]` |
| [controller.additionalPlugins](./values.yaml#L409) | list | List of plugins to install in addition to those listed in controller.installPlugins | `[]` |
| [controller.additionalSecrets](./values.yaml#L468) | list | List of additional secrets to create and mount | `[]` |
| [controller.admin.createSecret](./values.yaml#L91) | bool | Create secret for admin user | `true` |
| [controller.admin.existingSecret](./values.yaml#L94) | string | The name of an existing secret containing the admin credentials | `""` |
| [controller.admin.password](./values.yaml#L81) | string | Admin password created as a secret if `controller.admin.createSecret` is true | `<random password>` |
| [controller.admin.passwordKey](./values.yaml#L86) | string | The key in the existing admin secret containing the password | `"jenkins-admin-password"` |
| [controller.admin.userKey](./values.yaml#L84) | string | The key in the existing admin secret containing the username | `"jenkins-admin-user"` |
| [controller.admin.username](./values.yaml#L78) | string | Admin username created as a secret if `controller.admin.createSecret` is true | `"admin"` |
| [controller.affinity](./values.yaml#L642) | object | Affinity settings | `{}` |
| [controller.agentListenerEnabled](./values.yaml#L318) | bool | Create Agent listener service | `true` |
| [controller.agentListenerExternalTrafficPolicy](./values.yaml#L328) | string | Traffic Policy of for the agentListener service | `nil` |
| [controller.agentListenerHostPort](./values.yaml#L322) | string | Host port to listen for agents | `nil` |
| [controller.agentListenerLoadBalancerIP](./values.yaml#L358) | string | Static IP for the agentListener LoadBalancer | `nil` |
| [controller.agentListenerLoadBalancerSourceRanges](./values.yaml#L330) | list | Allowed inbound IP for the agentListener service | `["0.0.0.0/0"]` |
| [controller.agentListenerNodePort](./values.yaml#L324) | string | Node port to listen for agents | `nil` |
| [controller.agentListenerPort](./values.yaml#L320) | int | Listening port for agents | `50000` |
| [controller.agentListenerServiceAnnotations](./values.yaml#L353) | object | Annotations for the agentListener service | `{}` |
| [controller.agentListenerServiceType](./values.yaml#L350) | string | Defines how to expose the agentListener service | `"ClusterIP"` |
| [controller.backendconfig.annotations](./values.yaml#L745) | object | backendconfig annotations | `{}` |
| [controller.backendconfig.apiVersion](./values.yaml#L739) | string | backendconfig API version | `"extensions/v1beta1"` |
| [controller.backendconfig.enabled](./values.yaml#L737) | bool | Enables backendconfig | `false` |
| [controller.backendconfig.labels](./values.yaml#L743) | object | backendconfig labels | `{}` |
| [controller.backendconfig.name](./values.yaml#L741) | string | backendconfig name | `nil` |
| [controller.backendconfig.spec](./values.yaml#L747) | object | backendconfig spec | `{}` |
| [controller.cloudName](./values.yaml#L487) | string | Name of default cloud configuration. | `"kubernetes"` |
| [controller.clusterIp](./values.yaml#L217) | string | k8s service clusterIP. Only used if serviceType is ClusterIP | `nil` |
| [controller.componentName](./values.yaml#L34) | string | Used for label app.kubernetes.io/component | `"jenkins-controller"` |
| [controller.containerEnv](./values.yaml#L150) | list | Environment variables for Jenkins Container | `[]` |
| [controller.containerEnvFrom](./values.yaml#L147) | list | Environment variable sources for Jenkins Container | `[]` |
| [controller.containerSecurityContext](./values.yaml#L205) | object | Allow controlling the securityContext for the jenkins container | `{"allowPrivilegeEscalation":false,"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsUser":1000}` |
| [controller.csrf.defaultCrumbIssuer.enabled](./values.yaml#L339) | bool | Enable the default CSRF Crumb issuer | `true` |
| [controller.csrf.defaultCrumbIssuer.proxyCompatability](./values.yaml#L341) | bool | Enable proxy compatibility | `true` |
| [controller.customInitContainers](./values.yaml#L541) | list | Custom init-container specification in raw-yaml format | `[]` |
| [controller.customJenkinsLabels](./values.yaml#L68) | list | Append Jenkins labels to the controller | `[]` |
| [controller.disableRememberMe](./values.yaml#L59) | bool | Disable use of remember me | `false` |
| [controller.disabledAgentProtocols](./values.yaml#L333) | list | Disabled agent protocols | `["JNLP-connect","JNLP2-connect"]` |
| [controller.enableRawHtmlMarkupFormatter](./values.yaml#L429) | bool | Enable HTML parsing using OWASP Markup Formatter Plugin (antisamy-markup-formatter) | `false` |
| [controller.executorMode](./values.yaml#L65) | string | Sets the executor mode of the Jenkins node. Possible values are "NORMAL" or "EXCLUSIVE" | `"NORMAL"` |
| [controller.existingSecret](./values.yaml#L456) | string |  | `nil` |
| [controller.extraPorts](./values.yaml#L388) | list | Optionally configure other ports to expose in the controller container | `[]` |
| [controller.fsGroup](./values.yaml#L186) | int | Deprecated in favor of `controller.podSecurityContextOverride`. uid that will be used for persistent volume. | `1000` |
| [controller.googlePodMonitor.enabled](./values.yaml#L808) | bool |  | `false` |
| [controller.googlePodMonitor.scrapeEndpoint](./values.yaml#L813) | string |  | `"/prometheus"` |
| [controller.googlePodMonitor.scrapeInterval](./values.yaml#L811) | string |  | `"60s"` |
| [controller.healthProbes](./values.yaml#L248) | bool | Enable Kubernetes Probes configuration configured in `controller.probes` | `true` |
| [controller.hostAliases](./values.yaml#L761) | list | Allows for adding entries to Pod /etc/hosts | `[]` |
| [controller.hostNetworking](./values.yaml#L70) | bool |  | `false` |
| [controller.httpsKeyStore.disableSecretMount](./values.yaml#L829) | bool |  | `false` |
| [controller.httpsKeyStore.enable](./values.yaml#L820) | bool | Enables HTTPS keystore on jenkins controller | `false` |
| [controller.httpsKeyStore.fileName](./values.yaml#L837) | string | Jenkins keystore filename which will appear under controller.httpsKeyStore.path | `"keystore.jks"` |
| [controller.httpsKeyStore.httpPort](./values.yaml#L833) | int | HTTP Port that Jenkins should listen to along with HTTPS, it also serves as the liveness and readiness probes port. | `8081` |
| [controller.httpsKeyStore.jenkinsHttpsJksPasswordSecretKey](./values.yaml#L828) | string | Name of the key in the secret that contains the JKS password | `"https-jks-password"` |
| [controller.httpsKeyStore.jenkinsHttpsJksPasswordSecretName](./values.yaml#L826) | string | Name of the secret that contains the JKS password, if it is not in the same secret as the JKS file | `""` |
| [controller.httpsKeyStore.jenkinsHttpsJksSecretKey](./values.yaml#L824) | string | Name of the key in the secret that already has ssl keystore | `"jenkins-jks-file"` |
| [controller.httpsKeyStore.jenkinsHttpsJksSecretName](./values.yaml#L822) | string | Name of the secret that already has ssl keystore | `""` |
| [controller.httpsKeyStore.jenkinsKeyStoreBase64Encoded](./values.yaml#L842) | string | Base64 encoded Keystore content. Keystore must be converted to base64 then being pasted here | `nil` |
| [controller.httpsKeyStore.password](./values.yaml#L839) | string | Jenkins keystore password | `"password"` |
| [controller.httpsKeyStore.path](./values.yaml#L835) | string | Path of HTTPS keystore file | `"/var/jenkins_keystore"` |
| [controller.image.pullPolicy](./values.yaml#L47) | string | Controller image pull policy | `"Always"` |
| [controller.image.registry](./values.yaml#L37) | string | Controller image registry | `"docker.io"` |
| [controller.image.repository](./values.yaml#L39) | string | Controller image repository | `"jenkins/jenkins"` |
| [controller.image.tag](./values.yaml#L42) | string | Controller image tag override; i.e., tag: "2.440.1-jdk17" | `nil` |
| [controller.image.tagLabel](./values.yaml#L45) | string | Controller image tag label | `"jdk17"` |
| [controller.imagePullSecretName](./values.yaml#L49) | string | Controller image pull secret | `nil` |
| [controller.ingress.annotations](./values.yaml#L684) | object | Ingress annotations | `{}` |
| [controller.ingress.apiVersion](./values.yaml#L680) | string | Ingress API version | `"extensions/v1beta1"` |
| [controller.ingress.enabled](./values.yaml#L663) | bool | Enables ingress | `false` |
| [controller.ingress.hostName](./values.yaml#L697) | string | Ingress hostname | `nil` |
| [controller.ingress.labels](./values.yaml#L682) | object | Ingress labels | `{}` |
| [controller.ingress.path](./values.yaml#L693) | string | Ingress path | `nil` |
| [controller.ingress.paths](./values.yaml#L667) | list | Override for the default Ingress paths | `[]` |
| [controller.ingress.resourceRootUrl](./values.yaml#L699) | string | Hostname to serve assets from | `nil` |
| [controller.ingress.tls](./values.yaml#L701) | list | Ingress TLS configuration | `[]` |
| [controller.initConfigMap](./values.yaml#L446) | string | Name of the existing ConfigMap that contains init scripts | `nil` |
| [controller.initContainerEnv](./values.yaml#L141) | list | Environment variables for Init Container | `[]` |
| [controller.initContainerEnvFrom](./values.yaml#L137) | list | Environment variable sources for Init Container | `[]` |
| [controller.initContainerResources](./values.yaml#L128) | object | Resources allocation (Requests and Limits) for Init Container | `{}` |
| [controller.initScripts](./values.yaml#L442) | object | Map of groovy init scripts to be executed during Jenkins controller start | `{}` |
| [controller.initializeOnce](./values.yaml#L414) | bool | Initialize only on first installation. Ensures plugins do not get updated inadvertently. Requires `persistence.enabled` to be set to `true` | `false` |
| [controller.installLatestPlugins](./values.yaml#L403) | bool | Download the minimum required version or latest version of all dependencies | `true` |
| [controller.installLatestSpecifiedPlugins](./values.yaml#L406) | bool | Set to true to download the latest version of any plugin that is requested to have the latest version | `false` |
| [controller.installPlugins](./values.yaml#L395) | list | List of Jenkins plugins to install. If you don't want to install plugins, set it to `false` | `["kubernetes:4246.v5a_12b_1fe120e","workflow-aggregator:596.v8c21c963d92d","git:5.2.2","configuration-as-code:1810.v9b_c30a_249a_4c"]` |
| [controller.javaOpts](./values.yaml#L156) | string | Append to `JAVA_OPTS` env var | `nil` |
| [controller.jenkinsAdminEmail](./values.yaml#L96) | string | Email address for the administrator of the Jenkins instance | `nil` |
| [controller.jenkinsHome](./values.yaml#L101) | string | Custom Jenkins home path | `"/var/jenkins_home"` |
| [controller.jenkinsOpts](./values.yaml#L158) | string | Append to `JENKINS_OPTS` env var | `nil` |
| [controller.jenkinsRef](./values.yaml#L106) | string | Custom Jenkins reference path | `"/usr/share/jenkins/ref"` |
| [controller.jenkinsUriPrefix](./values.yaml#L173) | string | Root URI Jenkins will be served on | `nil` |
| [controller.jenkinsUrl](./values.yaml#L168) | string | Set Jenkins URL if you are not using the ingress definitions provided by the chart | `nil` |
| [controller.jenkinsUrlProtocol](./values.yaml#L165) | string | Set protocol for Jenkins URL; `https` if `controller.ingress.tls`, `http` otherwise | `nil` |
| [controller.jenkinsWar](./values.yaml#L109) | string |  | `"/usr/share/jenkins/jenkins.war"` |
| [controller.jmxPort](./values.yaml#L385) | string | Open a port, for JMX stats | `nil` |
| [controller.legacyRemotingSecurityEnabled](./values.yaml#L361) | bool | Whether legacy remoting security should be enabled | `false` |
| [controller.lifecycle](./values.yaml#L51) | object | Lifecycle specification for controller-container | `{}` |
| [controller.loadBalancerIP](./values.yaml#L376) | string | Optionally assign a known public LB IP | `nil` |
| [controller.loadBalancerSourceRanges](./values.yaml#L372) | list | Allowed inbound IP addresses | `["0.0.0.0/0"]` |
| [controller.markupFormatter](./values.yaml#L433) | string | Yaml of the markup formatter to use | `"plainText"` |
| [controller.nodePort](./values.yaml#L223) | string | k8s node port. Only used if serviceType is NodePort | `nil` |
| [controller.nodeSelector](./values.yaml#L629) | object | Node labels for pod assignment | `{}` |
| [controller.numExecutors](./values.yaml#L62) | int | Set Number of executors | `0` |
| [controller.overwritePlugins](./values.yaml#L418) | bool | Overwrite installed plugins on start | `false` |
| [controller.overwritePluginsFromImage](./values.yaml#L422) | bool | Overwrite plugins that are already installed in the controller image | `true` |
| [controller.podAnnotations](./values.yaml#L650) | object | Annotations for controller pod | `{}` |
| [controller.podDisruptionBudget.annotations](./values.yaml#L312) | object |  | `{}` |
| [controller.podDisruptionBudget.apiVersion](./values.yaml#L310) | string | Policy API version | `"policy/v1beta1"` |
| [controller.podDisruptionBudget.enabled](./values.yaml#L305) | bool | Enable Kubernetes Pod Disruption Budget configuration | `false` |
| [controller.podDisruptionBudget.labels](./values.yaml#L313) | object |  | `{}` |
| [controller.podDisruptionBudget.maxUnavailable](./values.yaml#L315) | string | Number of pods that can be unavailable. Either an absolute number or a percentage | `"0"` |
| [controller.podLabels](./values.yaml#L241) | object | Custom Pod labels (an object with `label-key: label-value` pairs) | `{}` |
| [controller.podSecurityContextOverride](./values.yaml#L202) | string | Completely overwrites the contents of the pod security context, ignoring the values provided for `runAsUser`, `fsGroup`, and `securityContextCapabilities` | `nil` |
| [controller.priorityClassName](./values.yaml#L647) | string | The name of a `priorityClass` to apply to the controller pod | `nil` |
| [controller.probes.livenessProbe.failureThreshold](./values.yaml#L266) | int | Set the failure threshold for the liveness probe | `5` |
| [controller.probes.livenessProbe.httpGet.path](./values.yaml#L269) | string | Set the Pod's HTTP path for the liveness probe | `"{{ default \"\" .Values.controller.jenkinsUriPrefix }}/login"` |
| [controller.probes.livenessProbe.httpGet.port](./values.yaml#L271) | string | Set the Pod's HTTP port to use for the liveness probe | `"http"` |
| [controller.probes.livenessProbe.initialDelaySeconds](./values.yaml#L280) | string | Set the initial delay for the liveness probe in seconds | `nil` |
| [controller.probes.livenessProbe.periodSeconds](./values.yaml#L273) | int | Set the time interval between two liveness probes executions in seconds | `10` |
| [controller.probes.livenessProbe.timeoutSeconds](./values.yaml#L275) | int | Set the timeout for the liveness probe in seconds | `5` |
| [controller.probes.readinessProbe.failureThreshold](./values.yaml#L284) | int | Set the failure threshold for the readiness probe | `3` |
| [controller.probes.readinessProbe.httpGet.path](./values.yaml#L287) | string | Set the Pod's HTTP path for the liveness probe | `"{{ default \"\" .Values.controller.jenkinsUriPrefix }}/login"` |
| [controller.probes.readinessProbe.httpGet.port](./values.yaml#L289) | string | Set the Pod's HTTP port to use for the readiness probe | `"http"` |
| [controller.probes.readinessProbe.initialDelaySeconds](./values.yaml#L298) | string | Set the initial delay for the readiness probe in seconds | `nil` |
| [controller.probes.readinessProbe.periodSeconds](./values.yaml#L291) | int | Set the time interval between two readiness probes executions in seconds | `10` |
| [controller.probes.readinessProbe.timeoutSeconds](./values.yaml#L293) | int | Set the timeout for the readiness probe in seconds | `5` |
| [controller.probes.startupProbe.failureThreshold](./values.yaml#L253) | int | Set the failure threshold for the startup probe | `12` |
| [controller.probes.startupProbe.httpGet.path](./values.yaml#L256) | string | Set the Pod's HTTP path for the startup probe | `"{{ default \"\" .Values.controller.jenkinsUriPrefix }}/login"` |
| [controller.probes.startupProbe.httpGet.port](./values.yaml#L258) | string | Set the Pod's HTTP port to use for the startup probe | `"http"` |
| [controller.probes.startupProbe.periodSeconds](./values.yaml#L260) | int | Set the time interval between two startup probes executions in seconds | `10` |
| [controller.probes.startupProbe.timeoutSeconds](./values.yaml#L262) | int | Set the timeout for the startup probe in seconds | `5` |
| [controller.projectNamingStrategy](./values.yaml#L425) | string |  | `"standard"` |
| [controller.prometheus.alertingRulesAdditionalLabels](./values.yaml#L794) | object | Additional labels to add to the PrometheusRule object | `{}` |
| [controller.prometheus.alertingrules](./values.yaml#L792) | list | Array of prometheus alerting rules | `[]` |
| [controller.prometheus.enabled](./values.yaml#L777) | bool | Enables prometheus service monitor | `false` |
| [controller.prometheus.metricRelabelings](./values.yaml#L804) | list |  | `[]` |
| [controller.prometheus.prometheusRuleNamespace](./values.yaml#L796) | string | Set a custom namespace where to deploy PrometheusRule resource | `""` |
| [controller.prometheus.relabelings](./values.yaml#L802) | list |  | `[]` |
| [controller.prometheus.scrapeEndpoint](./values.yaml#L787) | string | The endpoint prometheus should get metrics from | `"/prometheus"` |
| [controller.prometheus.scrapeInterval](./values.yaml#L783) | string | How often prometheus should scrape metrics | `"60s"` |
| [controller.prometheus.serviceMonitorAdditionalLabels](./values.yaml#L779) | object | Additional labels to add to the service monitor object | `{}` |
| [controller.prometheus.serviceMonitorNamespace](./values.yaml#L781) | string | Set a custom namespace where to deploy ServiceMonitor resource | `nil` |
| [controller.resources](./values.yaml#L115) | object | Resource allocation (Requests and Limits) | `{"limits":{"cpu":"2000m","memory":"4096Mi"},"requests":{"cpu":"50m","memory":"256Mi"}}` |
| [controller.route.annotations](./values.yaml#L756) | object | Route annotations | `{}` |
| [controller.route.enabled](./values.yaml#L752) | bool | Enables openshift route | `false` |
| [controller.route.labels](./values.yaml#L754) | object | Route labels | `{}` |
| [controller.route.path](./values.yaml#L758) | string | Route path | `nil` |
| [controller.runAsUser](./values.yaml#L183) | int | Deprecated in favor of `controller.podSecurityContextOverride`. uid that jenkins runs with. | `1000` |
| [controller.schedulerName](./values.yaml#L625) | string | Name of the Kubernetes scheduler to use | `""` |
| [controller.scriptApproval](./values.yaml#L437) | list | List of groovy functions to approve | `[]` |
| [controller.secondaryingress.annotations](./values.yaml#L719) | object |  | `{}` |
| [controller.secondaryingress.apiVersion](./values.yaml#L717) | string |  | `"extensions/v1beta1"` |
| [controller.secondaryingress.enabled](./values.yaml#L711) | bool |  | `false` |
| [controller.secondaryingress.hostName](./values.yaml#L726) | string |  | `nil` |
| [controller.secondaryingress.labels](./values.yaml#L718) | object |  | `{}` |
| [controller.secondaryingress.paths](./values.yaml#L714) | list |  | `[]` |
| [controller.secondaryingress.tls](./values.yaml#L727) | string |  | `nil` |
| [controller.secretClaims](./values.yaml#L480) | list | List of `SecretClaim` resources to create | `[]` |
| [controller.securityContextCapabilities](./values.yaml#L192) | object |  | `{}` |
| [controller.serviceAnnotations](./values.yaml#L230) | object | Jenkins controller service annotations | `{}` |
| [controller.serviceExternalTrafficPolicy](./values.yaml#L227) | string |  | `nil` |
| [controller.serviceLabels](./values.yaml#L236) | object | Labels for the Jenkins controller-service | `{}` |
| [controller.servicePort](./values.yaml#L219) | int | k8s service port | `8080` |
| [controller.serviceType](./values.yaml#L214) | string | k8s service type | `"ClusterIP"` |
| [controller.shareProcessNamespace](./values.yaml#L124) | bool |  | `false` |
| [controller.sidecars.additionalSidecarContainers](./values.yaml#L607) | list | Configures additional sidecar container(s) for the Jenkins controller | `[]` |
| [controller.sidecars.configAutoReload.containerSecurityContext](./values.yaml#L602) | object | Enable container security context | `{"allowPrivilegeEscalation":false,"readOnlyRootFilesystem":true}` |
| [controller.sidecars.configAutoReload.enabled](./values.yaml#L554) | bool | Enables Jenkins Config as Code auto-reload | `true` |
| [controller.sidecars.configAutoReload.env](./values.yaml#L584) | object | Environment variables for the Jenkins Config as Code auto-reload container | `{}` |
| [controller.sidecars.configAutoReload.envFrom](./values.yaml#L582) | list | Environment variable sources for the Jenkins Config as Code auto-reload container | `[]` |
| [controller.sidecars.configAutoReload.folder](./values.yaml#L595) | string |  | `"/var/jenkins_home/casc_configs"` |
| [controller.sidecars.configAutoReload.image.registry](./values.yaml#L557) | string | Registry for the image that triggers the reload | `"docker.io"` |
| [controller.sidecars.configAutoReload.image.repository](./values.yaml#L559) | string | Repository of the image that triggers the reload | `"kiwigrid/k8s-sidecar"` |
| [controller.sidecars.configAutoReload.image.tag](./values.yaml#L561) | string | Tag for the image that triggers the reload | `"1.27.4"` |
| [controller.sidecars.configAutoReload.imagePullPolicy](./values.yaml#L562) | string |  | `"IfNotPresent"` |
| [controller.sidecars.configAutoReload.reqRetryConnect](./values.yaml#L577) | int | How many connection-related errors to retry on | `10` |
| [controller.sidecars.configAutoReload.resources](./values.yaml#L563) | object |  | `{}` |
| [controller.sidecars.configAutoReload.scheme](./values.yaml#L572) | string | The scheme to use when connecting to the Jenkins configuration as code endpoint | `"http"` |
| [controller.sidecars.configAutoReload.skipTlsVerify](./values.yaml#L574) | bool | Skip TLS verification when connecting to the Jenkins configuration as code endpoint | `false` |
| [controller.sidecars.configAutoReload.sleepTime](./values.yaml#L579) | string | How many seconds to wait before updating config-maps/secrets (sets METHOD=SLEEP on the sidecar) | `nil` |
| [controller.sidecars.configAutoReload.sshTcpPort](./values.yaml#L593) | int |  | `1044` |
| [controller.statefulSetAnnotations](./values.yaml#L652) | object | Annotations for controller StatefulSet | `{}` |
| [controller.statefulSetLabels](./values.yaml#L232) | object | Jenkins controller custom labels for the StatefulSet | `{}` |
| [controller.targetPort](./values.yaml#L221) | int | k8s target port | `8080` |
| [controller.terminationGracePeriodSeconds](./values.yaml#L635) | string | Set TerminationGracePeriodSeconds | `nil` |
| [controller.terminationMessagePath](./values.yaml#L637) | string | Set the termination message path | `nil` |
| [controller.terminationMessagePolicy](./values.yaml#L639) | string | Set the termination message policy | `nil` |
| [controller.testEnabled](./values.yaml#L816) | bool | Can be used to disable rendering controller test resources when using helm template | `true` |
| [controller.tolerations](./values.yaml#L633) | list | Toleration labels for pod assignment | `[]` |
| [controller.topologySpreadConstraints](./values.yaml#L659) | object | Topology spread constraints | `{}` |
| [controller.updateStrategy](./values.yaml#L656) | object | Update strategy for StatefulSet | `{}` |
| [controller.usePodSecurityContext](./values.yaml#L176) | bool | Enable pod security context (must be `true` if podSecurityContextOverride, runAsUser or fsGroup are set) | `true` |
| [credentialsId](./values.yaml#L27) | string | The Jenkins credentials to access the Kubernetes API server. For the default cluster it is not needed. | `nil` |
| [fullnameOverride](./values.yaml#L13) | string | Override the full resource names | `jenkins-(release-name)` or `jenkins` if the release-name is `jenkins` |
| [helmtest.bats.image.registry](./values.yaml#L1311) | string | Registry of the image used to test the framework | `"docker.io"` |
| [helmtest.bats.image.repository](./values.yaml#L1313) | string | Repository of the image used to test the framework | `"bats/bats"` |
| [helmtest.bats.image.tag](./values.yaml#L1315) | string | Tag of the image to test the framework | `"1.11.0"` |
| [kubernetesURL](./values.yaml#L24) | string | The URL of the Kubernetes API server | `"https://kubernetes.default"` |
| [nameOverride](./values.yaml#L10) | string | Override the resource name prefix | `Chart.Name` |
| [namespaceOverride](./values.yaml#L16) | string | Override the deployment namespace | `Release.Namespace` |
| [networkPolicy.apiVersion](./values.yaml#L1241) | string | NetworkPolicy ApiVersion | `"networking.k8s.io/v1"` |
| [networkPolicy.enabled](./values.yaml#L1236) | bool | Enable the creation of NetworkPolicy resources | `false` |
| [networkPolicy.externalAgents.except](./values.yaml#L1255) | list | A list of IP sub-ranges to be excluded from the allowlisted IP range | `[]` |
| [networkPolicy.externalAgents.ipCIDR](./values.yaml#L1253) | string | The IP range from which external agents are allowed to connect to controller, i.e., 172.17.0.0/16 | `nil` |
| [networkPolicy.internalAgents.allowed](./values.yaml#L1245) | bool | Allow internal agents (from the same cluster) to connect to controller. Agent pods will be filtered based on PodLabels | `true` |
| [networkPolicy.internalAgents.namespaceLabels](./values.yaml#L1249) | object | A map of labels (keys/values) that agents namespaces must have to be able to connect to controller | `{}` |
| [networkPolicy.internalAgents.podLabels](./values.yaml#L1247) | object | A map of labels (keys/values) that agent pods must have to be able to connect to controller | `{}` |
| [persistence.accessMode](./values.yaml#L1211) | string | The PVC access mode | `"ReadWriteOnce"` |
| [persistence.annotations](./values.yaml#L1207) | object | Annotations for the PVC | `{}` |
| [persistence.dataSource](./values.yaml#L1217) | object | Existing data source to clone PVC from | `{}` |
| [persistence.enabled](./values.yaml#L1191) | bool | Enable the use of a Jenkins PVC | `true` |
| [persistence.existingClaim](./values.yaml#L1197) | string | Provide the name of a PVC | `nil` |
| [persistence.labels](./values.yaml#L1209) | object | Labels for the PVC | `{}` |
| [persistence.mounts](./values.yaml#L1229) | list | Additional mounts | `[]` |
| [persistence.size](./values.yaml#L1213) | string | The size of the PVC | `"8Gi"` |
| [persistence.storageClass](./values.yaml#L1205) | string | Storage class for the PVC | `nil` |
| [persistence.subPath](./values.yaml#L1222) | string | SubPath for jenkins-home mount | `nil` |
| [persistence.volumes](./values.yaml#L1224) | list | Additional volumes | `[]` |
| [rbac.create](./values.yaml#L1261) | bool | Whether RBAC resources are created | `true` |
| [rbac.readSecrets](./values.yaml#L1263) | bool | Whether the Jenkins service account should be able to read Kubernetes secrets | `false` |
| [renderHelmLabels](./values.yaml#L30) | bool | Enables rendering of the helm.sh/chart label to the annotations | `true` |
| [serviceAccount.annotations](./values.yaml#L1273) | object | Configures annotations for the ServiceAccount | `{}` |
| [serviceAccount.create](./values.yaml#L1267) | bool | Configures if a ServiceAccount with this name should be created | `true` |
| [serviceAccount.extraLabels](./values.yaml#L1275) | object | Configures extra labels for the ServiceAccount | `{}` |
| [serviceAccount.imagePullSecretName](./values.yaml#L1277) | string | Controller ServiceAccount image pull secret | `nil` |
| [serviceAccount.name](./values.yaml#L1271) | string |  | `nil` |
| [serviceAccountAgent.annotations](./values.yaml#L1288) | object | Configures annotations for the agent ServiceAccount | `{}` |
| [serviceAccountAgent.create](./values.yaml#L1282) | bool | Configures if an agent ServiceAccount should be created | `false` |
| [serviceAccountAgent.extraLabels](./values.yaml#L1290) | object | Configures extra labels for the agent ServiceAccount | `{}` |
| [serviceAccountAgent.imagePullSecretName](./values.yaml#L1292) | string | Agent ServiceAccount image pull secret | `nil` |
| [serviceAccountAgent.name](./values.yaml#L1286) | string | The name of the agent ServiceAccount to be used by access-controlled resources | `nil` |
