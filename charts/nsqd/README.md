# nsqd Helm Chart

[nsqd](https://nsq.io/components/nsqd.html) is the daemon that manages topology information.

## Add ScoreTrak Helm repository

```console
helm repo add scoretrak https://scoretrak.github.io/helm-charts
```

## Install nsqd

```console
helm install release scoretrak/nsqd
```

## Configuration

The following table lists the configurable parameters of the nsqd chart and their default values.

| Parameter                       | Description                                                                                               | Default                     |
| ------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------- |
| `replicaCount`                  | StatefulSet replicas number                                                                               | `1`                         |
| `nameOverride`                  | String to partially override common.names.fullname template with a string (will prepend the release name) | `""`                        |
| `fullnameOverride`              | String to partially override common.names.fullname template with a string (will prepend the release name) | `""`                        |
| `service.type`                  | Image Tag for localProvisioner                                                                            | `ClusterIP`                 |
| `imagePullSecrets`              | Image for admission server                                                                                | `[]`                        |
| `image.repository`              | Container image name                                                                                      | `nsqio/nsq`                 |
| `image.tag`                     | Container image tag                                                                                       | `""`                        |
| `image.pullPolicy`              | Container pull policy                                                                                     | `IfNotPresent`              |
| `budget.minAvailable`           | k8s PodDisruptionBudget parameter                                                                         | `1`                         |
| `budget.maxUnavailable`         | k8s PodDisruptionBudget parameter                                                                         | `""`                        |
| `podManagementPolicy`           | Number of localProvisioner Replicas                                                                       | `"OrderedReady`             |
| `updateStrategy`                | Update strategy for StatefulSet Pods                                                                      | `{"type": "RollingUpdate"}` |
| `annotations`                   | Additional annotations of StatefulSet Pods                                                                | `{}`                        |
| `nodeAffinity`                  | Node affinity rules of StatefulSet Pods                                                                   | `{}`                        |
| `podAffinity`                   | Inter-Pod affinity rules of StatefulSet Pods                                                              | `{}`                        |
| `podAntiAffinity`               | Anti-affinity rules of StatefulSet Pods                                                                   | `auto`                      |
| `podAntiAffinity.type`          | Type of auto anti-affinity rules                                                                          | `"hard"`                    |
| `podAntiAffinity.topologyKey`   | The topologyKey for auto anti-affinity rules                                                              | `"kubernetes.io/hostname"`  |
| `podAntiAffinity.weight`        | Weight for soft auto anti-affinity rules                                                                  |                             |
| `resources`                     | Resource requests and limits for StatefulSet Pods                                                         | `{}`                        |
| `persistentVolume.enabled`      | Enable persistence using PVC                                                                              | `true`                      |
| `persistentVolume.size`         | PVC Storage Class for PostgreSQL volume                                                                   | `1Gi`                       |
| `persistentVolume.storageClass` | PVC Storage Class for PostgreSQL volume                                                                   | `nil`                       |
Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
helm install --name nsq -f values.yaml scoretrak/nsqd
```