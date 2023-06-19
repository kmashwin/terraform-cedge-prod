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


# Environment

# data "coxedge_organizations" "orgs" {
# }

resource "coxedge_environment" "demo_env" {
  name                  = "terraform-test"
  description           = "description-of-the-environment"
  service_connection_id = var.service_connection_id_edge_compute
  organization_id       = var.coxedge_organization_id
}

