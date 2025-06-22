terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
  }
}

provider "aws" {
  alias  = "requester"
  region = var.requester_region
}

provider "aws" {
  alias  = "acceptor"
  region = var.acceptor_region
}