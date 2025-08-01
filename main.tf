provider "google" {
  project = "pankhuri-test-proj-436319"
  region  = "us-central1"
}
provider "azurerm" {
    subscription_id = "5b87efeb-4ef9-40ca-8cb4-cfa6d2cd0351"
    tenant_id = "a162027e-b677-4249-b759-a9e6efa41922"
    features {
    }
}


resource "google_storage_bucket" "test_bucket_pankhuri" {
  project                     = "pankhuri-test-proj-436319"
  name                        = "test-bucket-pankhuri"
  location                    = "ASIA"
  storage_class               = "ARCHIVE"
  uniform_bucket_level_access = false
}

resource "google_bigquery_dataset" "default" {
  dataset_id                  = "mydataset"
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = "us-east-1"
  default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }
}

resource "google_kms_key_ring" "my_key_ring" {
  name     = "my-key-ring-public"
  location = "global"
}

resource "google_kms_key_ring_iam_binding" "public_key_ring_binding_all_users" {
  key_ring_id = google_kms_key_ring.my_key_ring.id
  role        = "roles/cloudkms.viewer" # Or any other role that grants access
  members = ["allUsers"]
}

resource "google_kms_key_ring_iam_binding" "public_key_ring_binding_all_authenticated_users" {
    key_ring_id = google_kms_key_ring.my_key_ring.id
    role = "roles/cloudkms.cryptoKeyEncrypter"
    members = ["allAuthenticatedUsers"]
}

resource "azurerm_network_security_group" "test_network_security_group_pankhuri" {
  name                = "test-network-security-group-pankhuri"
  location            = "westeurope"
  resource_group_name = "iac-rego-testing"

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = 8080
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}

