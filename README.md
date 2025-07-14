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

For complete list of helm chart values, see chart [doc](vre/README.md).

### 
