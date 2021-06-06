# ScoreTrak Client Helm Chart

[ScoreTrak's Client](https://github.com/ScoreTrak/client) is the client for scoretrak, the compeptition scoring engine.

## Add ScoreTrak Helm repository

```console
helm repo add scoretrak https://scoretrak.github.io/helm-charts
```

## Install ScoreTrak's Client

```console
helm install release scoretrak/client
```

## Configuration

The following table lists the configurable parameters of the nsqd chart and their default values.

| Parameter          | Description                                                                                               | Default        |
| ------------------ | --------------------------------------------------------------------------------------------------------- | -------------- |
| `replicaCount`     | Deployment replicas number                                                                                | `2`            |
| `image.repository` | Container image name                                                                                      | `nsqio/nsq`    |
| `image.pullPolicy` | Container pull policy                                                                                     | `IfNotPresent` |
| `image.tag`        | Container image tag                                                                                       | `""`           |
| `imagePullSecrets` | Image for admission server                                                                                | `[]`           |
| `nameOverride`     | String to partially override common.names.fullname template with a string (will prepend the release name) | `""`           |
| `fullnameOverride` | String to partially override common.names.fullname template with a string (will prepend the release name) | `""`           |
| `podAnnotations`   | Additional annotations of Deployment Pods                                                                 | `{}`           |
| `service.type`     | Type of Service                                                                                           | `ClusterIP`    |
| `resources`        | Resource requests and limits for StatefulSet Pods                                                         | `{}`           |
| `nodeSelector`     | Node Selelctor for Deployment Pods                                                                        | `{}`           |
| `tolerations`      | Node taints to tolerate by Deployment Pods                                                                | `[]`           |
| `affinity`         | Node affinity rules of Deployment Pods                                                                    | `{}`           |
Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
helm install --name nsq -f values.yaml scoretrak/client
```