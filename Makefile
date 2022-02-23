KIND = $(shell pwd)/bin/kind
kind: 
	$(call go-get-tool,$(KIND),sigs.k8s.io/kind@v0.11.1)
	
start-dev: kind
	kind create cluster --config ./ha-cluster.yaml --image kindest/node:v1.23.0

start-single-node-dev: kind
	kind create cluster --config ./single-node-cluster.yaml --image kindest/node:v1.23.0

apply-scoretrak:
	helm dep update ./charts/scoretrak
	@echo "========================================"
	@echo "Please wait for ScoreTrak to be deployed"
	@echo "========================================"
	helm upgrade --timeout 1800s --install release ./charts/scoretrak
	@echo "Navigate to localhost:30080 to see scoretrak"

apply-single-node-scoretrak:
	helm dep update ./charts/scoretrak
	@echo "========================================"
	@echo "Please wait for ScoreTrak to be deployed"
	@echo "========================================"
	helm upgrade --timeout 1800s --install release ./charts/scoretrak -f ./charts/scoretrak/single-node.yaml
	@echo "Navigate to localhost:30080 to see scoretrak"

stop-dev: kind
	kind delete cluster || true

reapply-scoretrak:
	helm upgrade --install release ./charts/scoretrak

dry-run-scoretrak:
	helm upgrade --timeout 600s --install release ./charts/scoretrak --dry-run

reapply-single-node-scoretrak:
	helm upgrade --install release ./charts/scoretrak -f ./charts/scoretrak/single-node.yaml

dry-run-single-node--scoretrak:
	helm upgrade --timeout 600s --install release ./charts/scoretrak --dry-run -f ./charts/scoretrak/single-node.yaml


dev: stop-dev start-dev apply-scoretrak

single-node-dev: stop-dev start-single-node-dev apply-single-node-scoretrak