KIND = $(shell pwd)/bin/kind
kind: 
	$(call go-get-tool,$(KIND),sigs.k8s.io/kind@v0.11.0)
	
start-dev: kind
	kind create cluster --config ./ha-cluster.yaml
	
apply-envoy:
	bash ./scripts/deploy-envoy.sh
stop-dev: kind
	kind delete cluster || true
	

dev: stop-dev start-dev apply-envoy