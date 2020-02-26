{{/* vim: set filetype=mustache: */}}
{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "tsung.fullname" -}}
{{- printf "%s-%s" .Release.Name "tsung" | trunc 63 -}}
{{- end -}}

{{- define "tsung.master-svc" -}}
{{- printf "%s-%s" .Release.Name "master-svc" | trunc 63 -}}
{{- end -}}

{{- define "tsung.master" -}}
{{- printf "%s-%s" .Release.Name "master" | trunc 63 -}}
{{- end -}}

{{- define "tsung.slave" -}}
{{- printf "%s-%s" .Release.Name "slave" | trunc 63 -}}
{{- end -}}

{{- define "tsung.slave-svc" -}}
{{- printf "%s-%s" .Release.Name "slave-svc" | trunc 63 -}}
{{- end -}}

{{/*
Create fully qualified configmap name.
*/}}
{{- define "tsung.configmap" -}}
{{ if .Values.config.configmapName }}
{{- printf .Values.config.configmapName -}}
{{ else }}
{{- printf "%s-%s" .Release.Name "config" -}}
{{ end }}
{{- end -}}
