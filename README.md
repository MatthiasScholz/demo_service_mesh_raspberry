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

## Communication with Hardware

For single-container applications,
you will automatically have access to /dev and these interfaces 
as the container is run in privileged mode. 

This means you should be able to use any hardware modules 
like you would in a vanilla Linux environment.

Multicontainer applications do not run containers in privileged mode by default.

## Technology

- [Consul](https://www.consul.io)
- [Envoy](https://www.envoyproxy.io/docs/envoy/latest/start/building.html#arm64-binaries)
- [Nomad](https://www.nomadproject.io)


## References

- [Balena: Dockerfiles](https://www.balena.io/docs/learn/develop/dockerfile/)
- [Balena: Base Images](https://www.balena.io/docs/reference/base-images/base-images/)
- [Balena: Local Development Mode](https://www.balena.io/docs/learn/develop/local-mode/)
- [Balena: Deploy your Fleet](https://www.balena.io/docs/learn/deploy/deployment/#balena-push)
- [Balena: Interact with hardware](https://www.balena.io/docs/learn/develop/hardware/)
- [Balena: Communicate outside the container](https://www.balena.io/docs/learn/develop/runtime/)
