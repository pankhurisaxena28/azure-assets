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
  location                    = "EU"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
  logging {
    log_bucket   = "my-unique-logging-bucket" // Create a separate bucket for logs
    log_object_prefix = "tf-logs/"             // Optional prefix for better structure
  }
}

resource "google_bigquery_dataset" "default" {
  dataset_id                  = "mydataset"
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = "us-east-2"
  default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }
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
    destination_address_prefix = "8000"
  }

  tags = {
    environment = "Production"
  }
}

