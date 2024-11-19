variable "name" {
  type        = string
  description = "The name to give to the new Hetzner Cloud placement group."
}

variable "type" {
  type        = string
  description = "The type to give to the new Hetzner Cloud placement group."
  default     = "spread"
}

variable "labels" {
  type        = map(string)
  description = "Labels to attach to the new Hetzner Cloud placement group."
  default     = {}
}
