terraform {
  backend "gcs" {
    bucket = "pgr301-terraform-state"
    prefix = "terraformstate-10008"
    credentials = "devops-gcp-project-296222-41ee350b7bd5.json"
  }
}


provider "google-beta" {
  credentials = file("devops-gcp-project-296222-41ee350b7bd5.json")
  project = "terraform-292215"
  version = "~> 3.0.0-beta.1"
}






