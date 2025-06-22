requester_state_bucket = "ot-cloud-kit-bucket"
requester_state_key    = "ot/module/networkskeleton/terraform.tfstate"
requester_state_region = "us-east-1"

acceptor_vpc_name         = "vpc-A"
acceptor_public_rt_name   = "public-rt-1"
acceptor_private_rt_name  = ""   # ← use empty string, not null
acceptor_main_rt_name     = ""   # ← use empty string, not null

requester_region = "us-east-1"
acceptor_region  = "us-east-1"

vpc_peering_connection_requester_name = "peer-to-vpc2"
vpc_peering_connection_acceptor_name  = "accept-from-vpc1"
