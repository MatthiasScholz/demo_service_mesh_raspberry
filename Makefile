device_id := "TODO"

setup:
	brew install balena-cli

scan:
	@echo "INFO :: Scanning local network for devices"
	balena scan

push:
	@echo "INFO :: Pushing changes to the device: $(device_id)"
	balena push $(device_id).local --detached

logs:
	@echo "INFO :: Getting log data from the device: $(device_id)"
	balena logs $(device_id).local

logs-system:
	@echo "INFO :: Getting the system log data from the device: $(device_id)"
	balena logs $(device_id).local --system

logs-consul:
	@echo "INFO :: Getting the Consul log data from the device: $(device_id)"
	balena logs $(device_id).local --service consul

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
