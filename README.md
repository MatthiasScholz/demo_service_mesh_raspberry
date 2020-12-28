# Raspberry Service Mesh

Using balenaCloud to develop a cluster with a service mesh.

## Development

Switching the device into 
[local development mode](https://www.balena.io/docs/learn/develop/local-mode/)
is needed beforehand.

- `make scan`
- `make push`
- `make logs`
- `make connect`

## Technology

- [Consul](https://www.consul.io)
- [Envoy](https://www.envoyproxy.io/docs/envoy/latest/start/building.html#arm64-binaries)
- [Nomad](https://www.nomadproject.io)
