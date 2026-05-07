# GCP Compute Persistent Disk CSI Driver Helm Chart

This Helm chart is designed for deploying the `GCP Compute Persistent Disk CSI Driver`, based on the official
[Google Compute Engine Persistent Disk CSI Driver](https://github.com/kubernetes-sigs/gcp-compute-persistent-disk-csi-driver)
repository.

## Upstream release

This chart is built against upstream release `v1.25.1` (see `appVersion` in `Chart.yaml`).

## Manifest generation

The chart manifest file was generated with:

```bash
git checkout v1.25.1
kubectl kustomize ./deploy/kubernetes/overlays/stable-master \
	> ./tmp/gcp-pd-csi-driver_v1.25.1_upstream.yaml
```
