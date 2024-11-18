locals {
  x86_intel_types     = ["cx11", "cx21", "cx31", "cx41", "cx51"]
  x86_amd_types       = ["cpx11", "cpx21", "cpx31", "cpx41", "cpx51"]
  x86_dedicated_types = ["ccx13", "ccx23", "ccx33", "ccx43", "ccx53", "ccx63"]

  arm_types = ["cax11", "cax21", "cax31", "cax41"]
  x86_types = concat(local.x86_intel_types, local.x86_amd_types, local.x86_dedicated_types)
}

#--------------------------------------
# OS Image
#--------------------------------------

locals {
  is_x86 = contains(local.x86_types, var.type)
  is_arm = contains(local.arm_types, var.type)

  arch = local.is_x86 ? "x86" : local.is_arm ? "arm" : "x86"
}

data "hcloud_image" "os" {
  name              = var.image
  with_architecture = local.arch
}

#--------------------------------------
# Machine Location
#--------------------------------------

locals {
  datacenter_map = {
    ash = {
      suffix = "dc1"
    }

    hil = {
      suffix = "dc1"
    }

    hel1 = {
      suffix = "dc2"
    }

    nbg1 = {
      suffix = "dc3"
    }

    fsn1 = {
      suffix = "dc14"
    }
  }

  suffixed_datacenter = format("${var.location}-%s", local.datacenter_map[var.location].suffix)
}
