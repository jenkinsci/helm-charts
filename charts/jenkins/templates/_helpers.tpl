{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "jenkins.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Expand the label of the chart.
*/}}
{{- define "jenkins.label" -}}
{{- printf "%s-%s" (include "jenkins.name" .) .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Allow the release namespace to be overridden for multi-namespace deployments in combined charts.
*/}}
{{- define "jenkins.namespace" -}}
  {{- if .Values.namespaceOverride -}}
    {{- .Values.namespaceOverride -}}
  {{- else -}}
    {{- .Release.Namespace -}}
  {{- end -}}
{{- end -}}

{{- define "jenkins.kubernetes.namespace" -}}
  {{- if .Values.kubernetes.namespace -}}
    {{- tpl .Values.kubernetes.namespace . -}}
  {{- else -}}
    {{- if .Values.namespaceOverride -}}
      {{- .Values.namespaceOverride -}}
    {{- else -}}
      {{- .Release.Namespace -}}
    {{- end -}}
  {{- end -}}
{{- end -}}


{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "jenkins.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Returns the admin password
https://github.com/helm/charts/issues/5167#issuecomment-619137759
*/}}
{{- define "jenkins.password" -}}
  {{ if .Values.controller.adminPassword -}}
    {{- .Values.controller.adminPassword | b64enc | quote }}
  {{- else -}}
    {{- $secret := (lookup "v1" "Secret" .Release.Namespace (include "jenkins.fullname" .)).data -}}
    {{- if $secret -}}
      {{/*
        Reusing current password since secret exists
      */}}
      {{- index $secret ( .Values.controller.admin.passwordKey | default "jenkins-admin-password" ) -}}
    {{- else -}}
      {{/*
          Generate new password
      */}}
      {{- randAlphaNum 22 | b64enc | quote }}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{/*
Returns the Jenkins URL
*/}}
{{- define "jenkins.url" -}}
{{- if .Values.controller.jenkinsUrl }}
  {{- .Values.controller.jenkinsUrl }}
{{- else }}
  {{- if .Values.controller.ingress.hostName }}
    {{- if .Values.controller.ingress.tls }}
      {{- default "https" .Values.controller.jenkinsUrlProtocol }}://{{ .Values.controller.ingress.hostName }}{{ default "" .Values.controller.jenkinsUriPrefix }}
    {{- else }}
      {{- default "http" .Values.controller.jenkinsUrlProtocol }}://{{ .Values.controller.ingress.hostName }}{{ default "" .Values.controller.jenkinsUriPrefix }}
    {{- end }}
  {{- else }}
      {{- default "http" .Values.controller.jenkinsUrlProtocol }}://{{ template "jenkins.fullname" . }}:{{.Values.controller.servicePort}}{{ default "" .Values.controller.jenkinsUriPrefix }}
  {{- end}}
{{- end}}
{{- end -}}

{{/*
Returns a name template to be used for jcasc configmaps, using
suffix passed in at call as index 0
*/}}
{{- define "jenkins.casc.configName" -}}
{{- $name := index . 0 -}}
{{- $root := index . 1 -}}
"{{- include "jenkins.fullname" $root -}}-jenkins-{{ $name }}"
{{- end -}}

{{/*
Returns kubernetes pod template configuration as code
*/}}
{{- define "jenkins.casc.podTemplate" -}}
- name: "{{ .Values.kubernetes.agent.podName }}"
  namespace: "{{ template "jenkins.kubernetes.namespace" . }}"
{{- if .Values.kubernetes.agent.annotations }}
  annotations:
  {{- range $key, $value := .Values.kubernetes.agent.annotations }}
  - key: {{ $key }}
    value: {{ $value | quote }}
  {{- end }}
{{- end }}
  id: {{ sha256sum (toYaml .Values.kubernetes.agent) }}
  containers:
  - name: "{{ .Values.kubernetes.agent.sideContainerName }}"
    alwaysPullImage: {{ .Values.kubernetes.agent.alwaysPullImage }}
    args: "{{ .Values.kubernetes.agent.args | replace "$" "^$" }}"
    command: {{ .Values.kubernetes.agent.command }}
    envVars:
      - envVar:
          key: "JENKINS_URL"
          {{- if .Values.kubernetes.agent.jenkinsUrl }}
          value: {{ tpl .Values.kubernetes.agent.jenkinsUrl . }}
          {{- else }}
          value: "http://{{ template "jenkins.fullname" . }}.{{ template "jenkins.namespace" . }}.svc.{{.Values.clusterZone}}:{{.Values.controller.servicePort}}{{ default "/" .Values.controller.jenkinsUriPrefix }}"
          {{- end }}
    image: "{{ .Values.kubernetes.agent.image }}:{{ .Values.kubernetes.agent.tag }}"
    privileged: "{{- if .Values.kubernetes.agent.privileged }}true{{- else }}false{{- end }}"
    resourceLimitCpu: {{.Values.kubernetes.agent.resources.limits.cpu}}
    resourceLimitMemory: {{.Values.kubernetes.agent.resources.limits.memory}}
    resourceRequestCpu: {{.Values.kubernetes.agent.resources.requests.cpu}}
    resourceRequestMemory: {{.Values.kubernetes.agent.resources.requests.memory}}
    runAsUser: {{ .Values.kubernetes.agent.runAsUser }}
    runAsGroup: {{ .Values.kubernetes.agent.runAsGroup }}
    ttyEnabled: {{ .Values.kubernetes.agent.TTYEnabled }}
    workingDir: {{ .Values.kubernetes.agent.workingDir }}
{{- range $additionalContainers := .Values.kubernetes.agent.additionalContainers }}
  - name: "{{ $additionalContainers.sideContainerName }}"
    alwaysPullImage: {{ $additionalContainers.alwaysPullImage | default $.Values.kubernetes.agent.alwaysPullImage }}
    args: "{{ $additionalContainers.args | replace "$" "^$" }}"
    command: {{ $additionalContainers.command }}
    envVars:
      - envVar:
          key: "JENKINS_URL"
          {{- if $additionalContainers.jenkinsUrl }}
          value: {{ tpl ($additionalContainers.jenkinsUrl) . }}
          {{- else }}
          value: "http://{{ template "jenkins.fullname" $ }}.{{ template "jenkins.namespace" $ }}.svc.{{ $.Values.clusterZone }}:{{ $.Values.controller.servicePort }}{{ default "/" $.Values.controller.jenkinsUriPrefix }}"
          {{- end }}
    image: "{{ $additionalContainers.image }}:{{ $additionalContainers.tag }}"
    privileged: "{{- if $additionalContainers.privileged }}true{{- else }}false{{- end }}"
    resourceLimitCpu: {{ if $additionalContainers.resources }}{{ $additionalContainers.resources.limits.cpu }}{{ else }}{{ $.Values.kubernetes.agent.resources.limits.cpu }}{{ end }}
    resourceLimitMemory: {{ if $additionalContainers.resources }}{{ $additionalContainers.resources.limits.memory }}{{ else }}{{ $.Values.kubernetes.agent.resources.limits.memory }}{{ end }}
    resourceRequestCpu: {{ if $additionalContainers.resources }}{{ $additionalContainers.resources.requests.cpu }}{{ else }}{{ $.Values.kubernetes.agent.resources.requests.cpu }}{{ end }}
    resourceRequestMemory: {{ if $additionalContainers.resources }}{{ $additionalContainers.resources.requests.memory }}{{ else }}{{ $.Values.kubernetes.agent.resources.requests.memory }}{{ end }}
    runAsUser: {{ $additionalContainers.runAsUser | default $.Values.kubernetes.agent.runAsUser }}
    runAsGroup: {{ $additionalContainers.runAsGroup | default $.Values.kubernetes.agent.runAsGroup }}
    ttyEnabled: {{ $additionalContainers.TTYEnabled | default $.Values.kubernetes.agent.TTYEnabled }}
    workingDir: {{ $additionalContainers.workingDir | default $.Values.kubernetes.agent.workingDir }}
{{- end }}
{{- if or .Values.kubernetes.agent.envVars .Values.kubernetes.agent.secretEnvVars }}
  envVars:
  {{- range $index, $var := .Values.kubernetes.agent.envVars }}
    - envVar:
        key: {{ $var.name }}
        value: {{ tpl $var.value $ }}
  {{- end }}
  {{- range $index, $var := .Values.kubernetes.agent.secretEnvVars }}
    - secretEnvVar:
        key: {{ $var.key }}
        secretName: {{ $var.secretName }}
        secretKey: {{ $var.secretKey }}
        optional: {{ $var.optional | default false }}
  {{- end }}
{{- end }}
  idleMinutes: {{ .Values.kubernetes.agent.idleMinutes }}
  instanceCap: 2147483647
  {{- if .Values.kubernetes.agent.hostNetworking }}
  hostNetwork: {{ .Values.kubernetes.agent.hostNetworking }}
  {{- end }}
  {{- if .Values.kubernetes.agent.imagePullSecretName }}
  imagePullSecrets:
  - name: {{ .Values.kubernetes.agent.imagePullSecretName }}
  {{- end }}
  label: "{{ .Release.Name }}-{{ .Values.kubernetes.agent.componentName }} {{ .Values.kubernetes.agent.customJenkinsLabels  | join " " }}"
{{- if .Values.kubernetes.agent.nodeSelector }}
  nodeSelector:
  {{- $local := dict "first" true }}
  {{- range $key, $value := .Values.kubernetes.agent.nodeSelector }}
    {{- if $local.first }} {{ else }},{{ end }}
    {{- $key }}={{ tpl $value $ }}
    {{- $_ := set $local "first" false }}
  {{- end }}
{{- end }}
  nodeUsageMode: {{ quote .Values.kubernetes.agent.nodeUsageMode }}
  podRetention: {{ .Values.kubernetes.agent.podRetention }}
  showRawYaml: {{ .Values.kubernetes.agent.showRawYaml }}
  serviceAccount: "{{ include "jenkins.serviceAccountAgentName" . }}"
  slaveConnectTimeoutStr: "{{ .Values.kubernetes.agent.connectTimeout }}"
{{- if .Values.kubernetes.agent.volumes }}
  volumes:
  {{- range $index, $volume := .Values.kubernetes.agent.volumes }}
    -{{- if (eq $volume.type "ConfigMap") }} configMapVolume:
     {{- else if (eq $volume.type "EmptyDir") }} emptyDirVolume:
     {{- else if (eq $volume.type "HostPath") }} hostPathVolume:
     {{- else if (eq $volume.type "Nfs") }} nfsVolume:
     {{- else if (eq $volume.type "PVC") }} persistentVolumeClaim:
     {{- else if (eq $volume.type "Secret") }} secretVolume:
     {{- else }} {{ $volume.type }}:
     {{- end }}
    {{- range $key, $value := $volume }}
      {{- if not (eq $key "type") }}
        {{ $key }}: {{ if kindIs "string" $value }}{{ tpl $value $ | quote }}{{ else }}{{ $value }}{{ end }}
      {{- end }}
    {{- end }}
  {{- end }}
{{- end }}
{{- if .Values.kubernetes.agent.workspaceVolume }}
  workspaceVolume:
    {{- if (eq .Values.kubernetes.agent.workspaceVolume.type "DynamicPVC") }}
    dynamicPVC:
    {{- else if (eq .Values.kubernetes.agent.workspaceVolume.type "EmptyDir") }}
    emptyDirWorkspaceVolume:
    {{- else if (eq .Values.kubernetes.agent.workspaceVolume.type "HostPath") }}
    hostPathWorkspaceVolume:
    {{- else if (eq .Values.kubernetes.agent.workspaceVolume.type "Nfs") }}
    nfsWorkspaceVolume:
    {{- else if (eq .Values.kubernetes.agent.workspaceVolume.type "PVC") }}
    persistentVolumeClaimWorkspaceVolume:
    {{- else }}
    {{ .Values.kubernetes.agent.workspaceVolume.type }}:
    {{- end }}
  {{- range $key, $value := .Values.kubernetes.agent.workspaceVolume }}
    {{- if not (eq $key "type") }}
      {{ $key }}: {{ if kindIs "string" $value }}{{ tpl $value $ | quote }}{{ else }}{{ $value }}{{ end }}
    {{- end }}
  {{- end }}
{{- end }}
{{- if .Values.kubernetes.agent.yamlTemplate }}
  yaml: |-
    {{- tpl (trim .Values.kubernetes.agent.yamlTemplate) . | nindent 4 }}
{{- end }}
  yamlMergeStrategy: {{ .Values.kubernetes.agent.yamlMergeStrategy }}
{{- end -}}

{{- define "jenkins.kubernetes-version" -}}
  {{- if .Values.controller.installPlugins -}}
    {{- range .Values.controller.installPlugins -}}
      {{ if hasPrefix "kubernetes:" . }}
        {{- $split := splitList ":" . }}
        {{- printf "%s" (index $split 1 ) -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "jenkins.casc.security" }}
security:
{{- with .Values.controller.JCasC }}
{{- if .security }}
  {{- .security | toYaml | nindent 2 }}
{{- end }}
{{- end }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "jenkins.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "jenkins.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account for Jenkins agents to use
*/}}
{{- define "jenkins.serviceAccountAgentName" -}}
{{- if .Values.serviceAccountAgent.create -}}
    {{ default (printf "%s-%s" (include "jenkins.fullname" .) "agent") .Values.serviceAccountAgent.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccountAgent.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account for Jenkins backup to use
*/}}
{{- define "backup.serviceAccountBackupName" -}}
{{- if .Values.backup.serviceAccount.create -}}
    {{ default (printf "%s-%s" (include "jenkins.fullname" .) "backup") .Values.backup.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.backup.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create a full tag name for controller image
*/}}
{{- define "controller.tag" -}}
{{- if .Values.controller.tagLabel -}}
    {{- default (printf "%s-%s" .Chart.AppVersion .Values.controller.tagLabel) .Values.controller.tag -}}
{{- else -}}
    {{- default .Chart.AppVersion .Values.controller.tag -}}
{{- end -}}
{{- end -}}

{{/*
Create the HTTP port for interacting with the controller
*/}}
{{- define "controller.httpPort" -}}
{{- if .Values.controller.httpsKeyStore.enable -}}
    {{- .Values.controller.httpsKeyStore.httpPort -}}
{{- else -}}
    {{- .Values.controller.targetPort -}}
{{- end -}}
{{- end -}}
