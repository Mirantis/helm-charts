{{- define "gcp-ccm.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "gcp-ccm.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "gcp-ccm.labels" -}}
helm.sh/chart: {{ include "gcp-ccm.chart" . }}
{{ include "gcp-ccm.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "gcp-ccm.selectorLabels" -}}
app.kubernetes.io/name: {{ include "gcp-ccm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "cloud-controller-manager.name" -}}
{{- .Values.nameOverride | default "gcp-cloud-controller-manager" }}
{{- end -}}

{{- define "cloud-config-secret.name" -}}
"gcp-cloud-config"
{{- end }}
