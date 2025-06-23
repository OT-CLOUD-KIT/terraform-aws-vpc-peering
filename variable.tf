# --------------------------------------
# Naming Convention Variables
# --------------------------------------

variable "bu" {
  description = "Business Unit name (e.g., finance, marketing)"
  type        = string
}

variable "program" {
  description = "Program or department name"
  type        = string
}

variable "app" {
  description = "Application name"
  type        = string
}

variable "env" {
  description = "Deployment environment (e.g., dev, prod, staging)"
  type        = string
}

variable "team" {
  description = "Team responsible for the resources"
  type        = string
}

# --------------------------------------
# VPC Peering Core Variables
# --------------------------------------

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

