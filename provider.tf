terraform {
  backend "gcs" {
    bucket = "iqbal-terraform-bucket-22"
    prefix = "terraformstate"
    credentials = "devops-gcp-project-296222-41ee350b7bd5.json"
  }
}

provider "google-beta" {
  credentials = file("devops-gcp-project-296222-41ee350b7bd5.json")
  project     = "devops-gcp-project-296222"
  version = "~> 3.0.0-beta.1"
}

