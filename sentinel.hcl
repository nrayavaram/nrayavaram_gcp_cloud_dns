
module "tfplan-functions" {
    source = "./common-functions/tfplan-functions/tfplan-functions.sentinel"
}

module "tfstate-functions" {
    source = "./common-functions/tfstate-functions/tfstate-functions.sentinel"
}

module "tfconfig-functions" {
    source = "./common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "./mock/mock-tfplan-v2.sentinel"
  }
}

policy "google_compute_firewall" {
    source = "./network_gcp_dns_log_enforce.sentinel"
    enforcement_level = "advisory"
}