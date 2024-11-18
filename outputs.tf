output "id" {
  value       = hcloud_server.current.id
  description = "The internal Hetzner ID for the server."
}

output "name" {
  value       = hcloud_server.current.name
  description = "The name of the Hetzner Cloud server."
}

output "server_type" {
  value       = hcloud_server.current.server_type
  description = "The type of Hetzner Cloud server that was created."
}

output "image" {
  value       = hcloud_server.current.image
  description = "The image used to create the Hetzner Cloud server."
}

output "location" {
  value       = hcloud_server.current.location
  description = "The location of the Hetzner Cloud server."
}

output "datacenter" {
  value       = hcloud_server.current.datacenter
  description = "The datacenter the new Hetzner Cloud server is provisioned in."
}

output "backups" {
  value       = hcloud_server.current.backups
  description = "The new server's automatic backup setting (boolean)."
}

output "backup_window" {
  value       = hcloud_server.current.backup_window
  description = "The new server's backup window, if enabled."
}

output "iso" {
  value       = hcloud_server.current.iso
  description = "The ID or name of the mounted ISO image."
}

output "ipv4_address" {
  value       = hcloud_server.current.ipv4_address
  description = "The IPv4 address the server is configured with."
}

output "ipv6_address" {
  value       = hcloud_server.current.ipv6_address
  description = "The IPv6 address the server is configured with."
}

output "ipv6_network" {
  value       = hcloud_server.current.ipv6_network
  description = "The IPv6 network the server is configured in."
}

output "status" {
  value       = hcloud_server.current.status
  description = "The current server status."
}

output "labels" {
  value       = hcloud_server.current.labels
  description = "The labels attached to the new Hetzner Cloud server."
}

output "network" {
  value       = hcloud_server.current.network
  description = "The network the Hetzner Cloud server should be attached to."
}

output "firewall_ids" {
  value       = hcloud_server.current.firewall_ids
  description = "The firewall IDs the server is attached to."
}

output "placement_group_id" {
  value       = hcloud_server.current.placement_group_id
  description = "The placement group's ID for the new server."
}

output "delete_protection" {
  value       = hcloud_server.current.delete_protection
  description = "Whether or not deletion protection is enabled for the server."
}

output "rebuild_protection" {
  value       = hcloud_server.current.rebuild_protection
  description = "Whether or not rebuild protection is enabled for the server."
}
