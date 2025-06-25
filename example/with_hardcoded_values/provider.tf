provider "aws" {
  alias  = "requester"
  region = var.requester_region # Region for the requester side (e.g., where the resource is initiated from)
}

provider "aws" {
  alias  = "acceptor"
  region = var.acceptor_region # Region for the acceptor side (e.g., where the resource is accepted)
}
