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

{{- define "tsung.namespace" -}}
{{- printf "%s" .Release.Namespace -}}
{{- end -}}

{{- define "tsung.replicaCount" -}}
{{- printf "%s" .Values.slave.replicaCount -}}
{{- end -}}

{{- define "tsung.clusterbasename" -}}
{{- printf "%s" .Values.config.clusterbasename -}}
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

{{/*
Create a list of clients addresses to be placed in config XML
*/}}
{{- define "tsung.clients" -}}
{{- range until (int .Values.slave.replicaCount) }}
        <client host='{{ template "tsung.slave" $ }}-{{ . }}.{{ template "tsung.slave-svc" $ }}.{{ template "tsung.namespace" $ }}.svc.{{ template "tsung.clusterbasename" $ }}'/>
{{- end -}}
{{- end -}}
