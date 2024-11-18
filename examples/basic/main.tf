module "hetzner_server_example" {
  source = ".."

  name     = "example-server"
  type     = "cpx11"
  image    = "ubuntu-22.04"
  location = "nbg1"

  networking = {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}
