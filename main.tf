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

resource "google_storage_bucket" "test_bucket" {
  name                        = "test-bucket"
  location                    = "ASIA"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = false
}

resource "azurerm_network_security_group" "test_network_security_group" {
  name                = "test-network-security-group"
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
