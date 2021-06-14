# nsqlookupd Helm Chart

[nsqlookupd](https://nsq.io/components/nsqlookupd.html) is the daemon that manages topology information.

## Add ScoreTrak Helm repository

```console
helm repo add scoretrak https://scoretrak.github.io/helm-charts
```

## Install NSQlookupd

The following command installs 3 instances of nsqlookupd with a hard pod anti-affinity.

```console
helm install nsqlookupd scoretrak/nsqlookupd
```

## Test your deployment

You can test your deployment with the following command. Please note that you if you have pod anti-affinity rules, there must be a node for the test pod in order for the test to run.

```console
helm test <name_of_your_replease> [--logs]
```

## Configuration

The following table lists the configurable parameters of the nsqlookupd chart and their default values.

| Key                         | Type   | Default                                                  | Description                                                                                                 |
| --------------------------- | ------ | -------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| budget.enabled              | bool   | `true`                                                   | Enable Pod Distribution Budget for StatefulSet Pods                                                         |
| budget.minAvailable         | int    | `1`                                                      | Number of pods to be available at all times                                                                 |
| fullnameOverride            | string | `""`                                                     | String to override nsqlookupd.fullname template                                                             |
| image.pullPolicy            | string | `"IfNotPresent"`                                         | Container pull policy                                                                                       |
| image.repository            | string | `"nsqio/nsq"`                                            | Container image name                                                                                        |
| image.tag                   | string | `"v1.1.0"`                                               | Container iamge tag                                                                                         |
| imagePullSecrets            | list   | `[]`                                                     | Secrets to pull container image                                                                             |
| nameOverride                | string | `""`                                                     | String to override nsqlookupd.name template                                                                 |
| nodeAffinity                | object | `{}`                                                     | Node affinity rules for StatefulSet Pods                                                                    |
| podAffinity                 | object | `{}`                                                     | Pod affinity rules for StatefulSet Pods                                                                     |
| podAnnotations              | object | `{}`                                                     | Additional annotations for StatefulSet Pods                                                                 |
| podAntiAffinity             | object | `{"topologyKey":"kubernetes.io/hostname","type":"hard"}` | Pod anti-affinity rules for StatefulSet Pods                                                                |
| podAntiAffinity.topologyKey | string | `"kubernetes.io/hostname"`                               | The topologyKey for auto-anti-affinity tules                                                                |
| podAntiAffinity.type        | string | `"hard"`                                                 | TYpe of auto anti-affinity rules                                                                            |
| podManagementPolicy         | string | `"Parallel"`                                             | Pod Management Policy for StatefulSet Pod's creation and deletion order. Either "OrderedReady" or "Parallel |
| replicaCount                | int    | `3`                                                      | Statefulset replica count                                                                                   |
| resources                   | object | `{}`                                                     | Resource requests and lmits for StatefulSet Pods                                                            |
| service.http.externalPort   | int    | `4161`                                                   | External http port to expose for Service                                                                    |
| service.http.internalPort   | int    | `4161`                                                   | Internal http port to expose in StatefulSet Pods                                                            |
| service.tcp.externalPort    | int    | `4160`                                                   | External tcp port to expose for Service                                                                     |
| service.tcp.internalPort    | int    | `4160`                                                   | Internal tcp port to expose in StatefulSet Pods                                                             |
| service.type                | string | `"ClusterIP"`                                            | Service type for nsqlookupd service                                                                         |
| updateStrategy.type         | string | `"RollingUpdate"`                                        | Update strategy for StatefulSet Pods.                                                                       |
Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
helm install nsqlookupd scoretak/nsqlookupd -f values.yaml
```