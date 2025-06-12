variable "requester_vpc_id" {
  description = "VPC ID of the requester"
  type        = string
}

variable "acceptor_vpc_id" {
  description = "VPC ID of the acceptor"
  type        = string
}

variable "requester_vpc_cidr" {
  description = "CIDR block of the requester VPC"
  type        = string
}

variable "acceptor_vpc_cidr" {
  description = "CIDR block of the acceptor VPC"
  type        = string
}

variable "requester_route_table_ids" {
  description = "List of route table IDs for requester VPC"
  type        = list(string)
}

variable "acceptor_route_table_ids" {
  description = "List of route table IDs for acceptor VPC"
  type        = list(string)
}

variable "requester_region" {
  description = "AWS region of the requester"
  type        = string
  default     = "us-east-1"
}

variable "acceptor_region" {
  description = "AWS region of the acceptor"
  type        = string
  default     = "us-east-1"
}

variable "peer_owner_id" {
  description = "Peer AWS account ID (leave blank if same account)"
  type        = string
  default     = ""
}

variable "vpc_peering_connection_requester_name" {
  description = "Name for the VPC peering connection on the requester side"
  type        = string
  default     = "peering-requester"
}

variable "vpc_peering_connection_acceptor_name" {
  description = "Name for the VPC peering connection on the acceptor side"
  type        = string
  default     = "peering-acceptor"
}
