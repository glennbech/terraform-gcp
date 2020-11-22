resource "google_cloud_run_service" "default" {
  name = "cloudrun-srv2"
  location = "europe-north1"
  project = "devops-gcp-project-296222"

  template {
    spec {
      containers {
        image = "eu.gcr.io/devops-gcp-project-296222/dev-ops/devops-service@sha256:2343dd63efa61e51159b1785439b3bbdc898ec35204fea30c12035f9eef39450"
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