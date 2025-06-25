output "vpc_peering_connection_id" {
  value = module.vpc_peering.vpc_peering_connection_id
}

output "requester_routes" {
  value = module.vpc_peering.requester_routes
}

output "acceptor_routes" {
  value = module.vpc_peering.acceptor_routes
}
