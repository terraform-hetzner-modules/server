# ------------------------------------------
#  Hetzner Cloud Placement Group
# ------------------------------------------

resource "hcloud_placement_group" "current" {
  name   = var.name
  type   = var.type
  labels = var.labels
}
