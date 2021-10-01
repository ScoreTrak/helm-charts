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

{{- define "nsqd.fullname" -}}
{{ printf "%s-nsqd" ( include "nsq.fullname" . ) }}
{{- end }}

{{- define "nsqlookupd.fullname" -}}
{{ printf "%s-nsqlookupd" ( include "nsq.fullname" . ) }}
{{- end }}

{{- define "nsqadmin.fullname" -}}
{{ printf "%s-nsqadmin" ( include "nsq.fullname" . ) }}
{{- end }}

{{/*
Selector Labels for nsqd
*/}}
{{- define "nsqd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nsq.fullname" . }}
app.kubernetes.io/instance: {{ include "nsqd.fullname" . }}
{{- end }}

{{/*
Selector Labels for nsqlookupd
*/}}
{{- define "nsqlookupd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nsq.fullname" . }}
app.kubernetes.io/instance: {{ include "nsqlookupd.fullname" . }}
{{- end }}

{{/*
Selector Labels for nsqadmin
*/}}
{{- define "nsqadmin.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nsq.fullname" . }}
app.kubernetes.io/instance: {{ include "nsqadmin.fullname" . }}
{{- end }}
