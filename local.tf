locals {
  # Standard naming convention used across all resources
  base_name = "${var.env}-${var.app}"

  common_tags = {
  env = var.env
  owner =  var.owner
  app = var.app 
  }

  cross_account = var.peer_owner_id != null && var.peer_owner_id != ""
  cross_region  = var.requester_region != var.acceptor_region
}
