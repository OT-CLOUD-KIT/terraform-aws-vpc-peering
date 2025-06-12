provider "aws" {
  region = var.region
}

provider "aws" {
  alias  = "peer"
  region = var.acceptor_region
}

module "vpc_peering" {
  source = "./Module"

  # input variables
  name                      = var.name
  create_vpcs               = var.create_vpcs
  requester_vpc_cidr        = var.requester_vpc_cidr
  acceptor_vpc_cidr         = var.acceptor_vpc_cidr
  requester_vpc_id          = var.requester_vpc_id
  acceptor_vpc_id           = var.acceptor_vpc_id
  requester_route_table_ids = var.requester_route_table_ids
  acceptor_route_table_ids  = var.acceptor_route_table_ids
  peer_owner_id             = var.peer_owner_id
  acceptor_region           = var.acceptor_region
  auto_accept               = var.auto_accept

  providers = {
    aws.requester = aws
    aws.acceptor  = aws.peer
  }
}
