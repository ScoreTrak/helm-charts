{{/*
Expand the name of the chart.
*/}}
{{- define "nsq.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "nsq.fullname" -}}
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
Create chart name and version as used by the chart label.
*/}}
{{- define "nsq.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "nsq.labels" -}}
helm.sh/chart: {{ include "nsq.chart" . }}
{{ include "nsq.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "nsq.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nsq.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

# {{/*
# Create the name of the service account to use
# */}}
# {{- define "nsq.serviceAccountName" -}}
# {{- if .Values.serviceAccount.create }}
# {{- default (include "nsq.fullname" .) .Values.serviceAccount.name }}
# {{- else }}
# {{- default "default" .Values.serviceAccount.name }}
# {{- end }}
# {{- end }}

{{- define "nsqd.name" -}}
{{ printf "%s-nsqd" ( include "nsq.fullname" . ) }}
{{- end }}

{{- define "nsqlookupd.name" -}}
{{ printf "%s-nsqlookupd" ( include "nsq.fullname" . ) }}
{{- end }}

{{- define "nsqadmin.name" -}}
{{ printf "%s-nsqadmin" ( include "nsq.fullname" . ) }}
{{- end }}

{{- define "nsq.appName" -}}
{{ include "nsq.fullname" . }}
{{- end }}

{{/*
App label
*/}}
{{- define "nsq.appLabel" -}}
app: {{ include "nsq.fullname" . }}
{{- end }}

{{/*
Labels for nsqd component
*/}}
{{- define "nsqd.labels" -}}
{{ include "nsq.appLabel" . }}
component: {{ include "nsqd.name" . }}
{{- end }}

{{/*
Labels for nsqlookupd component
*/}}
{{- define "nsqlookupd.labels" -}}
{{ include "nsq.appLabel" . }}
component: {{ include "nsqlookupd.name" . }}
{{- end }}

{{/*
Labels for nsqadmin
*/}}
{{- define "nsqadmin.labels" -}}
{{ include "nsq.appLabel" . }}
component: {{ include "nsqadmin.name" . }}
{{- end }}
