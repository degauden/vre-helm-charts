up: 
	skaffold run

create-cluster:	
	kind create cluster --config=dev/kind-config.yaml


ingress: 
	kubectl apply -f https://kind.sigs.k8s.io/examples/ingress/deploy-ingress-nginx.yaml
	kubectl wait --namespace ingress-nginx \
		  --for=condition=ready pod \
		  --selector=app.kubernetes.io/component=controller \
		  --timeout=90s

.PHONY: create-cluster ingress
