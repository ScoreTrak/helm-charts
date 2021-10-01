# nsq Helm Chart

[nsq](https://nsq.io/) is a realtime distributed messaging platform. This deploys nsqd, nsqlookupd, and an optional nsqadmin deployment.

## Add ScoreTrak Helm repository

```console
helm repo add scoretrak https://scoretrak.github.io/helm-charts
```

## Install nsq

```console
cd charts/nsq
helm dependency update
helm install nsq scoretrak/nsq
```

## Subcharts

This chart uses the following charts. 

- [nsqd](./charts/nsqd)

## Global Configuration

The following table lists the configurable parameters of the nsq chart and their default values.

| Parameter                        | Description                                                                                                         | Default        |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------------- | -------------- |
| `replicaCount`                   | Statefulset replicas number                                                                                          | `1`            |
| `image.repository`               | Container image name                                                                                                | `nsqio/nsq`    |
| `image.pullPolicy`               | Container pull policy                                                                                               | `IfNotPresent` |
| `image.tag`                      | Container image tag                                                                                                 | `""`           |
| `imagePullSecrets`               | Secrets for container registry                                                                                      | `[]`           |
| `nameOverride`                   | String to partially override common.names.fullname template with a string (will prepend the release name)           | `""`           |
| `fullnameOverride`               | String to partially override common.names.fullname template with a string (will prepend the release name)           | `""`           |
| `service.type`                   | Type for serviice for statefulset                                                                                   | `ClusterIP`    |
| `resources`                      | Resource requests and limits for StatefulSet Pods                                                                   | `{}`           |

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
helm install nsqd scoretrka/nsq -f values.yaml
```

## Subchart Coniguration

To edit the configuration of the sub charts, you may prefix the parameters with the chart name. See values.yaml for an example.
