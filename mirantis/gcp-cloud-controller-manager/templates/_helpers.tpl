{{- define "cloud-controller-manager.name" -}}
{{- .Values.nameOverride }}
{{- end -}}

{{- define "cloud-config-secret.name" -}}
"gcp-cloud-config"
{{- end }}

