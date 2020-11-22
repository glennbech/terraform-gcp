resource "google_cloud_run_service" "default" {
  name = "cloudrun-srv2"
  location = "europe-north1"
  project = "devops-gcp-project-296222"

  template {
    spec {
      containers {
        image = "gcr.io/devops-gcp-project-296222/devops-gcp-project@sha256:992c6d8ae3083322541afdbde112bff79bf5e69c50795b6a4342ca8479c9c26e"
        resources {
          limits = {
            memory = "512Mi"
          }
          env {
          name = "LOGZ_TOKEN"
          value = var.logz_token
        }
      }
    }
  }



  traffic {
    percent = 100
    latest_revision = true
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.default.location
  project = google_cloud_run_service.default.project
  service = google_cloud_run_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}