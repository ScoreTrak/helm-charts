#!/bin/bash
set -m

echo "========================================"
echo "Please wait for ScoreTrak to be deployed"
echo "========================================"
bash -c 'helm upgrade --install release ./charts/envoy --timeout 600' &

until [ "$(kubectl get csr | grep release | wc -l)" -eq "4" ]; do 
    echo "waiting for certs to become available"
    sleep 5 
done

echo "approving certificates"
kubectl certificate approve default.node.release-cockroachdb-0 default.node.release-cockroachdb-1 default.node.release-cockroachdb-2 default.client.root
fg
echo "Navigate to localhost:30080 to see scoretrak"