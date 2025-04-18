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

module "random_pets_1_mgmt_ws" {
  source  = "alexbasista/workspacer/tfe"
  version = "0.12.0"

  organization   = var.organization
  workspace_name = "random-pets-mgmt-ws"
  workspace_desc = "Workspace mananging all other Workspaces in this project as code."
  workspace_tags = ["mgmt"]
  project_name   = "random-pets-application"
}