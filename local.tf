locals {
  # Standard naming convention used across all resources
  base_name = "${var.bu}-${var.program}-${var.app}-${var.env}"

  common_tags = {
    "BusinessUnit" = var.bu
    "Program"      = var.program
    "Application"  = var.app
    "Environment"  = var.env
    "Team"         = var.team
    "requester_region"    = var.requester_region
    "ManagedBy"    = "Terraform"
  }

  cross_account = var.peer_owner_id != null && var.peer_owner_id != ""
  cross_region  = var.requester_region != var.acceptor_region
}
