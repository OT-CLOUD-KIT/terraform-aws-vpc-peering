variable "name" {
  type        = string
  description = "Base name for tagging resources"
}

variable "create_vpcs" {
  type        = bool
  default     = true
}

variable "requester_vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "acceptor_vpc_cidr" {
  type        = string
  default     = "10.1.0.0/16"
}

variable "requester_vpc_id" {
  type        = string
  default     = ""
}

variable "acceptor_vpc_id" {
  type        = string
  default     = ""
}

variable "requester_route_table_ids" {
  type        = list(string)
  default     = []
}

variable "acceptor_route_table_ids" {
  type        = list(string)
  default     = []
}

variable "peer_owner_id" {
  type        = string
  default     = ""
}

variable "acceptor_region" {
  type        = string
}

variable "auto_accept" {
  type        = bool
  default     = true
}
