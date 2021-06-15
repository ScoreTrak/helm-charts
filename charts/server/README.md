# ScoreTrak Server Helm Chart

[ScoreTrak's Server](https://github.com/ScoreTrak/server) is the server for scoretrak, the compeptition scoring engine.

## Add ScoreTrak Helm repository

```console
helm repo add scoretrak https://scoretrak.github.io/helm-charts
```

## Install ScoreTrak's Server

```console
helm install release scoretrak/server
```

## Configuration

The following table lists the configurable parameters of the nsqd chart and their default values.

| Key                                               | Type   | Default                                          | Description                                                                                                            |
| ------------------------------------------------- | ------ | ------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------- |
| cockroachdb.create                                | bool   | `true`                                           | Specifies whether to create a cockroachdb instance                                                                     |
| fullnameOverride                                  | string | `""`                                             | String to override server.fullname template                                                                            |
| image.pullPolicy                                  | string | `"IfNotPresent"`                                 | Container image name                                                                                                   |
| image.repository                                  | string | `"ghcr.io/scoretrak/scoretrak/scoretrak-server"` | Container image name                                                                                                   |
| image.tag                                         | string | `"v0.1.9"`                                       | Container image tag                                                                                                    |
| imagePullSecrets                                  | list   | `[]`                                             | Secrets to pull container image                                                                                        |
| nameOverride                                      | string | `""`                                             | String to override server.name template                                                                                |
| nsqd.use                                          | bool   | `true`                                           | Specifies whether to use nsqd                                                                                          |
| podAnnotations                                    | object | `{}`                                             | Additional annotations for StatefulSet Pods                                                                            |
| production                                        | bool   | `false`                                          | Flag to server whether this is a production deployment or dev deployment                                               |
| replicaCount                                      | int    | `1`                                              | Deployment replica count                                                                                               |
| resources                                         | object | `{}`                                             | Resource requests and limits for Deployment Pods                                                                       |
| service.port                                      | int    | `380`                                            | External grpc port to expose for Service                                                                               |
| service.type                                      | string | `"ClusterIP"`                                    | Service type for server service                                                                                        |
| serviceAccount.annotations                        | object | `{}`                                             | Annotations to add to the service account                                                                              |
| serviceAccount.create                             | bool   | `true`                                           | Specifies whether a service account should be created                                                                  |
| serviceAccount.name                               | string | `""`                                             | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
helm install --name nsq -f values.yaml scoretrak/server
```