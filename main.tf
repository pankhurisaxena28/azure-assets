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



resource "google_project_iam_member" "project_editor_violation" {
  project = "pankhuri-test-proj-436319" # Replace with your project ID
  role    = "roles/editor"    # This line violates the PRIMITIVE_ROLES_USED policy
  member  = "user:pankhurisaxena@google.com"
}
