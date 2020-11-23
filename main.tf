resource "google_cloud_run_service" "default" {
  name = "cloudrun-srv2"
  location = "europe-north1"
  project = "devops-gcp-project-296222"

  template {
    spec {
      containers {
        image = "gcr.io/devops-gcp-project-296222/devops-gcp-project@sha256:db58acc00ed4d4980715b99c4baa0cdf2a8d200d36fd5abb300763d67d0711bc"
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