provider "aws" {
  region = var.requester_region
  # Requester's credentials.
}

provider "aws" {
  alias  = "peer"
  region = var.peer_accepter_region
  # Accepter's credentials.
}

# Create requester VPC
resource "aws_vpc" "main" {    
  cidr_block = var.requester_vpc_cidr
}

data "aws_route_table" "requester" {
  vpc_id = aws_vpc.main.id
}

# Create accepter VPC
resource "aws_vpc" "peer" {
  provider   = aws.peer
  cidr_block = var.accepter_vpc_cidr
}

data "aws_route_table" "accepter" {
  vpc_id = aws_vpc.peer.id 
  provider   = aws.peer
}

data "aws_caller_identity" "peer" {
  provider = aws.peer
}

# Requester's side of the connection.
resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = aws_vpc.main.id  
  peer_vpc_id   = aws_vpc.peer.id     
  peer_owner_id = data.aws_caller_identity.peer.account_id
  peer_region   = var.peer_accepter_region
  auto_accept   = false

  tags = {
    Name = var.vpc_peering_connection_requester_name
  }
}

# Accepter's side of the connection.
resource "aws_vpc_peering_connection_accepter" "peer" {
  provider                  = aws.peer
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  auto_accept               = true

  tags = {
    Name = var.vpc_peering_connection_accepter_name
  }
}

# Create routes from requester to Accepter 
resource "aws_route" "requestor" {
  route_table_id             = data.aws_route_table.requester.id 
  destination_cidr_block     = aws_vpc.peer.cidr_block
  vpc_peering_connection_id  = aws_vpc_peering_connection.peer.id
}

# Create routes from accepter to Requester
resource "aws_route" "acceptor" {
  provider                    = aws.peer
  route_table_id              = data.aws_route_table.accepter.id  
  destination_cidr_block      = aws_vpc.main.cidr_block  
  vpc_peering_connection_id   = aws_vpc_peering_connection.peer.id
}
