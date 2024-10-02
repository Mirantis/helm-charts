# vSphere CSI Driver

A Helm chart for Container Storage Interface (CSI) driver for vSphere

This chart is based on the official [vsphere csi driver vanilla manifest](https://github.com/kubernetes-sigs/vsphere-csi-driver/blob/master/manifests/vanilla/vsphere-csi-driver.yaml).

The default storage class can be created via `defaultStorageClass.enabled`
option.

You can also create the
[configuration](https://docs.vmware.com/en/VMware-vSphere-Container-Storage-Plug-in/2.0/vmware-vsphere-csp-getting-started/GUID-BFF39F1D-F70A-4360-ABC9-85BDAFBE8864.html)
secret by setting `vcenterConfig.enabled` to true and passing all the rest
values under `vcenterConfig`.


## Values

| Key                                      | Type   | Default                                                   | Description                                                                        |
|------------------------------------------|--------|-----------------------------------------------------------|------------------------------------------------------------------------------------|
| controller.nodeAffinity                  | map    |                                                           | Controller's node affinity                                                         |
| controller.replicas                      | int    | `1`                                                       | Number of replicas for controller's deployment                                     |
| controller.tolerations                   | map    |                                                           | Controller's tolerations                                                           |
| defaultStorageClass.allowVolumeExpansion | bool   | `true`                                                    | Allow volume expansion for a default storage class                                 |
| defaultStorageClass.enabled              | bool   | `false`                                                   | Create default storage class                                                       |
| defaultStorageClass.name                 | string | `"vsphere-csi"`                                           | Name of the default storage class                                                  |
| images.csiAttacher.repo                  | string | `"registry.k8s.io/sig-storage/csi-attacher"`              | Repo for the CSI attacher                                                          |
| images.csiAttacher.tag                   | string | `"v4.5.1"`                                                | Tag for the CSI attacher                                                           |
| images.csiProvisioner.repo               | string | `"registry.k8s.io/sig-storage/csi-provisioner"`           | Repo for the CSI provisioner                                                       |
| images.csiProvisioner.tag                | string | `"v4.0.1"`                                                | Tag for the CSI provisioner                                                        |
| images.csiResizer.repo                   | string | `"registry.k8s.io/sig-storage/csi-resizer"`               | Repo for the CSI resizer                                                           |
| images.csiResizer.tag                    | string | `"v1.10.1"`                                               | Tag for the CSI resizer                                                            |
| images.csiSnapshotter.repo               | string | `"registry.k8s.io/sig-storage/csi-snapshotter"`           | Repo for the CSI snapshotter                                                       |
| images.csiSnapshotter.tag                | string | `"v7.0.2"`                                                | Tag for the CSI snapshotter                                                        |
| images.driver.repo                       | string | `"registry.k8s.io/csi-vsphere/driver"`                    | Repo for the vcenter CSI provider driver                                           |
| images.driver.tag                        | string | `"v3.3.1"`                                                | Tag for the vcenter CSI provider driver                                            |
| images.livenessProbe.repo                | string | `"registry.k8s.io/sig-storage/livenessprobe"`             | Repo for the livenessprobe                                                         |
| images.livenessProbe.tag                 | string | `"v2.12.0"`                                               | Tag for the livenessprobe                                                          |
| images.nodeDriverRegistrar.repo          | string | `"registry.k8s.io/sig-storage/csi-node-driver-registrar"` | Repo for the CSI driver registrar                                                  |
| images.nodeDriverRegistrar.tag           | string | `"v2.10.1"`                                               | Tag for the CSI driver registrar                                                   |
| images.syncer.repo                       | string | `"registry.k8s.io/csi-vsphere/syncer"`                   | Repo for the vcenter CSI provider syncer                                           |
| images.syncer.tag                        | string | `"v3.3.1"`                                                | Tag for the vcenter CSI provider syncer                                            |
| node.kubeletPath                         | string | `"/var/lib/kubelet"`                                      | Kubelet path on the node                                                           |
| node.tolerations                         | map    |                                                           | Node provisioner tolerations                                                       |
| vcenterConfig.clusterID                  | string | `""`                                                      | The unique cluster identifier                                                      |
| vcenterConfig.datacenters                | string | `""`                                                      | List of all comma separated datacenter paths where Kubernetes node VMs are present |
| vcenterConfig.enabled                    | bool   | `false`                                                   | Create vcenter config secret                                                       |
| vcenterConfig.insecure                   | string | `"true"`                                                  | Set to true if you use self-signed certificate                                     |
| vcenterConfig.password                   | string | `""`                                                      | Password for a vCenter Server user                                                 |
| vcenterConfig.port                       | string | `"443"`                                                   | vCenter Server port.                                                               |
| vcenterConfig.secretName                 | string | `"vcenter-config-secret"`                                 | Name of the vcenter config secret                                                  |
| vcenterConfig.thumbprint                 | string | `""`                                                      | The certificate thumbprint (optional)                                              |
| vcenterConfig.user                       | string | `""`                                                      | The vCenter Server username                                                        |
| vcenterConfig.vcenter                    | string | `""`                                                      | IP or FQDN of the vcenter instance                                                 |
