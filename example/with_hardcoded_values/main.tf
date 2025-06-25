module "naming" {
  source   = "git@github.com:OT-CLOUD-KIT/terraform-aws-naming.git?ref=dev"
  bu       = var.bu
  env      = var.env
  app      = var.app
  tenant   = var.tenant
  resource = var.resource
}

module "standard_tags" {
  source = "git@github.com:OT-CLOUD-KIT/terraform-aws-standard-tagging.git?ref=dev"

  bu      = var.bu
  program = var.program
  app     = var.app
  team    = var.team
  region  = var.requester_region
  env     = var.env
}



module "vpc_peering" {
  source = "git@github.com:OT-CLOUD-KIT/terraform-aws-vpc-peering.git?ref=feature"

  requester_vpc_id = var.requester_vpc_id
  acceptor_vpc_id  = var.acceptor_vpc_id

  requester_vpc_cidr = var.requester_vpc_cidr
  acceptor_vpc_cidr  = var.acceptor_vpc_cidr

  requester_route_table_ids = var.requester_route_table_ids
  acceptor_route_table_ids  = var.acceptor_route_table_ids

  requester_region = var.requester_region
  acceptor_region  = var.acceptor_region

  peer_owner_id = var.peer_owner_id
  bu            = var.bu
  program       = var.program
  team          = var.team
  app           = var.app
  env           = var.env
  providers = {
    aws.requester = aws.requester
    aws.acceptor  = aws.acceptor
  }
}




