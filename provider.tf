provider "google-beta" {
  credentials = file("devops-gcp-project-296222-41ee350b7bd5.json.enc")
  project     = "devops-2020-29541"
  version = "~> 3.0.0-beta.1"
}