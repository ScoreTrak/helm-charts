# ScoreTrak Client Helm Chart

[ScoreTrak's Client](https://github.com/ScoreTrak/client) is the client for scoretrak, the compeptition scoring engine.

## Add ScoreTrak Helm repository

```console
helm repo add scoretrak https://scoretrak.github.io/helm-charts
```

## Install ScoreTrak's Client

```console
helm install client scoretrak/client
```

## Configuration

The following table lists the configurable parameters of the nsqd chart and their default values.

| Key              | Type   | Default                                       | Description                                     |
| ---------------- | ------ | --------------------------------------------- | ----------------------------------------------- |
| fullnameOverride | string | `""`                                          | String to override client.fullname template |
| image.pullPolicy | string | `"IfNotPresent"`                              | Container pull policy                           |
| image.repository | string | `"ghcr.io/scoretrak/client/scoretrak-client"` | Container image name                            |
| image.tag        | string | `"v0.1.7"`                                    | Container image tag                             |
| imagePullSecrets | list   | `[]`                                          | Secrets to pull container image                 |
| nameOverride     | string | `""`                                          | String to override client.name template     |
| podAnnotations   | object | `{}`                                          | Additional annotations for Deployment Pods      |
| replicaCount     | int    | `1`                                           | Deployment replica count                        |
| resources        | object | `{}`                                          | Resource requests and limits for Deployment Pods |
| service.port     | int    | `80`                                          | External port to expose for Service             |
| service.type     | string | `"ClusterIP"`                                 | Service type for client service                 |
Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
helm install client scoretrak/client -f values.yaml
```