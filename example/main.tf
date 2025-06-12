module "vpc_peering" {
  source = "../"

  requester_vpc_id             = var.requester_vpc_id
  acceptor_vpc_id              = var.acceptor_vpc_id

  requester_vpc_cidr           = var.requester_vpc_cidr
  acceptor_vpc_cidr            = var.acceptor_vpc_cidr

  requester_route_table_ids    = var.requester_route_table_ids
  acceptor_route_table_ids     = var.acceptor_route_table_ids

  requester_region             = var.requester_region
  acceptor_region              = var.acceptor_region

  peer_owner_id                = var.peer_owner_id

  vpc_peering_connection_requester_name = var.vpc_peering_connection_requester_name
  vpc_peering_connection_acceptor_name  = var.vpc_peering_connection_acceptor_name

  providers = {
    aws.requester = aws.requester
    aws.acceptor  = aws.acceptor
  }
}
