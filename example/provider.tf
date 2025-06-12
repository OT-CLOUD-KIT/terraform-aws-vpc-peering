

provider "aws" {
  alias  = "requester"
  region = var.requester_region
}

provider "aws" {
  alias  = "acceptor"
  region = var.acceptor_region
}
