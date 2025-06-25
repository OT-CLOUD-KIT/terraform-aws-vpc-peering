data "terraform_remote_state" "requester_vpc" {
  backend = "s3"
  config = {
    bucket = var.requester_state_bucket
    key    = var.requester_state_key
    region = var.requester_state_region
  }
}

# Acceptor VPC by tag
data "aws_vpc" "acceptor" {
  count = var.acceptor_vpc_name != "" ? 1 : 0

  filter {
    name   = "tag:Name"
    values = [var.acceptor_vpc_name]
  }
}

# Acceptor route tables by tag
data "aws_route_table" "acceptor_public_rt" {
  count = var.acceptor_public_rt_name != "" ? 1 : 0

  filter {
    name   = "tag:Name"
    values = [var.acceptor_public_rt_name]
  }
}

data "aws_route_table" "acceptor_private_rt" {
  count = var.acceptor_private_rt_name != "" ? 1 : 0

  filter {
    name   = "tag:Name"
    values = [var.acceptor_private_rt_name]
  }
}


