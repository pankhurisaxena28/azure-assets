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

resource "google_storage_bucket" "test_bucket_bad" {
  name                        = "test-bucket-bad"
  location                    = "ASIA"
  parent                      = "pankhuri-test-proj-436319"
  storage_class               = "ARCHIVE"
  uniform_bucket_level_access = false



}
