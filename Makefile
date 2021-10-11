KIND = $(shell pwd)/bin/kind
kind: 
	$(call go-get-tool,$(KIND),sigs.k8s.io/kind@v0.11.0)
	
start-dev: kind
	kind create cluster --config ./ha-cluster.yaml

apply-scoretrak:
	bash ./scripts/deploy-scoretrak.sh
stop-dev: kind
	kind delete cluster || true

reapply-scoretrak:
	helm upgrade --install release ./charts/scoretrak

dry-run-scoretrak:
	helm upgrade --timeout 600s --install release ./charts/scoretrak --dry-run
stop-dev: kind
	kind delete cluster || true

dev: stop-dev start-dev apply-scoretrak