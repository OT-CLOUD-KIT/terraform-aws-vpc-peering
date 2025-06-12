output "vpc_peering_connection_id" {
  description = "The ID of the VPC Peering Connection"
  value       = module.vpc_peering.vpc_peering_connection_id
}

output "requester_routes" {
  description = "Route IDs from requester to acceptor"
  value       = module.vpc_peering.requester_routes
}

output "acceptor_routes" {
  description = "Route IDs from acceptor to requester"
  value       = module.vpc_peering.acceptor_routes
}
