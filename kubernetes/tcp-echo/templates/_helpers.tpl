{{/*
Expand the name of the chart.
*/}}
{{- define "tcp-echo.name" -}}
{{- .Values.nameOverride | default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "tcp-echo.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := .Values.nameOverride | default .Chart.Name }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "tcp-echo.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "tcp-echo.labels" -}}
helm.sh/chart: {{ include "tcp-echo.chart" . | quote }}
{{ include "tcp-echo.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
app: {{ include "tcp-echo.name" . | quote }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "tcp-echo.selectorLabels" -}}
app.kubernetes.io/name: {{ include "tcp-echo.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}

{{/*
Name of deployment.
*/}}
{{- define "tcp-echo.deploymentName" -}}
{{ include "tcp-echo.fullname" . }}
{{- end }}

{{/*
Name of service.
*/}}
{{- define "tcp-echo.serviceName" -}}
{{ include "tcp-echo.fullname" . }}
{{- end }}

{{/*
Name of container port.
*/}}
{{- define "tcp-echo.containerPortName" -}}
tcp-echo
{{- end }}

{{/*
Name of service port.
*/}}
{{- define "tcp-echo.servicePortName" -}}
tcp-echo
{{- end }}

{{/*
Container image tag.
*/}}
{{- define "tcp-echo.containerImageTag" -}}
{{ .Values.container.image.tag | default .Chart.AppVersion }}
{{- end }}

{{/*
Container image full name.
*/}}
{{- define "tcp-echo.containerImageFullName" -}}
{{ printf "%s:%s" .Values.container.image.repository (include "tcp-echo.containerImageTag" . ) }}
{{- end }}

{{/*
Termination grace period.
*/}}
{{- define "tcp-echo.terminationGracePeriod" -}}
{{ add (.Values.tcpEcho.stopTimeout | default 60) 5 }}
{{- end }}

{{/*
Name of test pod.
*/}}
{{- define "tcp-echo.testPodName" -}}
{{ include "tcp-echo.fullname" . }}-test
{{- end }}

{{/*
Test container image full name.
*/}}
{{- define "tcp-echo.testContainerImageFullName" -}}
{{ printf "%s:%s" .Values.test.image.repository (.Values.test.image.tag | default "latest") }}
{{- end }}
