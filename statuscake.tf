provider "statuscake" {
  username = "kamranali95hotmailcom"
  apikey = var.status_cake
}

resource "statuscake_test" "googlecloudruntest" {
  website_name = "Test"
  website_url = google_cloud_run_service.default.status[0].url
  test_type = "HTTP"
  check_rate = 300
  contact_group = ["195492"]
}