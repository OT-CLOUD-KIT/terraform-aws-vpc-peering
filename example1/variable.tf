# Remote state for requester
variable "requester_state_bucket" {}
variable "requester_state_key" {}
variable "requester_state_region" {}

# Acceptor via data
variable "acceptor_vpc_name" {}

variable "acceptor_public_rt_name" {
  type    = string
  default = ""
}

variable "acceptor_private_rt_name" {
  type    = string
  default = ""
}

variable "acceptor_main_rt_name" {
  type    = string
  default = ""
}

# Common peering config
variable "requester_region" {}
variable "acceptor_region" {}
variable "peer_owner_id" { default = "" }
variable "vpc_peering_connection_requester_name" {}
variable "vpc_peering_connection_acceptor_name" {}
