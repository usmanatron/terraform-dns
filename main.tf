terraform {
  backend "swift" {
    region_name         = "UK"
    auth_url            = "https://auth.cloud.ovh.net/v3"
    user_domain_name    = "Default"
    project_domain_name = "Default"
    
    container           = "terraformstate"
    archive_container   = "terraformstate-archive"
    state_name          = "tf-ovhdns/terraform.tfstate"

  }
  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "0.16.0"
    }
  }
}

provider "ovh" {
  endpoint = "ovh-eu"
  # Configuration via environment Variables
}

module "dns-records" {
  for_each = {
    usmanatron_co_uk = "usmanatron.co.uk"
  }

  source = "./modules/dns-records"

  zone    = each.value
  records = file("./records/${each.value}.json")
}
