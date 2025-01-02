provider "google" {
  project = "pankhuri-test-proj-436319"
  region  = "us-central1"
}
provider "azurerm" {
    subscription_id = "5b87efeb-4ef9-40ca-8cb4-cfa6d2cd0351"
    tenant_id = "Google"
    features {
    }
}

resource "google_storage_bucket" "test_bucket_good" {
  name                        = "test-bucket-good-pankhuri"
  location                    = "EU"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
}
resource "google_storage_bucket" "test_bucket_bad" {
  name                        = "test-bucket-bad-pankhuri"
  location                    = "EU"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = false
}


resource "azurerm_network_security_group" "example" {
  name                = "acceptanceTestSecurityGroup1"
  location            = "westeurope"
  resource_group_name = "example-resources"

  security_rule {
    name                       = "test123"
    description                = "security_rule description"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    source_application_security_group_ids = ["acceptanceTestSecurityGroup1"]
  }

  tags = {
    environment = "Production"
  }
}
