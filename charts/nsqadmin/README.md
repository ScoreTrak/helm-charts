# nsqadmin Helm Chart

[nsqadmin](https://nsq.io/components/nsqadmin.html) is the daemon that manages topology information.

## Add ScoreTrak Helm repository

```console
helm repo add scoretrak https://scoretrak.github.io/helm-charts
```

## Install nsqadmin

```console
helm install release scoretrak/nsqadmin
```

## Configuration

The following table lists the configurable parameters of the nsqadmin chart and their default values.

| Parameter                       | Description                                                                                               | Default                     |
| ------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------- |
| `enabled`                       | Booelan flag on whether to deploy nsqadmin                                                                | `true`                      |
| `replicaCount`                  | StatefulSet replicas number                                                                               | `1`                         |
| `nameOverride`                  | String to partially override common.names.fullname template with a string (will prepend the release name) | `""`                        |
| `fullnameOverride`              | String to partially override common.names.fullname template with a string (will prepend the release name) | `""`                        |
| `service.type`                  | Image Tag for localProvisioner                                                                            | `ClusterIP`                 |
| `imagePullSecrets`              | Image for admission server                                                                                | `[]`                        |
| `image.repository`              | Container image name                                                                                      | `nsqio/nsq`                 |
| `image.tag`                     | Container image tag                                                                                       | `""`                        |
| `image.pullPolicy`              | Container pull policy                                                                                     | `IfNotPresent`              |
| `resources`                     | Resource requests and limits for StatefulSet Pods                                                         | `{}`                        |
Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
helm install --name nsq -f values.yaml scoretrak/nsqadmin
```