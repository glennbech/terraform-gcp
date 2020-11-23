provider "github" {
  token = var.github_token
  owner = iqbkam18
  organization = "terraform-example"
}

resource "github_repository" "example-repo" {
  name        = "example-repo"
  description = "This is my new repository with terraform"
}



