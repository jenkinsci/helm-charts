{{/*
Returns configuration as code default config
*/}}
{{- define "jenkins.casc.defaults" -}}
jenkins:
  {{- $configScripts := toYaml .Values.controller.JCasC.configScripts }}
  {{- if and (.Values.controller.JCasC.authorizationStrategy) (not (contains "authorizationStrategy:" $configScripts)) }}
  authorizationStrategy:
    {{- tpl .Values.controller.JCasC.authorizationStrategy . | nindent 4 }}
  {{- end }}
  {{- if and (.Values.controller.JCasC.securityRealm) (not (contains "securityRealm:" $configScripts)) }}
  securityRealm:
    {{- tpl .Values.controller.JCasC.securityRealm . | nindent 4 }}
  {{- end }}
  disableRememberMe: {{ .Values.controller.disableRememberMe }}
  {{- if .Values.controller.legacyRemotingSecurityEnabled }}
  remotingSecurity:
    enabled: true
  {{- end }}
  mode: {{ .Values.controller.executorMode }}
  numExecutors: {{ .Values.controller.numExecutors }}
  {{- if not (kindIs "invalid" .Values.controller.customJenkinsLabels) }}
  labelString: "{{ join " " .Values.controller.customJenkinsLabels }}"
  {{- end }}
  {{- if .Values.controller.projectNamingStrategy }}
  {{- if kindIs "string" .Values.controller.projectNamingStrategy }}
  projectNamingStrategy: "{{ .Values.controller.projectNamingStrategy }}"
  {{- else }}
  projectNamingStrategy:
    {{- toYaml .Values.controller.projectNamingStrategy | nindent 4 }}
  {{- end }}
  {{- end }}
  markupFormatter:
    {{- if .Values.controller.enableRawHtmlMarkupFormatter }}
    rawHtml:
      disableSyntaxHighlighting: true
    {{- else }}
    {{- toYaml .Values.controller.markupFormatter | nindent 4 }}
    {{- end }}
  {{- if .Values.kubernetes.enabled -}}
  {{- include "jenkins.casc.kubernetes" . }}
  {{- end -}}
  {{- if .Values.controller.csrf.defaultCrumbIssuer.enabled }}
  crumbIssuer:
    standard:
      excludeClientIPFromCrumb: {{ if .Values.controller.csrf.defaultCrumbIssuer.proxyCompatability }}true{{ else }}false{{- end }}
  {{- end }}
{{- include "jenkins.casc.security" . }}
{{- if .Values.controller.scriptApproval }}
  scriptApproval:
    approvedSignatures:
{{- range $key, $val := .Values.controller.scriptApproval }}
    - "{{ $val }}"
{{- end }}
{{- end }}
unclassified:
  location:
    adminAddress: {{ default "" .Values.controller.jenkinsAdminEmail }}
    url: {{ template "jenkins.url" . }}
{{- end -}}


{{- define "jenkins.casc.kubernetes" }}
clouds:
  - kubernetes:
      containerCapStr: "{{ .Values.kubernetes.agent.containerCap }}"
      defaultsProviderTemplate: "{{ .Values.kubernetes.agent.defaultsProviderTemplate }}"
      connectTimeout: "{{ .Values.kubernetes.agent.kubernetesConnectTimeout }}"
      readTimeout: "{{ .Values.kubernetes.agent.kubernetesReadTimeout }}"
      {{- if .Values.kubernetes.agent.jenkinsUrl }}
      jenkinsUrl: "{{ tpl .Values.kubernetes.agent.jenkinsUrl . }}"
      {{- else }}
      jenkinsUrl: "http://{{ template "jenkins.fullname" . }}.{{ template "jenkins.namespace" . }}.svc.{{.Values.clusterZone}}:{{.Values.controller.servicePort}}{{ default "" .Values.controller.jenkinsUriPrefix }}"
      {{- end }}
      {{- if not .Values.kubernetes.agent.websocket }}
      {{- if .Values.kubernetes.agent.jenkinsTunnel }}
      jenkinsTunnel: "{{ tpl .Values.kubernetes.agent.jenkinsTunnel . }}"
      {{- else }}
      jenkinsTunnel: "{{ template "jenkins.fullname" . }}-agent.{{ template "jenkins.namespace" . }}.svc.{{.Values.clusterZone}}:{{ .Values.controller.agentListenerPort }}"
      {{- end }}
      {{- else }}
      webSocket: true
      {{- end }}
      maxRequestsPerHostStr: {{ .Values.kubernetes.agent.maxRequestsPerHostStr | quote }}
      name: "{{ .Values.controller.cloudName }}"
      namespace: "{{ template "jenkins.kubernetes.namespace" . }}"
      serverUrl: "https://kubernetes.default"
      {{- if .Values.kubernetes.agent.enabled }}
      podLabels:
      - key: "jenkins/{{ .Release.Name }}-{{ .Values.kubernetes.agent.componentName }}"
        value: "true"
      {{- range $key, $val := .Values.kubernetes.agent.podLabels }}
      - key: {{ $key | quote }}
        value: {{ $val | quote }}
      {{- end }}
      templates:
    {{- if not .Values.kubernetes.agent.disableDefaultAgent }}
      {{- include "jenkins.casc.podTemplate" . | nindent 8 }}
    {{- end }}
    {{- if .Values.additionalAgents }}
      {{- /* save .Values.kubernetes.agent */}}
      {{- $agent := .Values.kubernetes.agent }}
      {{- range $name, $additionalAgent := .Values.additionalAgents }}
        {{- $additionalContainersEmpty := and (hasKey $additionalAgent "additionalContainers") (empty $additionalAgent.additionalContainers)  }}
        {{- /* merge original .Values.kubernetes.agent into additional agent to ensure it at least has the default values */}}
        {{- $additionalAgent := merge $additionalAgent $agent }}
        {{- /* clear list of additional containers in case it is configured empty for this agent (merge might have overwritten that) */}}
        {{- if $additionalContainersEmpty }}
        {{- $_ := set $additionalAgent "additionalContainers" list }}
        {{- end }}
        {{- /* set .Values.kubernetes.agent to $additionalAgent */}}
        {{- $_ := set $.Values "agent" $additionalAgent }}
        {{- include "jenkins.casc.podTemplate" $ | nindent 8 }}
      {{- end }}
      {{- /* restore .Values.kubernetes.agent */}}
      {{- $_ := set .Values "agent" $agent }}
    {{- end }}
      {{- if .Values.kubernetes.agent.podTemplates }}
        {{- range $key, $val := .Values.kubernetes.agent.podTemplates }}
          {{- tpl $val $ | nindent 8 }}
        {{- end }}
      {{- end }}
      {{- end }}
{{- end -}}