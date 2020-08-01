provider "aws" {
  region = var.requester_region
  # Requester's credentials.
}

provider "aws" {
  alias  = "peer_acceptor_provider"
  region = var.acceptor_region
  # Acceptor's credentials.
}

# Create requester VPC
resource "aws_vpc" "requester_vpc" {    
  cidr_block = var.requester_vpc_cidr
}

data "aws_route_table" "requester_rt" {
  vpc_id = aws_vpc.requester_vpc.id
}

# Create acceptor VPC
resource "aws_vpc" "acceptor_vpc" {
  provider   = aws.peer_acceptor_provider
  cidr_block = var.acceptor_vpc_cidr
}

data "aws_route_table" "acceptor_rt" {
  vpc_id = aws_vpc.acceptor_vpc.id 
  provider   = aws.peer_acceptor_provider
}

data "aws_caller_identity" "peer" {
  provider = aws.peer_acceptor_provider
}

# Requester's side of the connection.
resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = aws_vpc.requester_vpc.id  
  peer_vpc_id   = aws_vpc.acceptor_vpc.id     
  peer_owner_id = data.aws_caller_identity.peer.account_id
  peer_region   = var.peer_acceptor_region
  auto_accept   = false

  tags = {
    Name = var.vpc_peering_connection_requester_name
  }
}

# acceptor's side of the connection.
resource "aws_vpc_peering_connection_accepter" "peer" {
  provider                  = aws.peer_acceptor_provider
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  auto_accept               = true

  tags = {
    Name = var.vpc_peering_connection_acceptor_name
  }
}

# Create routes from requester to acceptor 
resource "aws_route" "requestor" {
  route_table_id             = data.aws_route_table.requester_rt.id 
  destination_cidr_block     = aws_vpc.acceptor_vpc.cidr_block
  vpc_peering_connection_id  = aws_vpc_peering_connection.peer.id
}

# Create routes from acceptor to Requester
resource "aws_route" "acceptor" {
  provider                    = aws.peer_acceptor_provider
  route_table_id              = data.aws_route_table.acceptor_rt.id  
  destination_cidr_block      = aws_vpc.requester_vpc.cidr_block  
  vpc_peering_connection_id   = aws_vpc_peering_connection.peer.id
}
