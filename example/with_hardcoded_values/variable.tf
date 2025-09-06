variable "requester_vpc_id" {
  description = "The VPC ID of the requester VPC"
  type        = string
  default = "vpc-0d76a177b1c5df301"
}

variable "acceptor_vpc_id" {
  description = "The VPC ID of the acceptor VPC"
  type        = string
  default = "vpc-0bfa15004ff55e107"
}

variable "requester_vpc_cidr" {
  description = "The CIDR block of the requester VPC"
  type        = string
  default = "10.1.0.0/16"
}

variable "acceptor_vpc_cidr" {
  description = "The CIDR block of the acceptor VPC"
  type        = string
  default = "172.31.0.0/16"
}

variable "requester_route_table_ids" {
  description = "List of route table IDs associated with the requester VPC"
  type        = list(string)
  default = [ "rtb-0bba85668091331a0" ]
}

variable "acceptor_route_table_ids" {
  description = "List of route table IDs associated with the acceptor VPC"
  type        = list(string)
  default = [ "rtb-0f05d6fd762bf3a45" ]
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



# ========== Naming Convention Inputs ==========
variable "env" {
  type = string
  default = "dev"
  
}

variable "owner" {
  type = string
  default = "Opstree"
}

variable "app" {
  type = string
  default = "otcloudkit"
}