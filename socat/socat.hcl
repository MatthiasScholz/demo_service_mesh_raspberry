service {
  name = "socat"
  id = "socat"
  address = "192.168.178.90"
  port = 8181

  connect {
    sidecar_service {}
  }
}
