# nsqlookupd Helm Chart

[nsqlookupd](https://nsq.io/components/nsqlookupd.html) is the daemon that manages topology information.

## Add ScoreTrak Helm repository

```console
helm repo add scoretrak https://scoretrak.github.io/helm-charts
```

## Install NSQlookupd

```console
helm install nsqlookupd scoretrak/nsqlookupd
```

Notes:
- By defualt, node affinity is set to enforce only one nsqlookupd per node

## Test your deployment

```console
helm test <name_of_your_deployment> [--logs]
```

## Configuration

The following table lists the configurable parameters of the nsqlookupd chart and their default values.

| Parameter                                     | Description                                                                                               | Default                     |
| --------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------- |
| `replicaCount`                                | StatefulSet replicas number                                                                               | `1`                         |
| `image.repository`                            | Container image name                                                                                      | `nsqio/nsq`                 |
| `image.pullPolicy`                            | Container pull policy                                                                                     | `IfNotPresent`              |
| `image.tag`                                   | Container image tag                                                                                       | `""`                        |
| `imagePullSecrets`                            | Secrets for container registry                                                                            | `[]`                        |
| `nameOverride`                                | String to partially override common.names.fullname template with a string (will prepend the release name) | `""`                        |
| `fullnameOverride`                            | String to partially override common.names.fullname template with a string (will prepend the release name) | `""`                        |
| `podAnnotations`                              | Pod Annotations for the StatefulSet                                                                       | `{}`                        |
| `podSecurityContext`                          | Pod Seucirty Context for StatefulSet                                                                      | `{}`                        |
| `securityContext`                             | Security Context for Container                                                                            | `{}`                        |
| `service.type`                                | Type for serviice for statefulset                                                                         | `ClusterIP`                 |
| `resources`                                   | Resource requests and limits for StatefulSet Pods                                                         | `{}`                        |
| `budget.enabled`                              | Flag to enabled k8s PodDisruptionBudget                                                                   | `true`                      |
| `budget.minAvailable`                         | k8s PodDisruptionBudget parameter                                                                         | `1`                         |
| `budget.maxUnavailable`                       | k8s PodDisruptionBudget parameter                                                                         | `""`                        |
| `podManagementPolicy`                         | Number of localProvisioner Replicas                                                                       | `"OrderedReady`             |
| `updateStrategy`                              | Update strategy for StatefulSet Pods                                                                      | `{"type": "RollingUpdate"}` |
| `nodeAffinity`                                | Node affinity rules of StatefulSet Pods                                                                   | `{}`                        |
| `podAffinity`                                 | Inter-Pod affinity rules of StatefulSet Pods                                                              | `{}`                        |
| `podAntiAffinity`                             | Anti-affinity rules of StatefulSet Pods                                                                   | `auto`                      |
| `podAntiAffinity.type`                        | Type of auto anti-affinity rules                                                                          | `"hard"`                    |
| `podAntiAffinity.topologyKey`                 | The topologyKey for auto anti-affinity rules                                                              | `"kubernetes.io/hostname"`  |
| `podAntiAffinity.weight`                      | Weight for soft auto anti-affinity rules                                                                  |                             |
| `topologySpreadConstraints.maxSkew`           | Degree to which Pods may be unevenly distributed                                                          | `1`                         |
| `topologySpreadConstraints.maxSkew`           | The key of node labels                                                                                    | `"kubernetes.io/hostname"`  |
| `topologySpreadConstraints.whenUnsatisfiable` | ScheduleAnyway/DoNotSchedule for unsatisfiable constraints                                                | `DoNotSchedule`             |
Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
helm install nsq scoretak/nsqlookupd -f values.yaml
```