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


# Workloads
resource "coxedge_workload" "test" {
  name               = "test-vm"
  organization_id    = var.coxedge_organization_id
  environment_name   = coxedge_environment.demo_env.name
  type               = "VM"
  image              = "stackpath-edge/ubuntu-2204-jammy:v202204272102"
  specs              = "SP-2"
  first_boot_ssh_key = var.first_boot_ssh_key
  deployment {
    name               = "test-vm-cox"
    enable_autoscaling = false
    pops               = ["TUL"]
    instances_per_pop  = 1
  }

  timeouts {
    create = "20m"
    update = "20m"
  }
}