device_id := 94af6c0
device_ip := 192.168.178.90

build:
	@echo "INFO :: Building the application"
	balena build

push-emulate:
	@echo "INFO :: Emulate push and locally"
	balena push cluster --emulated

live:
	@echo "INFO :: Pushing changes to the device: $(device_id)"
	balena push $(device_id).local --detached

push:
	@echo "INFO :: Pushing changes to the device: $(device_id)"
	balena push $(device_id).local --nocache --nolive --debug

logs:
	@echo "INFO :: Getting log data from the device: $(device_id)"
	balena logs $(device_id).local

logs-system:
	@echo "INFO :: Getting the system log data from the device: $(device_id)"
	balena logs $(device_id).local --system

logs-socat:
	@echo "INFO :: Getting the Socat log data from the device: $(device_id)"
	balena logs $(device_id).local --service socat

ssh-socat:
	@echo "INFO :: Connectiong to the service socat on the device: $(device_id)"
	balena ssh $(device_id).local socat

logs-consul:
	@echo "INFO :: Getting the Consul log data from the device: $(device_id)"
	balena logs $(device_id).local --service consul

logs-envoy:
	@echo "INFO :: Getting the Envoy log data from the device: $(device_id)"
	balena logs $(device_id).local --service envoy

logs-nomad:
	@echo "INFO :: Getting the Nomad log data from the device: $(device_id)"
	balena logs $(device_id).local --service nomad

logs-app:
	@echo "INFO :: Getting the Application log data from the device: $(device_id)"
	balena logs $(device_id).local --service app

connect:
	@echo "INFO :: SSH into the device"
	balena ssh $(device_id).local

connect-app:
	@echo "INFO :: SSH into the application container"
	balena ssh $(device_id).local app

test-socat:
	@echo "INFO :: Connecting to unencrypeted Socat"
	nc $(device_ip) 8181

test-web:
	nc $(device_ip) 9191

consul-members:
	@echo "INFO :: Status of Consul cluster"
	CONSUL_HTTP_ADDR=http://$(device_ip):8500 consul members
	CONSUL_HTTP_ADDR=http://$(device_ip):8500 consul catalog nodes -detailed
	CONSUL_HTTP_ADDR=http://$(device_ip):8500 consul catalog services

consul-connect-service-sidecar-socat:
	CONSUL_HTTP_ADDR=http://$(device_ip):8500 consul services register socat/socat.hcl
	CONSUL_HTTP_ADDR=http://$(device_ip):8500 consul connect proxy -sidecar-for socat

consul-connect-service-sidecar-web:
	CONSUL_HTTP_ADDR=http://$(device_ip):8500 consul services register socat/web.hcl
	CONSUL_HTTP_ADDR=http://$(device_ip):8500 consul connect proxy -sidecar-for web

consul-connect-service-intention-allow:
	@echo "INFO :: Creation of an intetion to allow traffic."
	consul intention create web socat
