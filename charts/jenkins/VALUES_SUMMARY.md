# Jenkins

## Configuration

The following tables list the configurable parameters of the Jenkins chart and their default values.

### Jenkins Master
| Parameter                         | Description                          | Default                                   |
| --------------------------------- | ------------------------------------ | ----------------------------------------- |
| `checkDeprecation`                | Checks for deprecated values used    | `true`                                 |
| `clusterZone`                     | Override the cluster name for FQDN resolving    | `cluster.local`                |
| `nameOverride`                    | Override the resource name prefix    | `jenkins`                                 |
| `renderHelmLabels`                | Enables rendering of the helm.sh/chart label to the annotations    | `true`                                 |
| `fullnameOverride`                | Override the full resource names     | `jenkins-{release-name}` (or `jenkins` if release-name is `jenkins`) |
| `namespaceOverride`               | Override the deployment namespace    | Not set (`Release.Namespace`)             |
| `master.componentName`            | Jenkins master name                  | `jenkins-master`                          |
| `master.enableXmlConfig`          | enables configuration done via XML files | `false`                               |
| `master.testEnabled`              | Can be used to disable rendering test resources when using helm template | `true`                         |

#### Jenkins Configuration as Code (JCasC)
| Parameter                         | Description                          | Default                                   |
| --------------------------------- | ------------------------------------ | ----------------------------------------- |
| `master.JCasC.enabled`            | Whether Jenkins Configuration as Code is enabled or not | `true`                  |
| `master.JCasC.defaultConfig`      | Enables default Jenkins configuration via configuration as code plugin | `true`  |
| `master.JCasC.configScripts`      | List of Jenkins Config as Code scripts | `{}`                                    |
| `master.JCasC.securityRealm`      | Jenkins Config as Code for Security Realm | `legacy`                             |
| `master.JCasC.authorizationStrategy` | Jenkins Config as Code for Authorization Strategy | `loggedInUsersCanDoAnything` |
| `master.sidecars.configAutoReload` | Jenkins Config as Code auto-reload settings |                                   |
| `master.sidecars.configAutoReload.enabled` | Jenkins Config as Code auto-reload settings (Attention: rbac needs to be enabled otherwise the sidecar can't read the config map) | `true`                                                      |
| `master.sidecars.configAutoReload.image` | Image which triggers the reload | `kiwigrid/k8s-sidecar:0.1.144`           |
| `master.sidecars.configAutoReload.reqRetryConnect` | How many connection-related errors to retry on  | `10`          |
| `master.sidecars.configAutoReload.env` | Environment variables for the Jenkins Config as Code auto-reload container  | Not set |

#### Jenkins Configuration Files & Scripts
| Parameter                         | Description                          | Default                                   |
| --------------------------------- | ------------------------------------ | ----------------------------------------- |
| `master.initScripts`              | List of Jenkins init scripts         | `[]`                                      |
| `master.overwriteConfig`          | Replace init scripts and config w/ ConfigMap on boot  | `false`                  |
| `master.credentialsXmlSecret`     | Kubernetes secret that contains a 'credentials.xml' file | Not set               |
| `master.secretsFilesSecret`       | Kubernetes secret that contains 'secrets' files | Not set                        |
| `master.jobs`                     | Jenkins XML job configs              | `{}`                                      |
| `master.overwriteJobs`            | Replace jobs w/ ConfigMap on boot    | `false`                                   |

#### Jenkins Global Security
| Parameter                         | Description                          | Default                                   |
| --------------------------------- | ------------------------------------ | ----------------------------------------- |
| `master.useSecurity`              | Use basic security                   | `true`                                    |
| `master.disableRememberMe`        | Disable use of remember me           | `false`                                   |
| `master.securityRealm`            | Jenkins XML for Security Realm       | XML for `LegacySecurityRealm`             |
| `master.authorizationStrategy`    | Jenkins XML for Authorization Strategy | XML for `FullControlOnceLoggedInAuthorizationStrategy` |
| `master.enableRawHtmlMarkupFormatter` | Enable HTML parsing using (see below) | false                                |
| `master.markupFormatter`          | Yaml of the markup formatter to use  | `plainText`                               |
| `master.disabledAgentProtocols`   | Disabled agent protocols             | `JNLP-connect JNLP2-connect`              |
| `master.csrf.defaultCrumbIssuer.enabled` | Enable the default CSRF Crumb issuer | `true`                             |
| `master.csrf.defaultCrumbIssuer.proxyCompatability` | Enable proxy compatibility | `true`                            |
| `master.cli`                      | Enable CLI over remoting             | `false`                                   |

#### Jenkins Global Settings
| Parameter                         | Description                          | Default                                   |
| --------------------------------- | ------------------------------------ | ----------------------------------------- |
| `master.numExecutors`             | Set Number of executors              | 0                                         |
| `master.executorMode`             | Set executor mode of the Jenkins node. Possible values are: NORMAL or EXCLUSIVE | NORMAL |
| `master.customJenkinsLabels`      | Append Jenkins labels to the master  | `{}`                                      |
| `master.jenkinsHome`              | Custom Jenkins home path             | `/var/jenkins_home`                       |
| `master.jenkinsRef`               | Custom Jenkins reference path        | `/usr/share/jenkins/ref`                  |
| `master.jenkinsAdminEmail`        | Email address for the administrator of the Jenkins instance | Not set            |
| `master.jenkinsUrlProtocol`       | Set protocol for JenkinsLocationConfiguration.xml | Set to `https` if `Master.ingress.tls`, `http` otherwise |
| `master.jenkinsUriPrefix`         | Root Uri Jenkins will be served on   | Not set                                   |

#### Jenkins In-Process Script Approval
| Parameter                         | Description                          | Default                                   |
| --------------------------------- | ------------------------------------ | ----------------------------------------- |
| `master.scriptApproval`           | List of groovy functions to approve  | `[]`                                      |

#### Jenkins Plugins
| Parameter                         | Description                          | Default                                   |
| --------------------------------- | ------------------------------------ | ----------------------------------------- |
| `master.installPlugins`           | List of Jenkins plugins to install. If you don't want to install plugins set it to `[]` | `kubernetes:1.18.2 workflow-aggregator:2.6 credentials-binding:1.19 git:3.11.0 workflow-job:2.33` |
| `master.additionalPlugins`        | List of Jenkins plugins to install in addition to those listed in master.installPlugins | `[]` |
| `master.initializeOnce`           | Initialize only on first install. Ensures plugins do not get updated inadvertently. Requires `persistence.enabled` to be set to `true`. | `false` |
| `master.overwritePlugins`         | Overwrite installed plugins on start.| `false`                                   |
| `master.overwritePluginsFromImage` | Keep plugins that are already installed in the master image.| `true`            |

#### Jenkins Kubernetes Plugin
| Parameter                         | Description                          | Default                                   |
| --------------------------------- | ------------------------------------ | ----------------------------------------- |
| `master.slaveListenerPort`        | Listening port for agents            | `50000`                                   |
| `master.slaveHostPort`            | Host port to listen for agents            | Not set                              |
| `master.slaveKubernetesNamespace` | Namespace in which the Kubernetes agents should be launched  | Not set           |
| `master.slaveDefaultsProviderTemplate` | The name of the pod template to use for providing default values | Not set  |
| `master.slaveJenkinsUrl`          | Overrides the Kubernetes Jenkins URL    | Not set                                |
| `master.slaveJenkinsTunnel`       | Overrides the Kubernetes Jenkins tunnel | Not set                                |
| `master.slaveConnectTimeout`      | The connection timeout in seconds for connections to Kubernetes API. Minimum value is 5. | 5 |
| `master.slaveReadTimeout`         | The read timeout in seconds for connections to Kubernetes API. Minimum value is 15. | 15 |
| `master.slaveListenerServiceType` | Defines how to expose the slaveListener service | `ClusterIP`                    |
| `master.slaveListenerLoadBalancerIP`  | Static IP for the slaveListener LoadBalancer | Not set                       |

#### Kubernetes Deployment & Service
| Parameter                         | Description                          | Default                                   |
| --------------------------------- | ------------------------------------ | ----------------------------------------- |
| `master.image`                    | Master image name                    | `jenkins/jenkins`                         |
| `master.tag`                      | Master image tag                     | `lts`                                     |
| `master.imagePullPolicy`          | Master image pull policy             | `Always`                                  |
| `master.imagePullSecretName`      | Master image pull secret             | Not set                                   |
| `master.resources`                | Resources allocation (Requests and Limits) | `{requests: {cpu: 50m, memory: 256Mi}, limits: {cpu: 2000m, memory: 4096Mi}}`|
| `master.initContainerEnv`         | Environment variables for Init Container                                 | Not set |
| `master.containerEnv`             | Environment variables for Jenkins Container                              | Not set |
| `master.usePodSecurityContext`    | Enable pod security context (must be `true` if `runAsUser` or `fsGroup` are set) | `true` |
| `master.runAsUser`                | uid that jenkins runs with           | `1000`                                    |
| `master.fsGroup`                  | uid that will be used for persistent volume | `1000`                             |
| `master.hostAliases`              | Aliases for IPs in `/etc/hosts`      | `[]`                                      |
| `master.serviceAnnotations`       | Service annotations                  | `{}`                                      |
| `master.serviceType`              | k8s service type                     | `ClusterIP`                               |
| `master.clusterIP`                | k8s service clusterIP                | Not set                                   |
| `master.servicePort`              | k8s service port                     | `8080`                                    |
| `master.targetPort`               | k8s target port                      | `8080`                                    |
| `master.nodePort`                 | k8s node port                        | Not set                                   |
| `master.jmxPort`                  | Open a port, for JMX stats           | Not set                                   |
| `master.extraPorts`               | Open extra ports, for other uses     | `[]`                                      |
| `master.loadBalancerSourceRanges` | Allowed inbound IP addresses         | `0.0.0.0/0`                               |
| `master.loadBalancerIP`           | Optional fixed external IP           | Not set                                   |
| `master.deploymentLabels`         | Custom Deployment labels             | Not set                                   |
| `master.serviceLabels`            | Custom Service labels                | Not set                                   |
| `master.podLabels`                | Custom Pod labels                    | Not set                                   |
| `master.nodeSelector`             | Node labels for pod assignment       | `{}`                                      |
| `master.affinity`                 | Affinity settings                    | `{}`                                      |
| `master.schedulerName`            | Kubernetes scheduler name            | Not set                                   |
| `master.terminationGracePeriodSeconds` | Set TerminationGracePeriodSeconds   | Not set                               |
| `master.tolerations`              | Toleration labels for pod assignment | `[]`                                      |
| `master.podAnnotations`           | Annotations for master pod           | `{}`                                      |
| `master.deploymentAnnotations`           | Annotations for master deployment           | `{}`                                      |
| `master.lifecycle`                | Lifecycle specification for master-container | Not set                           |
| `master.priorityClassName`        | The name of a `priorityClass` to apply to the master pod | Not set               |
| `master.admin.existingSecret`     | The name of an existing secret containing the admin credentials. | `""`|
| `master.admin.userKey`            | The key in the existing admin secret containing the username. | `jenkins-admin-user` |
| `master.admin.passwordKey`        | The key in the existing admin secret containing the password. | `jenkins-admin-password` |
| `master.customInitContainers`     | Custom init-container specification in raw-yaml format | Not set                 |
| `master.sidecars.other`           | Configures additional sidecar container(s) for Jenkins master | `[]`             |

#### Kubernetes Health Probes
| Parameter                         | Description                          | Default                                   |
| --------------------------------- | ------------------------------------ | ----------------------------------------- |
| `master.healthProbes`             | Enable k8s liveness and readiness probes    | `true`                             |
| `master.healthProbesLivenessTimeout`  | Set the timeout for the liveness probe  | `5`                              |
| `master.healthProbesReadinessTimeout` | Set the timeout for the readiness probe | `5`                               |
| `master.healthProbeLivenessPeriodSeconds` | Set how often (in seconds) to perform the liveness probe | `10`         |
| `master.healthProbeReadinessPeriodSeconds` | Set how often (in seconds) to perform the readiness probe | `10`         |
| `master.healthProbeLivenessFailureThreshold` | Set the failure threshold for the liveness probe | `5`               |
| `master.healthProbeReadinessFailureThreshold` | Set the failure threshold for the readiness probe | `3`               |
| `master.healthProbeLivenessInitialDelay` | Set the initial delay for the liveness probe | `90`               |
| `master.healthProbeReadinessInitialDelay` | Set the initial delay for the readiness probe | `60`               |

#### Kubernetes Ingress
| Parameter                         | Description                          | Default                                   |
| --------------------------------- | ------------------------------------ | ----------------------------------------- |
| `master.ingress.enabled`          | Enables ingress                      | `false`                                   |
| `master.ingress.apiVersion`       | Ingress API version                  | `extensions/v1beta1`                      |
| `master.ingress.hostName`         | Ingress host name                    | Not set                                   |
| `master.ingress.resourceRootUrl`  | Hostname to serve assets from        | Not set                                   |
| `master.ingress.annotations`      | Ingress annotations                  | `{}`                                      |
| `master.ingress.labels`           | Ingress labels                       | `{}`                                      |
| `master.ingress.path`             | Ingress path                         | Not set                                   |
| `master.ingress.paths`            | Override for the default Ingress paths  | `[]`                                   |
| `master.ingress.tls`              | Ingress TLS configuration            | `[]`                                      |

#### GKE BackendConfig
| Parameter                         | Description                          | Default                                   |
| --------------------------------- | ------------------------------------ | ----------------------------------------- |
| `master.backendconfig.enabled`     | Enables backendconfig     | `false`              |
| `master.backendconfig.apiVersion`  | backendconfig API version | `extensions/v1beta1` |
| `master.backendconfig.name`        | backendconfig name        | Not set              |
| `master.backendconfig.annotations` | backendconfig annotations | `{}`                 |
| `master.backendconfig.labels`      | backendconfig labels      | `{}`                 |
| `master.backendconfig.spec`        | backendconfig spec        | `{}`                 |

#### OpenShift Route
| Parameter                         | Description                          | Default                                   |
| --------------------------------- | ------------------------------------ | ----------------------------------------- |
| `master.route.enabled`            | Enables openshift route              | `false`                                   |
| `master.route.annotations`        | Route annotations                    | `{}`                                      |
| `master.route.labels`             | Route labels                         | `{}`                                      |
| `master.route.path`               | Route path                           | Not set                                   |

#### Prometheus
| Parameter                         | Description                          | Default                                   |
| --------------------------------- | ------------------------------------ | ----------------------------------------- |
| `master.prometheus.enabled`       | Enables prometheus service monitor | `false`                                     |
| `master.prometheus.serviceMonitorAdditionalLabels` | Additional labels to add to the service monitor object | `{}`                       |
| `master.prometheus.serviceMonitorNamespace` | Custom namespace for serviceMonitor | Not set (same ns where is Jenkins being deployed) |
| `master.prometheus.scrapeInterval` | How often prometheus should scrape metrics | `60s`                              |
| `master.prometheus.scrapeEndpoint` | The endpoint prometheus should get metrics from | `/prometheus`                 |
| `master.prometheus.alertingrules` | Array of prometheus alerting rules | `[]`                                        |
| `master.prometheus.alertingRulesAdditionalLabels` | Additional labels to add to the prometheus rule object     | `{}`                                   |
| `master.prometheus.prometheusRuleNamespace` | Custom namespace for PrometheusRule | `""` (same ns where Jenkins being deployed) |

#### HTTPS Keystore
| Parameter                         | Description                          | Default                                   |
| --------------------------------- | ------------------------------------ | ----------------------------------------- |
| `master.httpsKeyStore.enable`     | Enables https keystore on jenkins master      | `false`      |
| `master.httpsKeyStore.jenkinsHttpsJksSecretName`     | Name of the secret that already has ssl keystore      | ``      |
| `master.httpsKeyStore.httpPort`   | Http Port that Jenkins should listen on along with https, it also serves liveness and readiness probs port. When https keystore is enabled servicePort and targetPort will be used as https port  | `8081`   |
| `master.httpsKeyStore.path`       | Path of https keystore file                  |     `/var/jenkins_keystore`     |
| `master.httpsKeyStore.fileName`  | Jenkins keystore filename which will apear under master.httpsKeyStore.path      | `keystore.jks` |
| `master.httpsKeyStore.password`   | Jenkins keystore password                                           | `password` |
| `master.httpsKeyStore.jenkinsKeyStoreBase64Encoded`  | Base64 ecoded Keystore content. Keystore must be converted to base64 then being pasted here  | a self signed cert |

#### Kubernetes Secret
| Parameter                         | Description                          | Default                                   |
| --------------------------------- | ------------------------------------ | ----------------------------------------- |
| `master.adminUser`                | Admin username (and password) created as a secret if useSecurity is true | `admin` |
| `master.adminPassword`            | Admin password (and user) created as a secret if useSecurity is true | Random value |

#### Kubernetes NetworkPolicy
| Parameter                         | Description                          | Default                                   |
| --------------------------------- | ------------------------------------ | ----------------------------------------- |
| `networkPolicy.enabled`           | Enable creation of NetworkPolicy resources. | `false`                            |
| `networkPolicy.apiVersion`        | NetworkPolicy ApiVersion             | `networking.k8s.io/v1`                    |
| `networkPolicy.internalAgents.allowed`           | Allow internal agents (from the same cluster) to connect to master. Agent pods would be filtered based on PodLabels. | `false`                            |
| `networkPolicy.internalAgents.podLabels`           | A map of labels (keys/values) that agents pods must have to be able to connect to master. | `{}`                            |
| `networkPolicy.internalAgents.namespaceLabels`           | A map of labels (keys/values) that agents namespaces must have to be able to connect to master. | `{}`                            |
| `networkPolicy.externalAgents.ipCIDR`           | The IP range from which external agents are allowed to connect to master. | ``                            |
| `networkPolicy.externalAgents.except`           | A list of IP sub-ranges to be excluded from the whitelisted IP range. | `[]`                            |

#### Kubernetes RBAC
| Parameter                         | Description                          | Default                                   |
| --------------------------------- | ------------------------------------ | ----------------------------------------- |
| `rbac.create`                     | Whether RBAC resources are created   | `true`                                    |
| `rbac.readSecrets`                | Whether the Jenkins service account should be able to read Kubernetes secrets    | `false` |

#### Kubernetes ServiceAccount - Master
| Parameter                         | Description                          | Default                                   |
| --------------------------------- | ------------------------------------ | ----------------------------------------- |
| `serviceAccount.name`             | name of the ServiceAccount to be used by access-controlled resources | autogenerated |
| `serviceAccount.create`           | Configures if a ServiceAccount with this name should be created | `true`         |
| `serviceAccount.annotations`      | Configures annotation for the ServiceAccount | `{}`                              |

#### Kubernetes ServiceAccount - Agent
| Parameter                         | Description                          | Default                                   |
| --------------------------------- | ------------------------------------ | ----------------------------------------- |
| `serviceAccountAgent.name`        | name of the agent ServiceAccount to be used by access-controlled resources | autogenerated |
| `serviceAccountAgent.create`      | Configures if an agent ServiceAccount with this name should be created | `false`         |
| `serviceAccountAgent.annotations` | Configures annotation for the agent ServiceAccount | `{}`                              |

#### Deprecated
| Parameter                         | Description                          | Default                                   |
| --------------------------------- | ------------------------------------ | ----------------------------------------- |
| `master.customConfigMap`          | Deprecated: Use a custom ConfigMap   | `false`                                   |
| `master.additionalConfig`         | Deprecated: Add additional config files | `{}`                                   |

### Jenkins Agent(s)
| Parameter                  | Description                                     | Default                |
| -------------------------- | ----------------------------------------------- | ---------------------- |
| `agent.enabled`            | Enable Kubernetes plugin jnlp-agent podTemplate | `true`                 |
| `agent.containerCap`       | Maximum number of agent                         | 10                     |

#### Pod Configuration
| Parameter                  | Description                                     | Default                |
| -------------------------- | ----------------------------------------------- | ---------------------- |
| `agent.websocket`          | Enables agent communication via websockets      | false                  |
| `agent.podName`            | Agent Pod base name                             | Not set                |
| `agent.customJenkinsLabels`| Append Jenkins labels to the agent              | `{}`                   |
| `agent.envVars`            | Environment variables for the agent Pod         | `[]`                   |
| `agent.idleMinutes`        | Allows the Pod to remain active for reuse       | 0                      |
| `agent.imagePullSecretName` | Agent image pull secret                        | Not set                |
| `agent.nodeSelector`       | Node labels for pod assignment                  | `{}`                   |
| `agent.slaveConnectTimeout`| Timeout in seconds for an agent to be online    | 100                    |
| `agent.volumes`            | Additional volumes                              | `[]`                   |
| `agent.yamlTemplate`       | The raw yaml of a Pod API Object to merge into the agent spec | Not set  |
| `agent.yamlMergeStrategy`   | Defines how the raw yaml field gets merged with yaml definitions from inherited pod templates | `override` |
| `agent.annotations`       | Annotations to apply to the pod                  | `{}`                   |

#### Side Container Configuration
| Parameter                  | Description                                     | Default                |
| -------------------------- | ----------------------------------------------- | ---------------------- |
| `agent.sideContainerName`  | Side container name in agent                    | jnlp                   |
| `agent.image`              | Agent image name                                | `jenkins/inbound-agent`|
| `agent.tag`                | Agent image tag                                 | `4.3-4`               |
| `agent.alwaysPullImage`    | Always pull agent container image before build  | `false`                |
| `agent.privileged`         | Agent privileged container                      | `false`                |
| `agent.resources`          | Resources allocation (Requests and Limits)      | `{requests: {cpu: 512m, memory: 512Mi}, limits: {cpu: 512m, memory: 512Mi}}` |
| `agent.runAsUser`          | Configure container user                        | Not set                |
| `agent.runAsGroup`         | Configure container group                       | Not set                |
| `agent.command`            | Executed command when side container starts     | Not set                |
| `agent.args`               | Arguments passed to executed command            | `${computer.jnlpmac} ${computer.name}` |
| `agent.TTYEnabled`         | Allocate pseudo tty to the side container       | false                  |
| `agent.workingDir`         | Configure working directory for default agent   | `/home/jenkins`        |

#### Other
| Parameter                  | Description                                     | Default                |
| -------------------------- | ----------------------------------------------- | ---------------------- |
| `agent.podTemplates`       | Configures extra pod templates for the default kubernetes cloud | `{}`   |
| `additionalAgents`         | Configure additional agents which inherit values from `agent` | `{}`     |

### Persistence
| Parameter                   | Description                     | Default         |
| --------------------------- | ------------------------------- | --------------- |
| `persistence.enabled`       | Enable the use of a Jenkins PVC | `true`          |
| `persistence.existingClaim` | Provide the name of a PVC       | `nil`           |
| `persistence.storageClass`  | Storage class for the PVC       | `nil`           |
| `persistence.annotations`   | Annotations for the PVC         | `{}`            |
| `persistence.accessMode`    | The PVC access mode             | `ReadWriteOnce` |
| `persistence.size`          | The size of the PVC             | `8Gi`           |
| `persistence.subPath`       | SubPath for jenkins-home mount  | `nil`           |
| `persistence.volumes`       | Additional volumes              | `nil`           |
| `persistence.mounts`        | Additional mounts               | `nil`           |

### Backup
| Parameter                                | Description                                                       | Default                           |
| ---------------------------------------- | ----------------------------------------------------------------- | --------------------------------- |
| `backup.enabled`                         | Enable the use of a backup CronJob                                | `false`                           |
| `backup.schedule`                        | Schedule to run jobs                                              | `0 2 * * *`                       |
| `backup.labels`                          | Backup pod labels                                                 | `{}`                              |
| `backup.annotations`                     | Backup pod annotations                                            | `{}`                              |
| `backup.image.repo`                      | Backup image repository                                           | `maorfr/kube-tasks`               |
| `backup.image.tag`                       | Backup image tag                                                  | `0.2.0`                           |
| `backup.extraArgs`                       | Additional arguments for kube-tasks                               | `[]`                              |
| `backup.existingSecret`                  | Environment variables to add to the cronjob container             | `{}`                              |
| `backup.existingSecret.*`                | Specify the secret name containing the AWS or GCP credentials     | `jenkinsaws`                      |
| `backup.existingSecret.*.awsaccesskey`   | `secretKeyRef.key` used for `AWS_ACCESS_KEY_ID`                   | `jenkins_aws_access_key`          |
| `backup.existingSecret.*.awssecretkey`   | `secretKeyRef.key` used for `AWS_SECRET_ACCESS_KEY`               | `jenkins_aws_secret_key`          |
| `backup.existingSecret.*.gcpcredentials` | Mounts secret as volume and sets `GOOGLE_APPLICATION_CREDENTIALS` | `credentials.json`                |
| `backup.env`                             | Backup environment variables                                      | `[]`                              |
| `backup.resources`                       | Backup CPU/Memory resource requests/limits                        | Memory: `1Gi`, CPU: `1`           |
| `backup.destination`                     | Destination to store backup artifacts                             | `s3://jenkins-data/backup`        |
