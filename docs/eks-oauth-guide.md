# Jenkins on EKS with OAuth2 Proxy

This guide describes one approach for installing the [Jenkins Helm chart](https://github.com/jenkinsci/helm-charts/tree/main/charts/jenkins) on Amazon EKS with authentication handled by an `oauth2-proxy` sidecar. The configuration uses Jenkins Configuration as Code (JCasC) so that the controller can be recreated reliably.

## 1. Prerequisites

- A running [EKS](https://docs.aws.amazon.com/eks/) cluster and kubectl context
- Helm 3 installed
- Docker to build a custom Jenkins image
- An `oauth2-proxy` deployment that sets `X-Auth-Request-Email`

## 2. Build a custom Jenkins image

The chart recommends building a custom controller image for production so you control plugin versions【F:charts/jenkins/README.md†L102-L132】. Example Dockerfile (also available in `docs/Dockerfile.jenkins`):

```Dockerfile
FROM jenkins/jenkins:lts
RUN jenkins-plugin-cli --plugins \
  kubernetes \
  workflow-aggregator \
  job-dsl \
  envinject \
  matrix-auth \
  reverse-proxy-auth-plugin \
  amazon-ecr:latest \
  configuration-as-code
```

Build and push to your registry:

```bash
docker build -t <aws_account>.dkr.ecr.<region>.amazonaws.com/jenkins-custom:v1 .
docker push <aws_account>.dkr.ecr.<region>.amazonaws.com/jenkins-custom:v1
```

### 2.1 Build an sbt 0.13 image

The pipelines use a container with sbt 0.13 installed. Build and push the
following Dockerfile (see `docs/Dockerfile-sbt-013`) so it is available in your registry:

```Dockerfile
FROM openjdk:8-jdk
RUN curl -L -o /tmp/sbt.tgz \
    https://github.com/sbt/sbt/releases/download/v0.13.18/sbt-0.13.18.tgz \
    && tar xzf /tmp/sbt.tgz -C /usr/local \
    && ln -s /usr/local/sbt/bin/sbt /usr/local/bin/sbt \
    && rm /tmp/sbt.tgz
```

```bash
docker build -t <account>.dkr.ecr.ap-southeast-1.amazonaws.com/sbt-0.13 .
docker push <account>.dkr.ecr.ap-southeast-1.amazonaws.com/sbt-0.13
```

## 3. Prepare Helm values

Create a `values.yaml` with the custom controller image and plugins disabled so
the chart uses the bundled versions. Refer to the [chart documentation](../charts/jenkins/README.md#consider-using-a-custom-image)
for details on building and tagging a production-ready image.

```yaml
controller:
  image:
    registry: "<aws_account>.dkr.ecr.<region>.amazonaws.com"
    repository: "jenkins-custom"
    tag: "v1"
  installPlugins: false
  jenkinsUrl: "https://jenkins.example.com"
  ingress:
    enabled: true
    hostName: jenkins.example.com
    annotations:
      nginx.ingress.kubernetes.io/auth-url: https://oauth2.example.com/oauth2/auth
      nginx.ingress.kubernetes.io/auth-signin: https://oauth2.example.com/oauth2/start?rd=/redirect/$http_host$escaped_request_uri
```

Set up matrix authorization in JCasC so anonymous users can only read while the
authenticated group and specific admin accounts have full control. Place the
configuration under `controller.JCasC.configScripts`:

```yaml
controller:
  JCasC:
    configScripts:
      security: |
        jenkins:
          securityRealm:
            reverseProxy:
              forwardedUser: "X-Auth-Request-Email"
              forwardedEmail: "X-Auth-Request-Email"
          authorizationStrategy:
            globalMatrix:
              entries:
                - group:
                    name: "authenticated"
                    permissions:
                      - "Overall/Administer"
                - user:
                    name: "anonymous"
                    permissions:
                      - "Overall/Read"
                - user:
                    name: "deept.shukla@solvei8.com"
                    permissions:
                      - "Overall/Administer"
                      - "Overall/Read"
```

## 4. Installing the chart

Add the Jenkins chart repo:

```bash
helm repo add jenkins https://charts.jenkins.io
helm repo update
```

Install using your values file:

```bash
helm install jenkins jenkins/jenkins -f values.yaml --namespace jenkins --create-namespace
```

## 5. Building images with Kaniko

EKS worker nodes typically run containerd, so using the legacy Docker socket is
not recommended. Instead this guide uses
[Kaniko](https://github.com/GoogleContainerTools/kaniko) to build and push
images from Jenkins agents.

### 5.1 Provision an EFS-backed cache

Create an Amazon EFS filesystem in `ap-southeast-1a` and mount target in your
cluster's subnets:

```bash
aws efs create-file-system --region ap-southeast-1
aws efs create-mount-target --file-system-id <fs-id> --subnet-id <subnet> --security-groups <sg>
```

Define a `StorageClass` that uses the EFS CSI driver and references the file
system ID:

```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: efs-sc
provisioner: efs.csi.aws.com
parameters:
  fileSystemId: <fs-id>
```

Create a persistent volume claim for the Ivy cache using this storage class so
dependencies are reused across builds:

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: ivy-cache
spec:
  storageClassName: efs-sc
  accessModes: [ReadWriteMany]
  resources:
    requests:
      storage: 5Gi
```

Reference the volume and a Kaniko sidecar in your pipeline pod template:

```yaml
agent:
  podName: kaniko-agent
  yaml: |
    apiVersion: v1
    kind: Pod
    spec:
      volumes:
      - name: ivy
        persistentVolumeClaim:
          claimName: ivy-cache
      - name: sbt-creds
        configMap:
          name: sbt-credentials
      containers:
      - name: sbt
        image: 185889327143.dkr.ecr.ap-southeast-1.amazonaws.com/sbt-0.13
        command: ['cat']
        tty: true
        volumeMounts:
        - name: ivy
          mountPath: /root/.ivy2
        - name: sbt-creds
          mountPath: /root/.sbt
      - name: kaniko
        image: gcr.io/kaniko-project/executor:v1.20.1
        command:
        - /kaniko/executor
        args:
        - --dockerfile=Dockerfile
        - --context=/workspace/nsp_auth
        - --destination=$(ECR_REPO):$(BUILD_NUMBER)
        volumeMounts:
        - name: ivy
          mountPath: /root/.ivy2
```

An example Dockerfile for the Play service that works with this pipeline:

```Dockerfile
FROM 185889327143.dkr.ecr.ap-southeast-1.amazonaws.com/sbt-0.13 AS builder
WORKDIR /workspace
COPY . .
RUN apk add --no-cache unzip
WORKDIR /workspace/serviceA
RUN sbt -mem 2048 update
RUN sbt -mem 2048 clean compile dist
RUN unzip -o target/universal/servicea-0.1.0.zip -d /workspace/serviceA

FROM eclipse-temurin:8-jre
WORKDIR /app
COPY --from=builder /workspace/serviceA/ /app/
EXPOSE 9000
```

The `/root/.ivy2` directory in the first stage should be mounted from the
`ivy-cache` volume so dependencies are not downloaded on every run.

Create a **Secret** with your sbt credentials file so the agent can publish
artifacts if required:

```bash
kubectl create secret generic sbt-publish-creds --from-file=credentials=/path/to/.credentials -n jenkins
```

Mount this secret at `/root/.ivy2/.credentials` inside the `sbt` container.

Bitbucket credentials for cloning are defined in JCasC using a secret text
environment variable `BITBUCKET_PASSWORD`:

```yaml
controller:
  JCasC:
    configScripts:
      credentials: |
        credentials:
          system:
            domainCredentials:
            - credentials:
              - usernamePassword:
                  scope: GLOBAL
                  id: bitbucket-creds
                  username: shukla_deept
                  password: ${BITBUCKET_PASSWORD}
```

Create the secret before installing the chart:

```bash
kubectl create secret generic jenkins-jcasc-secrets \
  --from-literal=BITBUCKET_PASSWORD=<bitbucket-password> -n jenkins
```

## 6. Pushing images to Amazon ECR

Provide AWS credentials to the controller so pipelines can push images. Create a
secret with an IAM user that has ECR permissions and reference it as environment
variables for your jobs:

```bash
kubectl create secret generic aws-ecr-creds --from-literal=AWS_ACCESS_KEY_ID=<id> --from-literal=AWS_SECRET_ACCESS_KEY=<key> -n jenkins
```

Create a ConfigMap containing your `~/.docker/config.json` with the ECR credential helper so Kaniko can authenticate:

```bash
kubectl create configmap docker-config --from-file=config.json=docs/docker-config.json -n jenkins
```

Use the credentials in a pipeline that builds the image with Kaniko. The full
pipeline shown in `docs/kaniko-sbt-pipeline.groovy` clones the Bitbucket
repository, compiles it with sbt, and then uses Kaniko to push the image to ECR.
For a Job DSL example see `docs/enhanced-seed-job.groovy` and for a declarative
pipeline using Kubernetes agents see `docs/enhanced-Jenkinsfile`.

## 7. Resilience

The chart deploys Jenkins as a Kubernetes StatefulSet with persistent storage. Enabling `controller.JCasC.defaultConfig: true` means configuration is reapplied on restarts. Storage persistence ensures that plugin and build state survive pod recreation.

## 8. Next steps

- Access the dashboard through the ingress hostname after oauth2-proxy authentication.
- Create additional pipelines using Job DSL.
- Review the [Configuration as Code](https://github.com/jenkinsci/helm-charts/blob/main/charts/jenkins/README.md#configuration-as-code) section for more customization options.

