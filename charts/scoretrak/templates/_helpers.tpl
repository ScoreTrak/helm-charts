{{/*
Expand the name of the chart.
*/}}
{{- define "scoretrak.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "scoretrak.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
server fullname
*/}}
{{- define "scoretrak.server.fullname" -}}
{{- if .Values.server.fullnameOverride }}
{{- .Values.server.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "server" .Values.server.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
envoy fullname
*/}}
{{- define "scoretrak.envoy.fullname" -}}
{{- if .Values.envoy.fullnameOverride }}
{{- .Values.envoy.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "envoy" .Values.envoy.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
client fullname
*/}}
{{- define "scoretrak.client.fullname" -}}
{{- if .Values.client.fullnameOverride }}
{{- .Values.client.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "client" .Values.client.nameOverride }}
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
{{- define "scoretrak.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "scoretrak.labels" -}}
helm.sh/chart: {{ include "scoretrak.chart" . }}
app.kubernetes.io/name: {{ include "scoretrak.name" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Server selector labels
*/}}
{{- define "scoretrak.server.selectorLabels" -}}
app.kubernetes.io/component: server
{{- end }}

{{/*
Envoy selector labels
*/}}
{{- define "scoretrak.envoy.selectorLabels" -}}
app.kubernetes.io/component: envoy
{{- end }}

{{/*
Client selector labels
*/}}
{{- define "scoretrak.client.selectorLabels" -}}
app.kubernetes.io/component: client
{{- end }}


{{/*
Create the name of the service account to use
*/}}
{{- define "scoretrak.server.serviceAccountName" -}}
{{- if .Values.server.serviceAccount.create }}
{{- default (include "scoretrak.server.fullname" .) .Values.server.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.server.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
NOTE: This utility template is needed until https://git.io/JvuGN is resolved.

Call a template from the context of a subchart.

Usage:
  {{ include "call-nested" (list . "<subchart_name>" "<subchart_template_name>") }}
*/}}
{{- define "call-nested" }}
{{- $dot := index . 0 }}
{{- $subchart := index . 1 | splitList "." }}
{{- $template := index . 2 }}
{{- $values := $dot.Values }}
{{- range $subchart }}
{{- $values = index $values . }}
{{- end }}
{{- include $template (dict "Chart" (dict "Name" (last $subchart)) "Values" $values "Release" $dot.Release "Capabilities" $dot.Capabilities) }}
{{- end }}


{{- define "global_db_client_secret_name" -}}
{{- printf "%s-cockroachdb-client-secret" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}