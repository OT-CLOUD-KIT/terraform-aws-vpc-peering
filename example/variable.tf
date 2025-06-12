variable "requester_vpc_id" {
  description = "The VPC ID of the requester VPC"
  type        = string
}

variable "acceptor_vpc_id" {
  description = "The VPC ID of the acceptor VPC"
  type        = string
}

variable "requester_vpc_cidr" {
  description = "The CIDR block of the requester VPC"
  type        = string
}

variable "acceptor_vpc_cidr" {
  description = "The CIDR block of the acceptor VPC"
  type        = string
}

variable "requester_route_table_ids" {
  description = "List of route table IDs associated with the requester VPC"
  type        = list(string)
}

variable "acceptor_route_table_ids" {
  description = "List of route table IDs associated with the acceptor VPC"
  type        = list(string)
}

variable "requester_region" {
  description = "The AWS region where the requester VPC is located"
  type        = string
  default     = "us-east-1"
}

variable "acceptor_region" {
  description = "The AWS region where the acceptor VPC is located"
  type        = string
  default     = "us-east-1"
}

variable "peer_owner_id" {
  description = "AWS Account ID of the peer (leave blank for same-account VPC peering)"
  type        = string
  default     = ""
}

variable "vpc_peering_connection_requester_name" {
  description = "Name tag for the requester side of the VPC peering connection"
  type        = string
  default     = "peering-requester"
}

variable "vpc_peering_connection_acceptor_name" {
  description = "Name tag for the acceptor side of the VPC peering connection"
  type        = string
  default     = "peering-acceptor"
}