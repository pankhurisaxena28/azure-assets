provider "google" {
  project = "pankhuri-test-proj-436319"
  region  = "us-central1"
}

resource "google_storage_bucket" "test_bucket_bad" {
  name                        = "test-bucket-bad"
  location                    = "ASIA"
  storage_class               = "ARCHIVE"
  uniform_bucket_level_access = false


}
