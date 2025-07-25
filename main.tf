provider "google" {
  project = "pankhuri-test-proj-436319"
  region  = "us-central1"
}

resource "google_storage_bucket" "test_bucket_pankhuri" {
  project                     = "pankhuri-test-proj-436319"
  name                        = "test-bucket-pankhuri"
  location                    = "EU"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = false
  logging {
    log_bucket   = "my-unique-logging-bucket" // Create a separate bucket for logs
    log_object_prefix = "tf-logs/"             // Optional prefix for better structure
  }
}


