provider "google" {
 access_token = var.access_token
 project = "airline1-sabre-wolverine"
}

resource "google_dns_managed_zone" "private-zone" {
  name        = "wf-us-prod-dns-gcp-res123"
  dns_name    = "wf-us-prod-dns-gcp-res123"
  description = "Example private DNS zone"
  labels = {
    foo = "bar"
  }

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = google_compute_network.network-1.id
    }
    networks {
      network_url = google_compute_network.network-2.id
    }
  }
}

resource "google_compute_network" "network-1" {
  name                    = "wf-us-prod-dns-gcp-net123"
  #mtu                     = 1500
  auto_create_subnetworks = false
  delete_default_routes_on_create = true
}

resource "google_compute_network" "network-2" {
  name                    = "wf-us-prod-dns-gcp-net223"
  #mtu                     = 1500
  auto_create_subnetworks = false
  delete_default_routes_on_create = true
}
