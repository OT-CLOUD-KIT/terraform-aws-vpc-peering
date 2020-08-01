variable "requester_region" {
  description = "The region of the requester VPC."
  default = "us-east-1"
}

variable "peer_acceptor_region" {
  description = "The region of the acceptor VPC."
  default = "us-east-2"
}

variable "requester_vpc_cidr" {
  description = "The CIDR of the requester VPC."
  default = "10.0.0.0/16"
}

variable "acceptor_vpc_cidr" {
  description = "The CIDR of the acceptor VPC."
  default = "172.31.0.0/16"
}

variable "vpc_peering_connection_requester_name" {
  description = "The NAME of the requester VPC peering connection"
  default = "requester"
}

variable "vpc_peering_connection_acceptor_name" {
  description = "The NAME of the acceptor VPC peering connection"
  default = "acceptor"
}
