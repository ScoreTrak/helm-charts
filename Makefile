KIND = $(shell pwd)/bin/kind
kind: 
	$(call go-get-tool,$(KIND),sigs.k8s.io/kind@v0.11.1)
	
start-dev: kind
	kind create cluster --config ./ha-cluster.yaml --image kindest/node:v1.23.0

apply-scoretrak:
	helm dep update ./charts/scoretrak
	@echo "========================================"
	@echo "Please wait for ScoreTrak to be deployed"
	@echo "========================================"
	helm install --timeout 1800s release ./charts/scoretrak

stop-dev: kind
	kind delete cluster || true

reapply-scoretrak:
	helm upgrade --install release ./charts/scoretrak

dry-run-scoretrak:
	helm upgrade --timeout 600s --install release ./charts/scoretrak --dry-run

dev: stop-dev start-dev apply-scoretrak