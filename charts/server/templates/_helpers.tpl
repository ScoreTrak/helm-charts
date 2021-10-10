{{/*
Expand the name of the chart.
*/}}
{{- define "server.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "server.fullname" -}}
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
{{- define "server.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "server.labels" -}}
helm.sh/chart: {{ include "server.chart" . }}
{{ include "server.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "server.selectorLabels" -}}
app.kubernetes.io/name: {{ include "server.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "server.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "server.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
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


{{/*
Keep existing credentials lookup function
*/}}
{{- define "gen.secret" -}}
{{- $nameSpace := printf "%s-%s" "wp" (include "site.prefix" .) -}}
{{- $secretName := printf "%s-%s" "secrets-wp" (include "site.prefix" .) -}}
{{- $secret := (lookup "v1" "Secret" .Release.Namespace "" ) -}}
{{- if $secret -}}
ALLOWSERVER: {{ $secret.data.ALLOWSERVER }}
DB_NAME: {{ $secret.data.DB_NAME }}
DB_USER: {{ $secret.data.DB_USER }}
DB_PASSWORD: {{ $secret.data.DB_PASSWORD }}
DB_HOST: {{ $secret.data.DB_HOST }}
{{- else -}}
ALLOWSERVER: {{ default "10.%.%.%" .Values.config.allowServer | b64enc | quote }}
DB_NAME: {{ include "site.prefix" . | replace "-" "_" | b64enc | quote }}
DB_USER: {{ include "site.prefix" . | replace "-" "_" | b64enc | quote }}
DB_PASSWORD: {{ randAlphaNum 24 | b64enc | quote }}
DB_HOST: {{ default "wordpress-cluster-haproxy.pxc-wordpress-cluster" .Values.config.dbHost | b64enc | quote }}
{{- end -}}
{{- end -}}
