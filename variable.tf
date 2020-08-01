variable "requester_region" {
  description = "The region of the requester VPC."
  default = "us-east-1"
}

variable "peer_accepter_region" {
  description = "The region of the accepter VPC."
  default = "us-east-2"
}

variable "requester_vpc_cidr" {
  description = "The CIDR of the requester VPC."
  default = "10.0.0.0/16"
}

variable "accepter_vpc_cidr" {
  description = "The CIDR of the accepter VPC."
  default = "172.31.0.0/16"
}

variable "vpc_peering_connection_requester_name" {
  description = "The NAME of the requester VPC peering connection"
  default = "requester"
}

variable "vpc_peering_connection_accepter_name" {
  description = "The NAME of the accepter VPC peering connection"
  default = "accepter"
}
