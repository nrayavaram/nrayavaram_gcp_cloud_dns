provider "google" {
 access_token = var.access_token
 project = "airline1-sabre-wolverine"
}

resource "google_dns_policy" "example-policy" {
  name                      = "wf-us-core-dns-gcp-res123"
  enable_inbound_forwarding = true

  enable_logging = null

  alternative_name_server_config {
    target_name_servers {
      ipv4_address    = "172.16.1.10"
      forwarding_path = "private"
    }
    target_name_servers {
      ipv4_address = "172.16.1.20"
    }
  }

  networks {
    network_url = google_compute_network.network-1.id
  }
  networks {
    network_url = google_compute_network.network-2.id
  }
}

resource "google_compute_network" "network-1" {
  name                    = "network-1"
  mtu                     = 1500
  auto_create_subnetworks = false
  delete_default_routes_on_create = true
}

resource "google_compute_network" "network-2" {
  name                    = "network-2"
  mtu                     = 1500
  auto_create_subnetworks = false
  delete_default_routes_on_create = true
}


