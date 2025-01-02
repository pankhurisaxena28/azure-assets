provider "google" {
  project = "pankhuri-test-proj-436319"
  region  = "us-central1"
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
