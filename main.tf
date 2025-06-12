# =====================
# MODULE: main.tf
# =====================

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
      configuration_aliases = [aws.requester, aws.acceptor]
    }
  }
}  

locals {
  cross_account = var.peer_owner_id != null && var.peer_owner_id != ""
  cross_region  = var.acceptor_region != var.requester_region
}

resource "aws_vpc_peering_connection" "this" {
  provider        = aws.requester
  vpc_id          = var.requester_vpc_id
  peer_vpc_id     = var.acceptor_vpc_id

  peer_owner_id   = var.peer_owner_id != "" ? var.peer_owner_id : null
  peer_region     = var.requester_region != var.acceptor_region ? var.acceptor_region : null

  auto_accept     = false

  tags = {
    Name = var.vpc_peering_connection_requester_name
  }
}

resource "aws_vpc_peering_connection_accepter" "this" {
  provider                  = aws.acceptor
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
  auto_accept               = true

  tags = {
    Name = var.vpc_peering_connection_acceptor_name
  }
}

resource "aws_route" "requester_to_acceptor" {
  provider                  = aws.requester
  count                     = length(var.requester_route_table_ids)
  route_table_id            = var.requester_route_table_ids[count.index]
  destination_cidr_block    = var.acceptor_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
}

resource "aws_route" "acceptor_to_requester" {
  provider                  = aws.acceptor
  count                     = length(var.acceptor_route_table_ids)
  route_table_id            = var.acceptor_route_table_ids[count.index]
  destination_cidr_block    = var.requester_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
}