# VRE Helm charts repository

## Installation

The ESCAPE VRE Helm chart is published to GitHub Pages and can be installed from the chart repository:

```bash
# Add the VRE Helm chart repository
helm repo add vre-helm-charts https://vre-hub.github.io/vre-helm-charts

# Update your local Helm chart repository cache
helm repo update

# Install the chart
helm install my-vre vre-helm-charts/escape-vre

# Or install with custom values
helm install my-vre vre-helm-charts/escape-vre -f values-custom.yaml
```

To search for available chart versions:

```bash
helm search repo vre-helm-charts/escape-vre --versions
```

## Testing locally


### Setting up cluster


#### Create a cluster

We recommend using [kind](https://kind.sigs.k8s.io/) to test the charts locally. Chart operations are done using [Skaffold](https://skaffold.dev/):

```
$ kind create cluster --config dev/kind-config.yaml
```

#### Install an ingress controller

The easiest and production-like way to access local VRE deployment is by installing a simple ingress controller. Production clusters will almost always have only already included.

```
$ kubectl apply -f https://kind.sigs.k8s.io/examples/ingress/deploy-ingress-nginx.yaml
```

#### Customize local values

Even in a local cluster, you may want to use a real IAM instance. To do that, you will need to customize some secret values. You can do it by copying provided example:

```
$ cp vre/values-custom-example.yaml vre/values-custom.yaml
```

#### Deploy VRE

```
$ skaffold run
```


## Configuration

For complete list of helm chart values, see chart [doc](vre/README.md). These values give a lot of flexibility allow to customize the chart.

Some values almost certainly need to be set in every particular deployment. These values are provided in [vre/values-custom.yaml](vre/values-custom-example.yaml).

## Known issues

* rucio token expires before login to jupyterlab. It means that sometimes it is possible to access jupyterhub but not start session (which relies on token exchange). If you find yourself in this situation, try to relogin to jupyterhub, it is likely to fix the issue.

