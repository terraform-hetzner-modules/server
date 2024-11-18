# Server <img src="https://static-00.iconduck.com/assets.00/terraform-icon-1803x2048-hodrzd3t.png" alt="Terraform Logo" align="right" width="225"/>

## 📖 Docs

Create and manage servers within [Hetzner Cloud][hetzner] using [`terraform`][terraform].

## ✨ TL;DR

```shell
module "hetzner_server_apache" {
  source = "terraform-hetzner-modules/..."
  ...
}
```

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudinit"></a> [cloudinit](#provider\_cloudinit) | 2.3.2 |
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | 1.42.1 |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backups"></a> [backups](#input\_backups) | Whether or not to enable Hetzner's automatic backups. | `bool` | `false` | no |
| <a name="input_cloud_init"></a> [cloud\_init](#input\_cloud\_init) | The cloud\_init configuration to render the template with. | ```object({ gzip = bool base64_encode = bool config = any })``` | ```{ "base64_encode": true, "config": {}, "gzip": true }``` | no |
| <a name="input_create_server"></a> [create\_server](#input\_create\_server) | Whether or not to create a Server. This is true by default of course. | `bool` | `true` | no |
| <a name="input_enable_protection"></a> [enable\_protection](#input\_enable\_protection) | Enable Hetzners 'rebuild' and 'delete' protection. | `bool` | `false` | no |
| <a name="input_firewall_ids"></a> [firewall\_ids](#input\_firewall\_ids) | A list of firewall IDs that should be attached to the server on creation. | `list(string)` | `[]` | no |
| <a name="input_ignore_remote_firewall_ids"></a> [ignore\_remote\_firewall\_ids](#input\_ignore\_remote\_firewall\_ids) | Ignore any updates to the firewall\_ids argument. | `bool` | `false` | no |
| <a name="input_image"></a> [image](#input\_image) | The OS image to use for the new server. | `string` | n/a | yes |
| <a name="input_iso"></a> [iso](#input\_iso) | The name or ID of an ISO image to mount into the machine on creation. | `string` | `null` | no |
| <a name="input_keep_disk"></a> [keep\_disk](#input\_keep\_disk) | Whether or not the disk should be kept when scaling servers. This allows for downgrades later down the line. | `bool` | `false` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | A map of label to attach to the server on creation. | `map(string)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | The datacenter location to create the new machine in. Can be one of the following: 'nbg1', 'fsn1', 'hel1', 'ash' or 'hil'. Default is 'fsn1'. | `string` | `"fsn1"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name given to the new server. Must be unique per Hetzner project and a valid hostname in accordance with RFC 1123. | `string` | n/a | yes |
| <a name="input_networking"></a> [networking](#input\_networking) | The networking settings to apply to the instance. Like whether IPv6 is enabled or not. By default both IPv4 and IPv6 are enabled. The IPv4 address may be manually or automatically assigned via Hetzner. | `any` | `{}` | no |
| <a name="input_placement_group_id"></a> [placement\_group\_id](#input\_placement\_group\_id) | The ID of a placement group to attach to the server. | `string` | `null` | no |
| <a name="input_private_network"></a> [private\_network](#input\_private\_network) | The private network to attach the server to on creation. | `any` | `{}` | no |
| <a name="input_rescue"></a> [rescue](#input\_rescue) | If specified the system will boot into the given rescue system to allow for easy installation of custom operating systems. | `string` | `null` | no |
| <a name="input_shutdown_before_deletion"></a> [shutdown\_before\_deletion](#input\_shutdown\_before\_deletion) | Shutdown the server gracefully before deleting it. | `bool` | `false` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | A list of SSH key names or IDs, which should be injeted into the server at creation. None are injected by default. | `list(string)` | `[]` | no |
| <a name="input_type"></a> [type](#input\_type) | The type of server to create. See the output of Hetzner's CLI hcloud command 'server-type list' for reference. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backup_window"></a> [backup\_window](#output\_backup\_window) | The new server's backup window, if enabled. |
| <a name="output_backups"></a> [backups](#output\_backups) | The new server's automatic backup setting (boolean). |
| <a name="output_datacenter"></a> [datacenter](#output\_datacenter) | The datacenter the new Hetzner Cloud server is provisioned in. |
| <a name="output_delete_protection"></a> [delete\_protection](#output\_delete\_protection) | Whether or not deletion protection is enabled for the server. |
| <a name="output_firewall_ids"></a> [firewall\_ids](#output\_firewall\_ids) | The firewall IDs the server is attached to. |
| <a name="output_id"></a> [id](#output\_id) | The internal Hetzner ID for the server. |
| <a name="output_image"></a> [image](#output\_image) | The image used to create the Hetzner Cloud server. |
| <a name="output_ipv4_address"></a> [ipv4\_address](#output\_ipv4\_address) | The IPv4 address the server is configured with. |
| <a name="output_ipv6_address"></a> [ipv6\_address](#output\_ipv6\_address) | The IPv6 address the server is configured with. |
| <a name="output_ipv6_network"></a> [ipv6\_network](#output\_ipv6\_network) | The IPv6 network the server is configured in. |
| <a name="output_iso"></a> [iso](#output\_iso) | The ID or name of the mounted ISO image. |
| <a name="output_labels"></a> [labels](#output\_labels) | The labels attached to the new Hetzner Cloud server. |
| <a name="output_location"></a> [location](#output\_location) | The location of the Hetzner Cloud server. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Hetzner Cloud server. |
| <a name="output_network"></a> [network](#output\_network) | The network the Hetzner Cloud server should be attached to. |
| <a name="output_placement_group_id"></a> [placement\_group\_id](#output\_placement\_group\_id) | The placement group's ID for the new server. |
| <a name="output_rebuild_protection"></a> [rebuild\_protection](#output\_rebuild\_protection) | Whether or not rebuild protection is enabled for the server. |
| <a name="output_server_type"></a> [server\_type](#output\_server\_type) | The type of Hetzner Cloud server that was created. |
| <a name="output_status"></a> [status](#output\_status) | The current server status. |
<!-- END_TF_DOCS -->

### 🔃 Contributing

Refer to our [documentation for contributors][contributing] for contributing guidelines, commit message
formats and versioning tips.

### 📥 Maintainers

This project is owned and maintained by [FMJ Studios][org] refer to the [`AUTHORS`][authors] or [`CODEOWNERS`][owners]
for more information. You may also use the linked contact details to reach out directly.

### ©️ Copyright

- _Assets provided by:_ **[HashCorp][hashicorp]**
- _Sources provided by:_ **[FMJ Studios][org]** under the **[MIT License][license]**

<!-- INTERNAL REFERENCES -->

<!-- Project references -->

<!-- File references -->

[license]: LICENSE
[contributing]: docs/CONTRIBUTING.md
[authors]: .github/AUTHORS
[owners]: .github/CODEOWNERS

<!-- General links -->

[org]: https://github.com/fmjstudios
[terraform]: https://www.terraform.io/
[hashicorp]: https://www.hashicorp.com/
[hetzner]: https://hetzner.com

<!-- Third-party -->
