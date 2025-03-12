{{- define "gcp-csi.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "gcp-csi.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "gcp-csi.labels" -}}
k8s-app: gcp-compute-persistent-disk-csi-driver
helm.sh/chart: {{ include "gcp-csi.chart" . }}
{{ include "gcp-csi.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "gcp-csi.selectorLabels" -}}
app.kubernetes.io/name: {{ include "gcp-csi.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "csi-controller.name" -}}
{{- .Values.controller.nameOverride | default "csi-gce-pd-controller" }}
{{- end }}

{{- define "csi-node.name" -}}
{{- .Values.node.nameOverride | default "csi-gce-pd-node" }}
{{- end }}

{{- define "csi-node-win.name" -}}
{{- .Values.nodeWin.nameOverride | default "csi-gce-pd-node-win" }}
{{- end }}
