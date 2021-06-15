# nsqd Helm Chart

[nsqd](https://nsq.io/components/nsqd.html) is the daemon that manages topology information.

## Add ScoreTrak Helm repository

```console
helm repo add scoretrak https://scoretrak.github.io/helm-charts
```

## Install nsqd

```console
helm install nsqd scoretrak/nsqd
```

## Subcharts

This chart uses the following subchart and can be configured under the nsqlookupd key in the values.yaml

- [nsqlookupd](../nsqlookupd/README.md)

## Tests

Test your deployment with the following command. Please note that you if you have pod anti-affinity rules, there must be a node for the test pod in order for the test to run.

```console
helm test <name_of_your_release> [--logs]
```

## Configuration

The following table lists the configurable parameters of the nsqd chart and their default values.

| Key                           | Type   | Default                                                  | Description                                                                                                 |
| ----------------------------- | ------ | -------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| budget.enabled                | bool   | `true`                                                   | Enable Pod Distribution Budget for StatefulSet Pods                                                         |
| budget.minAvailable           | int    | `1`                                                      | Number of pods to be available at all times                                                                 |
| fullnameOverride              | string | `""`                                                     | String to override nsqd.fullname template                                                                   |
| image.pullPolicy              | string | `"IfNotPresent"`                                         | Container pull policy                                                                                       |
| image.repository              | string | `"nsqio/nsq"`                                            | Container image name                                                                                        |
| image.tag                     | string | `"v1.1.0"`                                               | Container image tag                                                                                         |
| imagePullSecrets              | list   | `[]`                                                     | Secrets to pull container image                                                                             |
| nameOverride                  | string | `""`                                                     | String to override nsqd.name template                                                                       |
| nodeAffinity                  | object | `{}`                                                     | Node affinity rules for StatefulSet Pods                                                                    |
| nsqlookupd.replicaCount       | int    | `3`                                                      | nsqlookupd replica count                                                                                    |
| nsqlookupd.use                | bool   | `true`                                                   | Use nsqlookupd helm chart to create nsqlookupd instances                                                    |
| persistentVolume.enabled      | bool   | `true`                                                   | Enable Persistent Volumes for StatefulSet Pods                                                              |
| persistentVolume.size         | string | `"1Gi"`                                                  | Size of Persistent Volumes for StatefulSet Pods                                                             |
| persistentVolume.storageClass | string | `nil`                                                    | Storage Class to use when creating Persistent Volumes. "-" means empty.                                     |
| podAffinity                   | object | `{}`                                                     | Pod affinity rules for StatefulSet Pods                                                                     |
| podAnnotations                | object | `{}`                                                     | Additional annotations for StatefulSet Pods                                                                 |
| podAntiAffinity               | object | `{"topologyKey":"kubernetes.io/hostname","type":"hard"}` | Pod anti-affinity rules for StatefulSet Pods                                                                |
| podAntiAffinity.type          | string | `"hard"`                                                 | TYpe of auto anti-affinity rules                                                                            |
| podManagementPolicy           | string | `"Parallel"`                                             | Pod Management Policy for StatefulSet Pod's creation and deletion order. Either "OrderedReady" or "Parallel |
| replicaCount                  | int    | `3`                                                      | Statefulset replica count                                                                                   |
| resources                     | object | `{}`                                                     | Resource requests and lmits for StatefulSet Pods                                                            |
| service.http.externalPort     | int    | `4151`                                                   | External http port to expose for Service                                                                    |
| service.http.internalPort     | int    | `4151`                                                   | Internal http port to expose in StatefulSet Pods                                                            |
| service.tcp.externalPort      | int    | `4150`                                                   | External tcp port to expose for Service                                                                     |
| service.tcp.internalPort      | int    | `4150`                                                   | Internal tcp port to expose in StatefulSet Pods                                                             |
| service.type                  | string | `"ClusterIP"`                                            | Service type for nsqlookupd service                                                                         |
| updateStrategy.type           | string | `"RollingUpdate"`                                        | Update strategy for StatefulSet Pods.                                                                       |
Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
helm install nsqd scoretrak/nsqd -f values.yaml
```