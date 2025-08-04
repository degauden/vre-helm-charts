# VRE Helm charts repository

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

