service {
  name = "web"
  address = "192.168.178.90"
  port = 8080

  connect {
    sidecar_service {
      proxy {
        upstreams = [
          {
            destination_name = "socat"
            local_bind_port  = 9191
          }
        ]
      }
    }
  }
}
