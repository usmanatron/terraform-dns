terraform {
    required_providers {
        ovh = {
            source = "ovh/ovh"
            version = "0.16.0"
        }
    }
}

locals {
  entries = jsondecode(var.records)
}

# Add a record to a sub-domain
resource "ovh_domain_zone_record" "test" {
    for_each = local.entries

    zone = var.zone
    subdomain = each.value.subdomain
    fieldtype = each.value.type
    target = each.value.target
}
