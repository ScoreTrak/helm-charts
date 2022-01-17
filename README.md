# ScoreTrak Helm Charts

Helm charts used in the deployment of [ScoreTrak](https://github.com/ScoreTrak/ScoreTrak).

## Usage

To deploy ScoreTrak in its entirety, please go over to the [scoretrak](./charts/scoretrak) helm chart folder for more instructions.

## Main ScoreTrak Chart

- [scoretrak](./charts/scoretrak)

## Sub ScoreTrak Chart

- [server](./charts/server)
- [client](./charts/client)
- [envoy](./charts/envoy)

## Bank Charts

- [commercebackend](./charts/commercebackend)
- [commerceui](./charts/commerceui)
- [payments](./charts/payments)

## Contributing

This helm chart repo utilizes [helm-docs](https://github.com/norwoodj/helm-docs) in a [pre-commit](https://github.com/norwoodj/helm-docs#usage) hook. Please make sure you have the dependencies of hel-docs installed to work on this repo.