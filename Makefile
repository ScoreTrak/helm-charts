KIND = $(shell pwd)/bin/kind
kind: 
	$(call go-get-tool,$(KIND),sigs.k8s.io/kind@v0.11.0)
	
start-dev: kind
	kind create cluster --config ./ha-cluster.yaml

apply-scoretrak:
	@echo "========================================"
	@echo "Please wait for ScoreTrak to be deployed"
	@echo "========================================"
	helm upgrade --timeout 600s --install release ./charts/scoretrak
	@echo "Navigate to localhost:30080 to see scoretrak"

stop-dev: kind
	kind delete cluster || true

reapply-scoretrak:
	helm upgrade --install release ./charts/scoretrak

dry-run-scoretrak:
	helm upgrade --timeout 600s --install release ./charts/scoretrak --dry-run
stop-dev: kind
	kind delete cluster || true

dev: stop-dev start-dev apply-scoretrak