# nsq Helm Chart

[nsq](https://nsq.io/) is a realtime distributed messaging platform.

## Add ScoreTrak Helm repository

```console
helm repo add scoretrak https://scoretrak.github.io/helm-charts
```

## Install nsq

```console
cd charts/nsq
helm dependency update

helm install release scoretrak/nsq
```

## Subcharts

This chart uses the following charts. 

- [nsqlookupd](./charts/nsqlookupd)
- [nsqd](./charts/nsqd)
- [nsqadmin](./charts/nsqadmin)

## Global Configuration

The following table lists the configurable parameters of the nsq chart and their default values.

| Parameter                        | Description                                                                                                              | Default |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | ------- |
| `global.nsqlookupd.replicaCount` | nsqlookupd statefulset replica numer (This is global so nsqd and nsq know how many nsqlookupd instances are there.) | `2`     |

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

## Subchart Coniguration

To edit the configuration of the sub charts, you may prefix the parameters with the chart name. Example: `nsqd.image`, `nsqlookupd.replicaCount`.

```bash
helm install --name nsq -f values.yaml scoretrak/nsq
```