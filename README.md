# _Hetzner Cloud_ - Server <img src="https://avatars.githubusercontent.com/u/30047064?s=200&v=4" alt="Hetzner Logo" align="right" width="128"/> <img src="https://raw.githubusercontent.com/fmjstudios/artwork/refs/heads/main/projects/terraform/icon/color/terraform-icon-color.png" alt="Terraform Logo" align="right" width="128"/>

A [Terraform module][module] to create and manage servers within [Hetzner Cloud][hetzner] using [`cloud-init`][cloud-init].

## ✨ TL;DR

```shell
module "hetzner_server_apache" {
  source = "terraform-hetzner-modules/cloud/server"
  ...
}
```

<!-- BEGIN_TF_DOCS -->

## Providers

| Name                                                               | Version |
| ------------------------------------------------------------------ | ------- |
| <a name="provider_cloudinit"></a> [cloudinit](#provider_cloudinit) | ~> 2.3  |
| <a name="provider_hcloud"></a> [hcloud](#provider_hcloud)          | ~> 1.49 |

## Modules

No modules.

## Inputs

| Name                                                                                                            | Description                                                                                                                                                                                               | Type                                                        | Default                                                 | Required |
| --------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- | ------------------------------------------------------- | :------: |
| <a name="input_allow_deprecated_images"></a> [allow_deprecated_images](#input_allow_deprecated_images)          | Enable the use of deprecated images. NOTE: Deprecated images will be removed after three months.                                                                                                          | `bool`                                                      | `false`                                                 |    no    |
| <a name="input_backups"></a> [backups](#input_backups)                                                          | Whether or not to enable Hetzner's automatic backups.                                                                                                                                                     | `bool`                                                      | `false`                                                 |    no    |
| <a name="input_cloud_init"></a> [cloud_init](#input_cloud_init)                                                 | The cloud_init configuration to render the template with.                                                                                                                                                 | `object({ gzip = bool base64_encode = bool config = any })` | `{ "base64_encode": true, "config": {}, "gzip": true }` |    no    |
| <a name="input_create_server"></a> [create_server](#input_create_server)                                        | Whether or not to create a Server. This is true by default of course.                                                                                                                                     | `bool`                                                      | `true`                                                  |    no    |
| <a name="input_enable_protection"></a> [enable_protection](#input_enable_protection)                            | Enable Hetzners 'rebuild' and 'delete' protection.                                                                                                                                                        | `bool`                                                      | `false`                                                 |    no    |
| <a name="input_firewall_ids"></a> [firewall_ids](#input_firewall_ids)                                           | A list of firewall IDs that should be attached to the server on creation.                                                                                                                                 | `list(string)`                                              | `[]`                                                    |    no    |
| <a name="input_ignore_remote_firewall_ids"></a> [ignore_remote_firewall_ids](#input_ignore_remote_firewall_ids) | Ignore any updates to the firewall_ids argument.                                                                                                                                                          | `bool`                                                      | `false`                                                 |    no    |
| <a name="input_image"></a> [image](#input_image)                                                                | The OS image to use for the new server.                                                                                                                                                                   | `string`                                                    | n/a                                                     |   yes    |
| <a name="input_iso"></a> [iso](#input_iso)                                                                      | The name or ID of an ISO image to mount into the machine on creation.                                                                                                                                     | `string`                                                    | `null`                                                  |    no    |
| <a name="input_keep_disk"></a> [keep_disk](#input_keep_disk)                                                    | Whether or not the disk should be kept when scaling servers. This allows for downgrades later down the line.                                                                                              | `bool`                                                      | `false`                                                 |    no    |
| <a name="input_labels"></a> [labels](#input_labels)                                                             | A map of label to attach to the server on creation.                                                                                                                                                       | `map(string)`                                               | `{}`                                                    |    no    |
| <a name="input_location"></a> [location](#input_location)                                                       | The datacenter location to create the new machine in. Can be one of the following: 'nbg1', 'fsn1', 'hel1', 'ash' or 'hil'. Default is 'fsn1'.                                                             | `string`                                                    | `"fsn1"`                                                |    no    |
| <a name="input_name"></a> [name](#input_name)                                                                   | The name given to the new server. Must be unique per Hetzner project and a valid hostname in accordance with RFC 1123.                                                                                    | `string`                                                    | n/a                                                     |   yes    |
| <a name="input_networking"></a> [networking](#input_networking)                                                 | The networking settings to apply to the instance. Like whether IPv6 is enabled or not. By default both IPv4 and IPv6 are enabled. The IPv4 address may be manually or automatically assigned via Hetzner. | `any`                                                       | `{}`                                                    |    no    |
| <a name="input_placement_group_id"></a> [placement_group_id](#input_placement_group_id)                         | The ID of a placement group to attach to the server.                                                                                                                                                      | `string`                                                    | `null`                                                  |    no    |
| <a name="input_private_network"></a> [private_network](#input_private_network)                                  | The private network to attach the server to on creation.                                                                                                                                                  | `any`                                                       | `{}`                                                    |    no    |
| <a name="input_rescue"></a> [rescue](#input_rescue)                                                             | If specified the system will boot into the given rescue system to allow for easy installation of custom operating systems.                                                                                | `string`                                                    | `null`                                                  |    no    |
| <a name="input_shutdown_before_deletion"></a> [shutdown_before_deletion](#input_shutdown_before_deletion)       | Shutdown the server gracefully before deleting it.                                                                                                                                                        | `bool`                                                      | `true`                                                  |    no    |
| <a name="input_ssh_keys"></a> [ssh_keys](#input_ssh_keys)                                                       | A list of SSH key names or IDs, which should be injeted into the server at creation. None are injected by default.                                                                                        | `list(string)`                                              | `[]`                                                    |    no    |
| <a name="input_type"></a> [type](#input_type)                                                                   | The type of server to create. See the output of Hetzner's CLI hcloud command 'server-type list' for reference.                                                                                            | `string`                                                    | n/a                                                     |   yes    |

## Outputs

| Name                                                                                      | Description                                                    |
| ----------------------------------------------------------------------------------------- | -------------------------------------------------------------- |
| <a name="output_backups"></a> [backups](#output_backups)                                  | The new server's automatic backup setting (boolean).           |
| <a name="output_datacenter"></a> [datacenter](#output_datacenter)                         | The datacenter the new Hetzner Cloud server is provisioned in. |
| <a name="output_delete_protection"></a> [delete_protection](#output_delete_protection)    | Whether or not deletion protection is enabled for the server.  |
| <a name="output_firewall_ids"></a> [firewall_ids](#output_firewall_ids)                   | The firewall IDs the server is attached to.                    |
| <a name="output_id"></a> [id](#output_id)                                                 | The internal Hetzner ID for the server.                        |
| <a name="output_image"></a> [image](#output_image)                                        | The image used to create the Hetzner Cloud server.             |
| <a name="output_ipv4_address"></a> [ipv4_address](#output_ipv4_address)                   | The IPv4 address the server is configured with.                |
| <a name="output_ipv6_address"></a> [ipv6_address](#output_ipv6_address)                   | The IPv6 address the server is configured with.                |
| <a name="output_ipv6_network"></a> [ipv6_network](#output_ipv6_network)                   | The IPv6 network the server is configured in.                  |
| <a name="output_iso"></a> [iso](#output_iso)                                              | The ID or name of the mounted ISO image.                       |
| <a name="output_labels"></a> [labels](#output_labels)                                     | The labels attached to the new Hetzner Cloud server.           |
| <a name="output_location"></a> [location](#output_location)                               | The location of the Hetzner Cloud server.                      |
| <a name="output_name"></a> [name](#output_name)                                           | The name of the Hetzner Cloud server.                          |
| <a name="output_network"></a> [network](#output_network)                                  | The network the Hetzner Cloud server should be attached to.    |
| <a name="output_placement_group_id"></a> [placement_group_id](#output_placement_group_id) | The placement group's ID for the new server.                   |
| <a name="output_rebuild_protection"></a> [rebuild_protection](#output_rebuild_protection) | Whether or not rebuild protection is enabled for the server.   |
| <a name="output_server_type"></a> [server_type](#output_server_type)                      | The type of Hetzner Cloud server that was created.             |
| <a name="output_status"></a> [status](#output_status)                                     | The current server status.                                     |

<!-- END_TF_DOCS -->

### 🔃 Contributing

Refer to our [documentation for contributors][contributing] for contributing guidelines, commit message
formats and versioning tips.

### 📥 Maintainers

This project is owned and maintained by [FMJ Studios][org] refer to the [`AUTHORS`][authors] or [`CODEOWNERS`][owners]
for more information. You may also use the linked contact details to reach out directly.

### ©️ Copyright

- _Assets provided by:_ **[HashiCorp][hashicorp]**
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
[hashicorp]: https://www.hashicorp.com/
[hetzner]: https://hetzner.com

<!-- Third-party -->

[module]: https://registry.terraform.io/modules/terraform-hetzner-modules/compute/server/latest
[cloud-init]: https://cloudinit.readthedocs.io/en/latest/
