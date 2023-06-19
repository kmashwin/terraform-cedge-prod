terraform {
  required_providers {
    coxedge = {
      version = "0.4.5"
      source  = "coxedge/coxedge"

    }
  }
}

provider "coxedge" {
  key = var.coxedge_api_key
}

# data "coxedge_organizations" "orgs" {
# }

resource "coxedge_environment" "demo_env" {
  name                  = "terraform-test"
  description           = "description-of-the-environment"
  service_connection_id = "a572df45-56fa-4521-8a66-b63b5ab19c21"
  organization_id       = var.coxedge_organization_id
}

