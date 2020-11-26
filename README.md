# Mirantis Helm Charts

Popular applications provided by [Mirantis](https://mirantis.com), ready to install and launch using [Kubernetes Helm](https://github.com/helm/helm)

## TL;DR

```bash
$ helm repo add mirantis https://charts.mirantis.com
$ helm search repo mirantis
$ helm install my-release mirantis/<package-name>
```

## Before you begin

### Setup a Kubernetes Cluster

For setting up Kubernetes on cloud platforms or bare-metal servers refer to the Kubernetes [getting started guide](http://kubernetes.io/docs/getting-started-guides/).

### Install Helm

Helm is a tool for managing Kubernetes charts. Charts are packages of pre-configured Kubernetes resources.

To install Helm, refer to the [Helm install guide](https://github.com/helm/helm#install) and ensure that the `helm` binary is in the `PATH` of your shell.

### Add Repo

The following command allows you to download and install all the charts from this repository:

```bash
$ helm repo add mirantis https://charts.mirantis.com
```

### Using Helm

Once you have installed the Helm client, you can deploy a Mirantis Helm Chart into a Kubernetes cluster.

Please refer to the [Quick Start guide](https://helm.sh/docs/intro/quickstart/) if you wish to get running in just a few commands, otherwise the [Using Helm Guide](https://helm.sh/docs/intro/using_helm/) provides detailed instructions on how to use the Helm client to manage packages on your Kubernetes cluster.

Useful Helm Client Commands:
* View available charts: `helm search repo`
* Install a chart: `helm install my-release mirantis/<package-name>`
* Upgrade your application: `helm upgrade`

# License

Copyright (c) 2020 Mirantis, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
