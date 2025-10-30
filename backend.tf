terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "gitprasorg"

    workspaces {
      // Replace this with the name of your existing workspace
      name = "github-vcs-001"
    }
  }
}