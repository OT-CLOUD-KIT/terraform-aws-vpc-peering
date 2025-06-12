output "vpc_peering_connection_id" {
  value = aws_vpc_peering_connection.peer.id
}

output "requester_vpc_id" {
  value = local.requester_vpc_id
}

output "acceptor_vpc_id" {
  value = local.acceptor_vpc_id
}
