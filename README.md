# VRE Helm charts repository

## Testing locally


### Setting up cluster

We recommend using [kind](https://kind.sigs.k8s.io/) to test the charts locally. Chart operations are done using [Skaffold](https://skaffold.dev/):

```
$ kind create cluster --config dev/kind-config.yaml
```


```
$ kubectl apply -f https://kind.sigs.k8s.io/examples/ingress/deploy-ingress-nginx.yaml
```

### Setup using minikube

TODO: 
Edit values for clieent

```
$ skaffold dev
```


## Configuration

For complete list of helm chart values, see chart [doc](vre/README.md). These values give a lot of flexibility allow to customize the chart.

Some values almost certainly need to be set in every particular deployment. These values are provided in [vre/values-custom.yaml](vre/values-custom-example.yaml).

## Manual bootstrap

At the moment bootstrap is done in a job. It is only necessary to manually enable and configure users accounts, see [reana doc](https://docs.reana.io/administration/management/managing-users/).


## TODO

rucio token expires before auth is gone. need to renew it

Add kind cluster
