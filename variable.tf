# --------------------------------------
# Naming Convention Variables
# --------------------------------------



variable "app" {
  description = "Application name"
  type        = string
  default = "otcloud-kit"
}

variable "env" {
  description = "Deployment environment (e.g., dev, prod, staging)"
  type        = string
  default = "dev"
}

variable "owner" {
  type = string
  default = "opstree"
}

# --------------------------------------
# VPC Peering Core Variables
# --------------------------------------

variable "requester_vpc_id" {
  description = "VPC ID of the requester"
  type        = string
  default = "vpc-0d76a177b1c5df301"
}

variable "acceptor_vpc_id" {
  description = "VPC ID of the acceptor"
  type        = string
  default = "vpc-0bfa15004ff55e107"
}

variable "requester_vpc_cidr" {
  description = "CIDR block of the requester VPC"
  type        = string
  default = "10.1.0.0/16"
}

variable "acceptor_vpc_cidr" {
  description = "CIDR block of the acceptor VPC"
  type        = string
  default = "172.31.0.0/16"
}

variable "requester_route_table_ids" {
  description = "List of route table IDs for requester VPC"
  type        = list(string)
  default = [ "rtb-0bba85668091331a0" ]
}

variable "acceptor_route_table_ids" {
  description = "List of route table IDs for acceptor VPC"
  type        = list(string)
  default = [ "rtb-0f05d6fd762bf3a45" ]
}

# --------------------------------------
# Cross-Region / Cross-Account Configs
# --------------------------------------

variable "requester_region" {
  description = "AWS region of the requester VPC"
  type        = string
  default     = "us-east-1"
}

variable "acceptor_region" {
  description = "AWS region of the acceptor VPC"
  type        = string
  default     = "us-east-1"
}

variable "peer_owner_id" {
  description = "Peer AWS account ID (leave blank if same account)"
  type        = string
  default     = ""
}

