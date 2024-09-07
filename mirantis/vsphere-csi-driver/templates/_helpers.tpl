{{/*
Expand the name of the chart.
*/}}
{{- define "vsphere-csi-driver.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "vsphere-csi-driver.controller.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}-controller
{{- end }}

{{- define "vsphere-csi-driver.node.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}-node
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "vsphere-csi-driver.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{- define "vsphere-csi-driver.controller.fullname" -}}
{{ include "vsphere-csi-driver.fullname" . }}-controller
{{- end }}

{{- define "vsphere-csi-driver.node.fullname" -}}
{{ include "vsphere-csi-driver.fullname" . }}-node
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "vsphere-csi-driver.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "vsphere-csi-driver.labels" -}}
helm.sh/chart: {{ include "vsphere-csi-driver.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "vsphere-csi-driver.controller.selectorLabels" -}}
app.kubernetes.io/name: {{ include "vsphere-csi-driver.controller.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "vsphere-csi-driver.node.selectorLabels" -}}
app.kubernetes.io/name: {{ include "vsphere-csi-driver.node.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "vsphere-csi-driver.controller.serviceAccountName" -}}
{{ include "vsphere-csi-driver.controller.fullname" . }}
{{- end }}

{{- define "vsphere-csi-driver.node.serviceAccountName" -}}
{{ include "vsphere-csi-driver.node.fullname" . }}
{{- end }}
