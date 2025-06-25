module "vpc_peering" {
  source = "git@github.com:OT-CLOUD-KIT/terraform-aws-vpc-peering.git?ref=feature"

  providers = {
    aws.requester = aws.requester
    aws.acceptor  = aws.acceptor
  }

  requester_vpc_id   = lookup(data.terraform_remote_state.requester_vpc.outputs, "vpc_id", null)
  requester_vpc_cidr = lookup(data.terraform_remote_state.requester_vpc.outputs, "vpc_cidr_block", null)
  requester_route_table_ids = compact(flatten([
    lookup(data.terraform_remote_state.requester_vpc.outputs, "public_route_table_id", []),
    lookup(data.terraform_remote_state.requester_vpc.outputs, "private_route_table_id", []),
    [lookup(data.terraform_remote_state.requester_vpc.outputs, "route_table_id", null)]
  ]))

  acceptor_vpc_id   = var.acceptor_vpc_name != "" ? data.aws_vpc.acceptor[0].id : null
  acceptor_vpc_cidr = var.acceptor_vpc_name != "" ? data.aws_vpc.acceptor[0].cidr_block : null
  acceptor_route_table_ids = compact(flatten([
    var.acceptor_public_rt_name != "" ? [data.aws_route_table.acceptor_public_rt[0].id] : [],
    var.acceptor_private_rt_name != "" ? [data.aws_route_table.acceptor_private_rt[0].id] : [],
  ]))


  bu               = var.bu
  program          = var.program
  team             = var.team
  app              = var.app
  env              = var.env
  peer_owner_id    = var.peer_owner_id
  requester_region = var.requester_region
  acceptor_region  = var.acceptor_region

}

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
