terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.65.0"
    }
  }
}

provider "tfe" {}

module "random_pets_project" {
  source  = "alexbasista/projecter/tfe"
  version = "0.1.1"

  organization = var.organization
  project_name = "random-pets-application"

  team_access = {
    platform-team        = "admin"
    random-pets-app-team = "write"
  }
}