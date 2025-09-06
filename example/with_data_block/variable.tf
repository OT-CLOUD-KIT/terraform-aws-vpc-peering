# ========== Remote state for requester VPC ==========
variable "requester_state_bucket" {
  description = "S3 bucket name for requester VPC's remote state"
  type        = string
}

variable "requester_state_key" {
  description = "Key (path) for the requester VPC's remote state file"
  type        = string
}

variable "requester_state_region" {
  description = "AWS region where the requester's remote state bucket resides"
  type        = string
}

# ========== Acceptor VPC information ==========
variable "acceptor_vpc_name" {
  description = "Name tag of the acceptor VPC to search via data source"
  type        = string
}

variable "acceptor_public_rt_name" {
  description = "Name tag of the acceptor's public route table"
  type        = string
  default     = ""
}

variable "acceptor_private_rt_name" {
  description = "Name tag of the acceptor's private route table"
  type        = string
  default     = ""
}

variable "acceptor_main_rt_name" {
  description = "Name tag of the acceptor's main route table (optional)"
  type        = string
  default     = ""
}

# ========== Common Peering Configuration ==========
variable "requester_region" {
  description = "Region of the requester VPC"
  type        = string
}

variable "acceptor_region" {
  description = "Region of the acceptor VPC"
  type        = string
}

variable "peer_owner_id" {
  description = "AWS account ID of the acceptor VPC owner (if cross-account)"
  type        = string
  default     = ""
}



# ========== Naming Convention Inputs ==========
variable "env" {
  type =  string
  default = "dev"
  
}



variable "owner" {
  type = string
  default = "opstree"
}

variable "app" {
  type = string
  default = "otcloud-kit"
}

