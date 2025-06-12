variable "region" {
  type = string
}

variable "name" {
  type = string
}

variable "create_vpcs" {
  type    = bool
  default = false
}

variable "requester_vpc_id" {
  type = string
}

variable "acceptor_vpc_id" {
  type = string
}

variable "requester_vpc_cidr" {
  type = string
}

variable "acceptor_vpc_cidr" {
  type = string
}

variable "requester_route_table_ids" {
  type = list(string)
}

variable "acceptor_route_table_ids" {
  type = list(string)
}

variable "peer_owner_id" {
  type    = string
  default = ""
}

variable "auto_accept" {
  type    = bool
  default = true
}

variable "requester_region" {
  type = string
}

variable "acceptor_region" {
  type = string
}
