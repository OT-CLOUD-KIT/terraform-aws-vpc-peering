# =============================
# MODULE: modules/vpc_peering/main.tf
# =============================

provider "aws" {
  alias  = "peer"
  region = var.acceptor_region
}

data "aws_caller_identity" "requester" {}
data "aws_caller_identity" "peer" {
  provider = aws.peer
}

# Use existing or create requester VPC
resource "aws_vpc" "requester" {
  count      = var.create_vpcs ? 1 : 0
  cidr_block = var.requester_vpc_cidr
  tags       = { Name = "${var.name}-requester-vpc" }
}

resource "aws_vpc" "acceptor" {
  count      = var.create_vpcs ? 1 : 0
  provider   = aws.peer
  cidr_block = var.acceptor_vpc_cidr
  tags       = { Name = "${var.name}-acceptor-vpc" }
}

locals {
  requester_vpc_id = var.create_vpcs ? aws_vpc.requester[0].id : var.requester_vpc_id
  acceptor_vpc_id  = var.create_vpcs ? aws_vpc.acceptor[0].id  : var.acceptor_vpc_id
  peer_owner_id    = var.peer_owner_id != "" ? var.peer_owner_id : data.aws_caller_identity.peer.account_id
}

resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = local.requester_vpc_id
  peer_vpc_id   = local.acceptor_vpc_id
  peer_owner_id = local.peer_owner_id
  auto_accept   = var.auto_accept

  # Conditionally assign peer_region
  peer_region = var.auto_accept ? null : var.acceptor_region

  tags = {
    Name = "${var.name}-peering"
  }
}


resource "aws_vpc_peering_connection_accepter" "peer" {
  count                     = var.auto_accept ? 0 : 1
  provider                  = aws.peer
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  auto_accept               = true
  tags                     = { Name = "${var.name}-accepter" }
}

resource "aws_route" "requester_to_acceptor" {
  count = length(var.requester_route_table_ids)

  route_table_id            = var.requester_route_table_ids[count.index]
  destination_cidr_block    = var.acceptor_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

resource "aws_route" "acceptor_to_requester" {
  count    = var.auto_accept ? length(var.acceptor_route_table_ids) : 0
  provider = aws.peer

  route_table_id            = var.acceptor_route_table_ids[count.index]
  destination_cidr_block    = var.requester_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}
