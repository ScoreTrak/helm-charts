# NSQ

[NSQ](https://nsq.io/) is a realtime distributed messaging platform.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0
- PV provisioner support in the underlying infrastructure

## Parameters

The following table lists the configurable parameters of the NSQ chart and their default values per section/component:

### Common parameters

| Parameter           | Description                                                                  | Default                                                 |
|---------------------|------------------------------------------------------------------------------|---------------------------------------------------------|
| `image.tag`         | NSQ Image tag (automatically pulled from the Chart's app version)            | `v1.1.0`                                                |
| `image.pullPolicy`  | NSQ image pull policy                                                        | `IfNotPresent`                                          |
| `nameOverride`      | String to partially override nsq.fullname template                           | `nil`                                                   |
| `fullnameOverride`  | String to fully override nsq.fullname template                               | `nil`                                                   |


### Volume parameters

| Parameter                          | Description                                        | Default               |
|------------------------------------|----------------------------------------------------|-----------------------|
| `persistentVolume.enabled`         | Use a persistent volume                            | `false`               |
| `persistentVolume.size`            | Size of the persistent volume                      | `1Gi`                 |
| `persistentVolume.storageClass`    | Name of the Storage Class in your k8s cluster      | `""`                  |



### Traffic Exposure Parameters
#### Experimental

| Parameter                        | Description                                              | Default                        |
|----------------------------------|----------------------------------------------------------|--------------------------------|
| `service.port`                   | Service HTTP port                                        | `4171`                         |
| `ingress.enabled`                | Enable ingress controller resource                       | `false`                        |
| `ingress.hostname`               | Default host for the ingress resource                    | `scoretrak-nsq.mk.localhost`                |
| `ingress.path`                   | Default path for the ingress resource                    | `/`                            |
| `ingress.tls`                    | Create TLS Secret                                        | `false`                        |