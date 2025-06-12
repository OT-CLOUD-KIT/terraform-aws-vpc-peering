output "vpc_peering_connection_id" {
  value = aws_vpc_peering_connection.this.id
}
output "requester_routes" {
  value = aws_route.requester_to_acceptor[*].id
}
output "acceptor_routes" {
  value = aws_route.acceptor_to_requester[*].id
}
